//
//  MTUErrorUtil.h
//  libMailTestUtilSDK
//
//  Created by H-YXH on 3/18/15.
//  Copyright (c) 2015 migo Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, MTUErrorType) {
    MTUErrorType_InvalidParams,
    MTUErrorType_ShouldNotHappen,
    MTUErrorType_Common,
};

@interface MTUErrorUtil : NSObject

+ (NSError *)errorWithType:(MTUErrorType)errType;

@end
