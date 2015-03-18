//
//  MTUApiManager.h
//  libMailTestUtilSDK
//
//  Created by H-YXH on 3/18/15.
//  Copyright (c) 2015 migo Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MTUApi.h"

@interface MTUApiManager : NSObject

@property (nonatomic, strong) NSString* appID;

+ (instancetype)defaultManager;

- (BOOL)registerApp:(NSString *)appID;

- (BOOL)isMailClientInstalled;

- (BOOL)isMailClientSupportApi;

- (BOOL)openMailClient;

- (NSError *)updateApp:(NSString *)appID testID:(NSString *)testID;

- (BOOL)isMailClientApp;

- (BOOL)handleUrl:(NSURL *)url delegate:(id<MTUApiDeleagte>)delegate;

- (BOOL)sendReq:(MTUBaseReq *)request;

- (BOOL)sendResp:(MTUBaseResp *)response;

@end
