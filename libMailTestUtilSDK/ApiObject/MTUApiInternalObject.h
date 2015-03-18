//
//  MTUApiInternalObject.h
//  libMailTestUtilSDK
//
//  Created by H-YXH on 3/18/15.
//  Copyright (c) 2015 migo Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MTUObject.h"
#import "MTUApiDefines.h"
#import "MTUApiManager.h"
#import "MTUApiBase.h"

typedef NS_ENUM(NSUInteger, MTUDataType) {
    kMTUDataType_WebServiceReq       = 1,
    kMTUDataType_WebServiceResp      = 2,
    kMTUDataType_FunctionSwitchReq   = 3,
    kMTUDataType_FunctionSwitchResp  = 4,
    kMTUDataType_CurrentConfigReq    = 5,
    kMTUDataType_CurrentConfigResp   = 6,
};

@interface NSObject (MTUObject)

- (BOOL)isValid;
- (void)decodeFromNSDict:(NSDictionary *)dict;
- (NSDictionary *)encodeToNSDict;

@end