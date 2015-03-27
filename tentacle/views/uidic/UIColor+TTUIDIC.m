//
//  UIColor+TTUIDIC.m
//  tentacle
//
//  Created by lingminjun on 15/3/27.
//  Copyright (c) 2015年 SF. All rights reserved.
//

#import "UIColor+TTUIDIC.h"

@implementation UIColor (TTUIDIC)

+ (UIColor *)tt_C1 {
    return [UIColor blackColor];
//    return [self ssn_colorWithHex:0x333333];
}

+ (UIColor *)tt_C2 {
    return [self ssn_colorWithHex:0x989898];
}

+ (UIColor *)tt_C3 {
    return [self ssn_colorWithHex:0xEEEEEE];
}

+ (UIColor *)tt_C4 {
    return [UIColor whiteColor];
//    return [self ssn_colorWithHex:0xFFFFFF];
}

+ (UIColor *)tt_C5 {
    return [self ssn_colorWithHex:0xF5F6FA];
}

+ (UIColor *)tt_C6 {
    return [self ssn_colorWithHex:0xF6F6F6];
}
@end
