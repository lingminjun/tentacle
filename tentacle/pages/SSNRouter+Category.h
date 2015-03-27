//
//  SSNRouter+Category.h
//  tentacle
//
//  Created by lingminjun on 15/3/26.
//  Copyright (c) 2015年 SF. All rights reserved.
//

#import "SSNRouter.h"
#import "SSNRouter+Nice.h"

@interface SSNRouter (Category)<UIApplicationDelegate>

//初始化
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;

//外部或者内部跳转捕获
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation;

@end
