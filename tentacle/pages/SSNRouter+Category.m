//
//  SSNRouter+Category.m
//  tentacle
//
//  Created by lingminjun on 15/3/26.
//  Copyright (c) 2015年 SF. All rights reserved.
//

#import "SSNRouter+Category.h"

@implementation SSNRouter (Category)

//初始化
- (void)routerInitialize {
    
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
    id<UIApplicationDelegate> appDelegate = [UIApplication sharedApplication].delegate;
    self.window = appDelegate.window;
}

@end
