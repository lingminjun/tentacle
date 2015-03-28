//
//  UIButton+TTUIDIC.m
//  tentacle
//
//  Created by lingminjun on 15/3/28.
//  Copyright (c) 2015年 SF. All rights reserved.
//

#import "UIButton+TTUIDIC.h"


#define sf_button_color_tuple_def(var,normal,seleted,disabled) var:(UIColor *) var##_normal var:(UIColor *) var##_seleted var:(UIColor *) var##_disabled

#define sf_button_color_tuple(normal,seleted,disabled,var) var:normal var:seleted var:disabled

#define sf_button_color_tuple_(sf_button_color_tuple,var) var:normal var:seleted var:disabled

#define sf_button_backgroud_image(c,w,b,r) ((c != nil || b != nil) ? [UIImage ssn_imageWithColor:c border:w color:b cornerRadius:r] : nil)



@implementation UIButton (TTUIDIC)


+ (instancetype)sf_buttonWithSize:(CGSize)size sf_button_color_tuple_def(backgroud,normal,seleted,disabled) border:(CGFloat)width sf_button_color_tuple_def(border,normal,seleted,disabled) radius:(CGFloat)radius font:(UIFont *)font sf_button_color_tuple_def(font,normal,seleted,disabled) {

    UIButton *btn =  [UIButton ssn_buttonWithSize:size
                                             font:font
                                            color:font_normal
                                         selected:font_seleted
                                         disabled:font_disabled
                                        backgroud:sf_button_backgroud_image(backgroud_normal, 0, nil, radius)
                                         selected:sf_button_backgroud_image(backgroud_seleted, 0, nil, radius)
                                         disabled:sf_button_backgroud_image(backgroud_disabled, 0, nil, radius)];
    if (width > 0.0f) {
        btn.layer.borderColor = border_normal.CGColor;
        btn.layer.borderWidth = 0.5;
        btn.layer.cornerRadius = radius;
    }
    return btn;
}

+ (UIButton *)tt_B1 {
    return [self sf_buttonWithSize:CGSizeMake(260,36)
            sf_button_color_tuple([UIColor tt_C7],nil,[UIColor tt_C9],  backgroud)
                            border:0
            sf_button_color_tuple(nil,nil,nil,  border)
                            radius:5
                              font:[UIFont tt_T2]
            sf_button_color_tuple([UIColor tt_C4],nil,nil, font)];
}

@end
