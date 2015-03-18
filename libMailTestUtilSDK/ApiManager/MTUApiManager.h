//
//  MTUApiManager.h
//  libMailTestUtilSDK
//
//  Created by H-YXH on 3/18/15.
//  Copyright (c) 2015 migo Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MTUApiManager : NSObject

+ (instancetype)defaultManager;

- (BOOL)registerApp:(NSString *)appID;

- (BOOL)isMailClientInstalled;

- (BOOL)isMailClientSupportApi;

- (BOOL)openMailClient;

- (NSError *)updateApp:(NSString *)appID testID:(NSString *)testID;

@end
