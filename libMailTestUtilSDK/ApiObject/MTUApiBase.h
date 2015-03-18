//
//  MTUApiBase.h
//  libMailTestUtilSDK
//
//  Created by H-YXH on 3/18/15.
//  Copyright (c) 2015 migo Co., Ltd. All rights reserved.
//

#import "MTUObject.h"

@interface MTUBaseReq ()

@property (nonatomic, strong) NSString* fromAppID;
@property (nonatomic, strong) NSString* toAppID;

- (BOOL)isValid;

@end

@interface MTUBaseResp ()

@property (nonatomic, strong) NSString* fromAppID;
@property (nonatomic, strong) NSString* toAppID;

- (BOOL)isValid;

@end
