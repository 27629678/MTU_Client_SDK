//
//  MTUObject.h
//  libMailTestUtilSDK
//
//  Created by H-YXH on 3/17/15.
//  Copyright (c) 2015 migo Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, MTUStatusCode) {
    MTUStatusCode_Success = 0,                      // 成功
    MTUStatusCode_UserCancel = -1,                  // 取消
    MTUStatusCode_RequestFail = -2,                 // 请求失败
    MTUStatusCode_Unsupport = -3,                   // 请求/响应不支持
};

// 请求基类
@interface MTUBaseReq : NSObject

@property (nonatomic, assign) int type;             // 请求类型

@end

// 响应基类
@interface MTUBaseResp : NSObject

@property (nonatomic, assign) int errCode;          // 错误码

@property (nonatomic, retain) NSString* errStr;     // 响应描述

@property (nonatomic, assign) int type;             // 响应类型

@end

// 请求当前配置项
@interface MTUCurrentConfiReq : MTUBaseReq

@end

// 设定指定配置项
@interface MTUSetConfigReq : MTUBaseReq

@end

// 设定指定功能开启与关闭
@interface MTUEnableFunctionReq : MTUBaseReq

@end