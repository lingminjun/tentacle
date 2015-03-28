//
//  UIViewController+TTUtil.h
//  tentacle
//
//  Created by lingminjun on 15/3/28.
//  Copyright (c) 2015年 SF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (TTUtil)

- (void)setNavigationBack:(NSString *)back action:(SEL)action;

- (void)setNavigationLeftItem:(NSString *)title action:(SEL)action;

- (void)setNavigationRightItem:(NSString *)title action:(SEL)action;

- (void)setNavigationLeftItemWithImageName:(NSString *)imageName action:(SEL)action;

- (void)setNavigationRightItemWithImageName:(NSString *)imageName action:(SEL)action;

@end
