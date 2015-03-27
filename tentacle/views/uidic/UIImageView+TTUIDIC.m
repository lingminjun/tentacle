//
//  UIImageView+TTUIDIC.m
//  tentacle
//
//  Created by lingminjun on 15/3/27.
//  Copyright (c) 2015年 SF. All rights reserved.
//

#import "UIImageView+TTUIDIC.h"
#import "UIScreen+TTUIDIC.h"
#import "UIColor+TTUIDIC.h"

@implementation UIImageView (TTUIDIC)

+ (UIImageView *)tt_L1 {
    NSUInteger width = 2*[UIScreen tt_screen_width];
    return [self ssn_lineWithWidth:width color:[UIColor tt_C3] orientation:UIInterfaceOrientationPortrait];
}

+ (UIImageView *)tt_L2 {
    NSUInteger width = 2*[UIScreen tt_screen_width];
    return [self ssn_lineWithWidth:width color:[UIColor tt_C3] orientation:UIInterfaceOrientationPortraitUpsideDown];
}

@end
