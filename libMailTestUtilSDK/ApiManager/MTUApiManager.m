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

@interface MTUApiManager ()

@property (nonatomic, strong) NSString* appID;
@property (nonatomic, strong) NSString* nativeAppID;
@property (nonatomic, strong) NSString* nativeTestID;


@end

@implementation MTUApiManager

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
    // TODO:(yuxiaohua)完成注册
    
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
}

@end
