//
//  MTUApi.m
//  libMailTestUtilSDK
//
//  Created by H-YXH on 3/17/15.
//  Copyright (c) 2015 migo Co., Ltd. All rights reserved.
//

#import "MTUApi.h"
#import "MTUApiManager.h"

@interface MTUApi ()

@end

@implementation MTUApi

+ (BOOL)registerApp:(NSString *)appID
{
    return [[MTUApiManager defaultManager] registerApp:appID];
}

+ (BOOL)isMailMasterInstalled
{
    return [[MTUApiManager defaultManager] isMailClientInstalled];
}

+ (BOOL)isMailMasterSupportApi
{
    return [[MTUApiManager defaultManager] isMailClientSupportApi];
}

+ (BOOL)openMailMaster
{
    return [[MTUApiManager defaultManager] openMailClient];
}

+ (NSError *)updateOpenAppUrlScheme:(NSString *)open testUrlScheme:(NSString *)test
{
    return [[MTUApiManager defaultManager] updateApp:open testID:test];
}

@end
