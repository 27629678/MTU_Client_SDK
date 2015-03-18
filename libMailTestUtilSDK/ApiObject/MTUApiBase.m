//
//  MTUApiBase.m
//  libMailTestUtilSDK
//
//  Created by H-YXH on 3/18/15.
//  Copyright (c) 2015 migo Co., Ltd. All rights reserved.
//

#import "MTUApiBase.h"
#import "MTUApiDefines.h"
#import "MTUApiManager.h"

@implementation MTUBaseReq

- (instancetype)init
{
    self = [super init];
    if (self) {
        _fromAppID = [[MTUApiManager defaultManager] appID];
        
        if (![[MTUApiManager defaultManager] isMailClientApp]) {
            _toAppID = kApiMailClientTestUrlScheme;
        }
    }
    
    return self;
}

- (BOOL)isValid
{
    [self doesNotRecognizeSelector:_cmd];
    return NO;
}

@end

@implementation MTUBaseResp

- (instancetype)init
{
    self = [super init];
    if (self) {
        _fromAppID = [[MTUApiManager defaultManager] appID];
        
        if ([[MTUApiManager defaultManager] isMailClientApp]) {
            _toAppID = kApiMailClientTestUrlScheme;
        }
    }
    
    return self;
}

- (BOOL)isValid
{
    [self doesNotRecognizeSelector:_cmd];
    return NO;
}

@end
