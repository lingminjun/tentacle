//
//  UIViewController+TTUtil.m
//  tentacle
//
//  Created by lingminjun on 15/3/28.
//  Copyright (c) 2015年 SF. All rights reserved.
//

#import "UIViewController+TTUtil.h"

@implementation UIViewController (TTUtil)

- (void)setNavigationBack:(NSString *)back action:(SEL)action {
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.exclusiveTouch = YES;
    [leftButton setBackgroundColor:[UIColor clearColor]];
    [leftButton setFrame:CGRectMake(0, 7, 80, 30)];
    [leftButton setImage:[UIImage imageNamed:@"nav_back"] forState:UIControlStateNormal];
    leftButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [leftButton.titleLabel setFont:[UIFont tt_T2]];
    [leftButton setTitleColor:[UIColor tt_C1] forState:UIControlStateNormal];
    [leftButton setTitleColor:[UIColor tt_C9] forState:UIControlStateDisabled];
    [leftButton setTitleColor:[UIColor tt_C2] forState:UIControlStateHighlighted];
    if ([back length]) {
        [leftButton setTitle:back forState:UIControlStateNormal];
    }
    else {
        [leftButton setTitle:@"返回" forState:UIControlStateNormal];
    }
    [leftButton setImageEdgeInsets:UIEdgeInsetsMake(0, -5, 0, 0)];
    [leftButton setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    [leftButton addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = backItem;
    
}


- (UIBarButtonItem *)barButtonItemWithTitle:(NSString *)title alignment:(UIControlContentHorizontalAlignment)alignment imageName:(NSString *)imageName action:(SEL)action
{
    UIImage *image = [UIImage imageNamed:imageName];
    CGRect frame = CGRectMake(0, 0, 80, 30);
    if (image) {
        frame = CGRectMake(0, 0, image.size.width + 10, image.size.height);
    }
    
    UIButton *btn= [UIButton buttonWithType:UIButtonTypeCustom];
    btn.exclusiveTouch = YES;
    btn.frame = frame;
    
    if (image) {
        [btn setImage:image forState:UIControlStateNormal];
    }
    else {
        [btn setTitle:title forState:UIControlStateNormal];
        [btn.titleLabel setFont:[UIFont tt_T2]];
        [btn setTitleColor:[UIColor tt_C1] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor tt_C9] forState:UIControlStateDisabled];
        [btn setTitleColor:[UIColor tt_C2] forState:UIControlStateHighlighted];
        btn.contentHorizontalAlignment = alignment;
        
        if (alignment == UIControlContentHorizontalAlignmentLeft) {
            [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, -5, 0, 0)];
        }
        else {
            [btn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, -5)];
        }
    }
    
    [btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

- (void)setNavigationLeftItem:(NSString *)title action:(SEL)action {
    UIBarButtonItem *backItem = [self barButtonItemWithTitle:title alignment:UIControlContentHorizontalAlignmentLeft imageName:nil action:action];
    self.navigationItem.leftBarButtonItem = backItem;
}

- (void)setNavigationRightItem:(NSString *)title action:(SEL)action {
    UIBarButtonItem *backItem = [self barButtonItemWithTitle:title alignment:UIControlContentHorizontalAlignmentRight imageName:nil action:action];
    self.navigationItem.rightBarButtonItem = backItem;
}

- (void)setNavigationLeftItemWithImageName:(NSString *)imageName action:(SEL)action {
    UIBarButtonItem *backItem = [self barButtonItemWithTitle:nil alignment:UIControlContentHorizontalAlignmentLeft imageName:imageName action:action];
    self.navigationItem.leftBarButtonItem = backItem;
}

- (void)setNavigationRightItemWithImageName:(NSString *)imageName action:(SEL)action {
    UIBarButtonItem *backItem = [self barButtonItemWithTitle:nil alignment:UIControlContentHorizontalAlignmentRight imageName:imageName action:action];
    self.navigationItem.rightBarButtonItem = backItem;
}

@end
