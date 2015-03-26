//
//  TTUserCenter.m
//  tentacle
//
//  Created by lingminjun on 15/3/26.
//  Copyright (c) 2015年 SF. All rights reserved.
//

#import "TTUserCenter.h"

@implementation TTUserCenter

+ (instancetype)center {
    static TTUserCenter *center = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        center = [[TTUserCenter alloc] init];
    });
    return center;
}


//是否有用户登录
- (BOOL)isLogin {
    return YES;
}

@end
