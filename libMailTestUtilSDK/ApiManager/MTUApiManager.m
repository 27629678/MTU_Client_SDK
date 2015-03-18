//
//  MTUApiManager.m
//  libMailTestUtilSDK
//
//  Created by H-YXH on 3/18/15.
//  Copyright (c) 2015 migo Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MTUErrorUtil.h"
#import "MTUApiManager.h"
#import "MTUApiDefines.h"
#import "MTUApiInternalObject.h"

NSString* kMTUPasteBoardDataType = @"com.netease.mail.mtusdk.pasteboard";
NSString* kMTUPasteBoardDictInfoData = @"com.netease.mail.mtusdk.dictinfodata";

NSString* kMailClientRegisterAppKey = @"mail_master";

NSString* kAppIDPasteBoardType = @"mailtestappidstype";

@interface MTUApiManager ()

@property (nonatomic, strong) NSString* nativeAppID;
@property (nonatomic, strong) NSString* nativeTestID;


@end

@implementation MTUApiManager {
    BOOL _isMailClientApp;
    
}

+ (instancetype)defaultManager
{
    static MTUApiManager* instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[MTUApiManager alloc] init];
    });
    
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _nativeAppID = kApiMailClientOpenUrlScheme;
        _nativeTestID = kApiMailClientTestUrlScheme;
    }
    
    return self;
}

- (BOOL)registerApp:(NSString *)appID
{
    if (appID.length == 0) {
        return NO;
    }
    
    _isMailClientApp = [appID isEqualToString:kMailClientRegisterAppKey];
    if (_isMailClientApp) {
        _appID = kApiMailClientTestUrlScheme;
    }
    else {
        _appID = appID;
    }
    
    return YES;
}

- (BOOL)isMailClientInstalled
{
    NSURL* url = [self urlForOpenMailClient];
    return [[UIApplication sharedApplication] canOpenURL:url];
}

- (BOOL)isMailClientSupportApi
{
    NSURL* url = [self urlForMailClientTest];
    return [[UIApplication sharedApplication] canOpenURL:url];
}

- (BOOL)openMailClient
{
    NSURL* url = [self urlForOpenMailClient];
    return [[UIApplication sharedApplication] openURL:url];
}

- (NSURL *)urlForOpenMailClient
{
    NSString* openUrlStr = [NSString stringWithFormat:@"%@://%@",
                            self.nativeAppID,
                            kApiMailClientApiParam];
    return [NSURL URLWithString:openUrlStr];
}

- (NSURL *)urlForMailClientTest
{
    NSString* openUrlStr = [NSString stringWithFormat:@"%@://%@",
                            self.nativeTestID,
                            kApiMailClientApiParam];
    return [NSURL URLWithString:openUrlStr];
}

- (NSError *)updateApp:(NSString *)appID testID:(NSString *)testID
{
    if (appID.length * testID.length == 0 ) {
        return [MTUErrorUtil errorWithType:MTUErrorType_InvalidParams];
    }
    
    self.nativeAppID = appID;
    self.nativeTestID = testID;
    
    return nil;
}

- (BOOL)isMailClientApp
{
    return _isMailClientApp;
}

- (BOOL)handleUrl:(NSURL *)url delegate:(id<MTUApiDeleagte>)delegate
{
    NSString* scheme = [url scheme];
    if (self.appID.length == 0) {
        NSLog(@"App registe error: appid is nil.");
        return NO;
    }
    
    if (![scheme hasPrefix:self.appID]) {
        return NO;
    }
    
    [self handleWithDelegate:delegate];
    
    return YES;
}

- (void)handleWithDelegate:(id<MTUApiDeleagte>)delegate
{
    id data = [self getDataFromPasteBoard];
    if (!data) {
        return;
    }
    
    NSLog(@"Handle Url->Data Type:%@", data);
}

- (BOOL)sendReq:(MTUBaseReq *)request
{
    if (request.fromAppID.length == 0 ||
        request.toAppID.length == 0) {
        assert(NO);
        return NO;
    }
    
    BOOL success = [self setDataToPasteBoard:request];
    if (!success) {
        return NO;
    }
    
    NSURL* url = [self urlForMailClientTest];
    return [[UIApplication sharedApplication] openURL:url];
}

- (BOOL)sendResp:(MTUBaseResp *)response
{
    return YES;
}

#pragma mark - process ui paste board data

- (UIPasteboard *)sharedPasteBoard
{
    return [UIPasteboard generalPasteboard];
}

- (BOOL)setDataToPasteBoard:(id)message
{
    if (![message isValid]) {
        return NO;
    }
    
    UIPasteboard* pasteBoard = [self sharedPasteBoard];
    [pasteBoard setPersistent:YES];
    
    NSData* data = [[self sharedPasteBoard] dataForPasteboardType:kMTUPasteBoardDataType];
    NSMutableDictionary* dictInfo = nil;
    
    if (data) {
        dictInfo = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    }
    
    if (!dictInfo) {
        dictInfo = [NSMutableDictionary dictionary];
    }
    
    NSDictionary* dict = [message encodeToNSDict];
    [dictInfo setValue:dict forKey:kMTUPasteBoardDictInfoData];
    
    data = [NSKeyedArchiver archivedDataWithRootObject:dictInfo];
    [pasteBoard setData:data forPasteboardType:kMTUPasteBoardDataType];
    
    return YES;
}

- (id)getDataFromPasteBoard
{
    NSData* data = [[self sharedPasteBoard] dataForPasteboardType:kMTUPasteBoardDataType];
    
    if (!data) {
        return nil;
    }
    
    NSDictionary* dictInfo = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    NSDictionary* dict = [dictInfo valueForKey:kMTUPasteBoardDictInfoData];
    
    if (!dict) {
        return nil;
    }
    
    NSInteger type = [[dict valueForKey:@"type"] integerValue];
    id retData = nil;
    
    switch (type) {
        case kMTUDataType_CurrentConfigReq:
            retData = [[MTUCurrentConfigReq alloc] init];
            break;
            
        default:
            break;
    }
    
    [retData decodeFromNSDict:dict];
    
    return retData;
}

- (void)clearPasteBoard
{
    UIPasteboard* pasteBoard = [self sharedPasteBoard];
    
    NSData* data = [pasteBoard dataForPasteboardType:kMTUPasteBoardDataType];
    if (!data) {
        return;
    }
    
    NSMutableDictionary* dictInfo = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    if (!dictInfo) {
        return;
    }
    
    NSDictionary* dict = [dictInfo valueForKey:kMTUPasteBoardDictInfoData];
    if (!dict) {
        return;
    }
    
    [dictInfo setValue:nil forKey:kMTUPasteBoardDictInfoData];
    data = [NSKeyedArchiver archivedDataWithRootObject:dictInfo];
    [pasteBoard setData:data forPasteboardType:kMTUPasteBoardDataType];
}

@end
