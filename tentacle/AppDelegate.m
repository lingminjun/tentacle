//
//  AppDelegate.m
//  tentacle
//
//  Created by lingminjun on 15/3/26.
//  Copyright (c) 2015年 SF. All rights reserved.
//

#import "AppDelegate.h"
#import "SSNRouter+Category.h"
#import "TTUserCenter.h"

@interface AppDelegate ()<SSNRouterDelegate>

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    //初始化router
    [self.ssn_router routerInitialize];
    
    //设置转发代理
    self.ssn_router.delegate = self;
    
    
    if ([[TTUserCenter center] isLogin]) {
        [self.ssn_router open:@"app://home"]; //转到重定向中加载ui
    }
    else
    {
        [self.ssn_router open:@"app://login"]; //转到重定向中加载ui
    }
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark open url delegate
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
