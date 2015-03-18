//
//  NSError+MTUExt.h
//  libMailTestUtilSDK
//
//  Created by H-YXH on 3/18/15.
//  Copyright (c) 2015 migo Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSError (MTUExt)

+ (NSError *)errorWithCode:(NSInteger)errorCode description:(NSString *)errorDescription;

@end
