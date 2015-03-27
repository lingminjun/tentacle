//
//  TTURLDispatcher.h
//  tentacle
//
//  Created by lingminjun on 15/3/27.
//  Copyright (c) 2015年 SF. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SSNRouter.h"

@interface TTURLDispatcher : NSObject<SSNRouterDelegate>

+ (instancetype)dispatcher;

@end
