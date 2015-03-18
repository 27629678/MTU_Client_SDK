//
//  MTUErrorUtil.m
//  libMailTestUtilSDK
//
//  Created by H-YXH on 3/18/15.
//  Copyright (c) 2015 migo Co., Ltd. All rights reserved.
//

#import "MTUErrorUtil.h"
#import "NSError+MTUExt.h"

@implementation MTUErrorUtil

+ (NSError *)errorWithType:(MTUErrorType)errType
{
    NSString* errDescription = nil;
    switch (errType) {
        case MTUErrorType_Common:
            errDescription = @"Common Error.";
            break;
            
        case MTUErrorType_ShouldNotHappen:
            errDescription = @"Error Should not happen.";
            break;
            
        case MTUErrorType_InvalidParams:
            errDescription = @"Params are Invalid.";
            break;
    }
    
    return [NSError errorWithCode:errType description:errDescription];
}

@end
