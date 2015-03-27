//
//  TTURLDispatcher.m
//  tentacle
//
//  Created by lingminjun on 15/3/27.
//  Copyright (c) 2015年 SF. All rights reserved.
//

#import "TTURLDispatcher.h"

@implementation TTURLDispatcher

+ (instancetype)dispatcher {
    static TTURLDispatcher *dispatcher = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dispatcher = [[TTURLDispatcher alloc] init];
    });
    return dispatcher;
}



#pragma mark open url delegate
//所有的分发控制
- (NSURL *)ssn_router:(SSNRouter *)router redirectURL:(NSURL *)url query:(NSDictionary *)query
{
    if ([url.absoluteString isEqualToString:@"app://login"])
    {
        [self.ssn_router open:@"app://sign_nav"];
        return [NSURL URLWithString:@"app://sign_nav/sign"];
    }
    else if ([url.absoluteString isEqualToString:@"app://home"])
    {
        //不能按照路径创建目录，必须一级一级创建
        [self.ssn_router open:@"app://home_tab"];
        
        [self.ssn_router open:@"app://home_tab/session_nav"];
        [self.ssn_router open:@"app://home_tab/session_nav/session"];
        
        [self.ssn_router open:@"app://home_tab/friend_nav"];
        [self.ssn_router open:@"app://home_tab/friend_nav/friend"];
        
        [self.ssn_router open:@"app://home_tab/setting_nav"];
        [self.ssn_router open:@"app://home_tab/setting_nav/setting"];
        
        return [NSURL URLWithString:@"app://home_tab/session_nav/session"];
    }
    return nil;
}


@end
