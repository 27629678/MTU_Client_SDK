//
//  MTUApi.m
//  libMailTestUtilSDK
//
//  Created by H-YXH on 3/17/15.
//  Copyright (c) 2015 migo Co., Ltd. All rights reserved.
//

#import "MTUApi.h"
#import "MTUVersionInfo.h"

@interface MTUApi ()

@end

@implementation MTUApi

+ (NSString *)getApiVersion
{
    return [MTUVersionInfo sdkVersion];
}

@end
