//
//  MTUErrorUtil.h
//  libMailTestUtilSDK
//
//  Created by H-YXH on 3/18/15.
//  Copyright (c) 2015 migo Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, MTUErrorType) {
    MTUErrorType_Common = -1,               // 一般错误
    MTUErrorType_InvalidParams = -2,        // 参数错误
    MTUErrorType_ShouldNotHappen = -3,      // 不应该发生的中级错误
};

@interface MTUErrorUtil : NSObject

+ (NSError *)errorWithType:(MTUErrorType)errType;

@end
