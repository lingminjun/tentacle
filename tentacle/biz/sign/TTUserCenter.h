//
//  TTUserCenter.h
//  tentacle
//
//  Created by lingminjun on 15/3/26.
//  Copyright (c) 2015年 SF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TTUserCenter : NSObject

+ (instancetype)center;

//是否有用户登录
- (BOOL)isLogin;


@end
