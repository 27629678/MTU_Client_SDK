//
//  MTUApiData.m
//  libMailTestUtilSDK
//
//  Created by H-YXH on 3/18/15.
//  Copyright (c) 2015 migo Co., Ltd. All rights reserved.
//

#import "MTUApiData.h"

#define kMTUApiDataDictKey_Type (@"type")
#define kMTUApiDataDictKey_ErrCode (@"errorCode")
#define kMTUApiDataDictKey_ErrString (@"errorString")
#define kMTUApiDataDictKey_FromAppID (@"fromAppID")
#define kMTUApiDataDictKey_ToAppID (@"toAppID")

@implementation MTUCurrentConfigReq

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.type = kMTUDataType_CurrentConfigReq;
    }
    
    return self;
}

- (NSDictionary *)encodeToNSDict
{
    NSMutableDictionary* retDict = [NSMutableDictionary dictionary];
    [retDict setValue:[NSNumber numberWithInteger:self.type] forKey:kMTUApiDataDictKey_Type];
    [retDict setValue:self.fromAppID forKey:kMTUApiDataDictKey_FromAppID];
    [retDict setValue:self.toAppID forKey:kMTUApiDataDictKey_ToAppID];
    
    return retDict;
}

- (void)decodeFromNSDict:(NSDictionary *)dict
{
    self.type = [[dict valueForKey:kMTUApiDataDictKey_Type] integerValue];
    self.fromAppID = [dict valueForKey:kMTUApiDataDictKey_FromAppID];
    self.toAppID = [dict valueForKey:kMTUApiDataDictKey_ToAppID];
}

- (BOOL)isValid
{
    return YES;
}

@end

