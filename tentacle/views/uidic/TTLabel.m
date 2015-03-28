//
//  TTLabel.m
//  tentacle
//
//  Created by lingminjun on 15/3/27.
//  Copyright (c) 2015年 SF. All rights reserved.
//

#import "TTLabel.h"

@implementation TTLabel

- (void)setText:(NSString *)text {
    [super setText:text];
    [self ssn_sizeToFit];
}

+ (TTLabel *)tt_S1_1 {
    NSUInteger max = tt_screen_width - (tt_edge.left + tt_edge.right);
    return [self ssn_labelWithWidthMin:0 max:max font:[UIFont tt_T1] color:[UIColor tt_C1] backgroud:[UIColor clearColor] alignment:NSTextAlignmentCenter multiLine:NO];
}

+ (TTLabel *)tt_S1_2 {
    NSUInteger max = tt_screen_width - (tt_edge.left + tt_edge.right);
    return [self ssn_labelWithWidthMin:0 max:max font:[UIFont tt_T1] color:[UIColor tt_C1] backgroud:[UIColor clearColor] alignment:NSTextAlignmentLeft multiLine:NO];
}

+ (TTLabel *)tt_S1_3 {
    NSUInteger max = tt_screen_width - (tt_edge.left + tt_edge.right);
    return [self ssn_labelWithWidthMin:0 max:max font:[UIFont tt_T2] color:[UIColor tt_C1] backgroud:[UIColor clearColor] alignment:NSTextAlignmentCenter multiLine:NO];
}

+ (TTLabel *)tt_S1_4 {
    NSUInteger max = tt_screen_width - (tt_edge.left + tt_edge.right);
    return [self ssn_labelWithWidthMin:0 max:max font:[UIFont tt_T2] color:[UIColor tt_C1] backgroud:[UIColor clearColor] alignment:NSTextAlignmentLeft multiLine:NO];
}

+ (TTLabel *)tt_S2_1 {
    NSUInteger max = tt_screen_width - (tt_edge.left + tt_edge.right);
    return [self ssn_labelWithWidthMin:0 max:max font:[UIFont tt_T3] color:[UIColor tt_C1] backgroud:[UIColor clearColor] alignment:NSTextAlignmentLeft multiLine:YES];
}

+ (TTLabel *)tt_S2_2 {
    NSUInteger max = tt_screen_width - (tt_edge.left + tt_edge.right);
    return [self ssn_labelWithWidthMin:0 max:max font:[UIFont tt_T3] color:[UIColor tt_C1] backgroud:[UIColor clearColor] alignment:NSTextAlignmentCenter multiLine:YES];
}

+ (TTLabel *)tt_S2_3 {
    NSUInteger max = tt_screen_width - (tt_edge.left + tt_edge.right);
    return [self ssn_labelWithWidthMin:0 max:max font:[UIFont tt_T3] color:[UIColor tt_C1] backgroud:[UIColor clearColor] alignment:NSTextAlignmentRight multiLine:YES];
}

+ (TTLabel *)tt_S3_1 {
    NSUInteger max = tt_screen_width - (tt_edge.left + tt_edge.right);
    return [self ssn_labelWithWidthMin:0 max:max font:[UIFont tt_T4] color:[UIColor tt_C2] backgroud:[UIColor clearColor] alignment:NSTextAlignmentLeft multiLine:YES];
}

+ (TTLabel *)tt_S3_2 {
    NSUInteger max = tt_screen_width - (tt_edge.left + tt_edge.right);
    return [self ssn_labelWithWidthMin:0 max:max font:[UIFont tt_T4] color:[UIColor tt_C2] backgroud:[UIColor clearColor] alignment:NSTextAlignmentLeft multiLine:YES];
}

+ (TTLabel *)tt_S3_3 {
    NSUInteger max = tt_screen_width - (tt_edge.left + tt_edge.right);
    return [self ssn_labelWithWidthMin:0 max:max font:[UIFont tt_T4] color:[UIColor tt_C2] backgroud:[UIColor clearColor] alignment:NSTextAlignmentLeft multiLine:YES];
}

@end
