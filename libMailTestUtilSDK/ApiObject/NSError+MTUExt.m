//
//  NSError+MTUExt.m
//  libMailTestUtilSDK
//
//  Created by H-YXH on 3/18/15.
//  Copyright (c) 2015 migo Co., Ltd. All rights reserved.
//

#import "NSError+MTUExt.h"

@implementation NSError (MTUExt)

+ (NSError *)errorWithCode:(NSInteger)errorCode description:(NSString *)errorDescription
{
    NSError* error = [NSError errorWithDomain:@"com.netease.MTU_SDK"
                                         code:errorCode
                                     userInfo:@{NSLocalizedDescriptionKey:errorDescription}];
    return error;
}

@end
