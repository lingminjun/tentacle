//
//  TTWindow.m
//  tentacle
//
//  Created by lingminjun on 15/3/28.
//  Copyright (c) 2015年 SF. All rights reserved.
//

#import "TTWindow.h"

@implementation TTWindow

//具体打开子页面方法
- (BOOL)ssn_openPage:(id <SSNPage>)page query:(NSDictionary *)query animated:(BOOL)animated {
    
    if ([page isKindOfClass:[UIViewController class]])
    {
        
        UIViewController *vc = (UIViewController *)page;
        
        //第一个被赋值到rootvc上
        if (self.rootViewController && self.rootViewController != vc && animated) {
            [UIView transitionFromView:self.rootViewController.view toView:vc.view duration:1.25f options:UIViewAnimationOptionTransitionFlipFromLeft completion:nil];
        }
    }
    
    return [super ssn_openPage:page query:query animated:animated];
}

@end
