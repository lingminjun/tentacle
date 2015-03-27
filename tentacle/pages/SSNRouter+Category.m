//
//  SSNRouter+Category.m
//  tentacle
//
//  Created by lingminjun on 15/3/26.
//  Copyright (c) 2015年 SF. All rights reserved.
//

#import "SSNRouter+Category.h"

@implementation SSNRouter (Category)

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //scheme设置
    NSArray *schemes = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleURLSchemes"];
    NSString *scheme = [schemes firstObject];
    if ([scheme length] == 0) {
        scheme = @"app";
    }
    [self setScheme:scheme];
    
    //组件map加载
    NSString *mapPath = [[NSBundle mainBundle] pathForResource:@"page_map" ofType:@"plist"];
    NSDictionary *map = [NSDictionary dictionaryWithContentsOfFile:mapPath];
    [map enumerateKeysAndObjectsUsingBlock:^(NSString *key, NSString *obj, BOOL *stop) {
        Class clazz = NSClassFromString(obj);
        if (clazz) {
            [self addComponent:key pageClass:clazz];
        }
        
    }];
    
    //加载window
    id<UIApplicationDelegate> appDelegate = application.delegate;
    if (appDelegate.window == nil) {
        appDelegate.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        appDelegate.window.backgroundColor = [UIColor whiteColor];
    }
    
    self.window = appDelegate.window;
    
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    
    NSMutableDictionary *query = [NSMutableDictionary dictionary];
    [query setValue:sourceApplication forKey:@"sourceApplication"];
    [query setValue:annotation forKey:@"annotation"];
    
    return [self openURL:url query:query];
}

@end
