//
//  UITextField+TTUIDIC.m
//  tentacle
//
//  Created by lingminjun on 15/3/28.
//  Copyright (c) 2015年 SF. All rights reserved.
//

#import "UITextField+TTUIDIC.h"

@implementation UITextField (TTUIDIC)

+ (instancetype)tt_I1 {
    NSUInteger width = tt_screen_width - (tt_edge.left + tt_edge.right);
    NSUInteger height = 44;
    UITextField *text = [self ssn_inputWithSize:CGSizeMake(width, height) font:[UIFont tt_T3] color:[UIColor tt_C1] adjustFont:YES minFont:11];
    text.background = [[UIImage ssn_imageWithColor:[UIColor tt_C4]
                                            border:1
                                             color:[UIColor tt_C3]
                                      cornerRadius:0] ssn_centerStretchImage];
    text.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tt_edge.left, tt_edge.left)];
    text.leftViewMode = UITextFieldViewModeAlways;
    return text;
}

- (void)sf_input_right_button_action:(id)sender {
    UIButton *btn = (UIButton *)sender;
    if (self.secureTextEntry) {
        btn.selected = YES;
        self.secureTextEntry = NO;
    }
    else {
        btn.selected = NO;
        self.secureTextEntry = YES;
    }
}

+ (instancetype)tt_I2 {
    NSUInteger width = tt_screen_width - (tt_edge.left + tt_edge.right);
    NSUInteger height = 44;
    
    UITextField *text = [self ssn_inputWithSize:CGSizeMake(width, height) font:[UIFont tt_T3] color:[UIColor tt_C1] adjustFont:YES minFont:11];
    text.background = [[UIImage ssn_imageWithColor:[UIColor tt_C4]
                                            border:1
                                             color:[UIColor tt_C3]
                                      cornerRadius:0] ssn_centerStretchImage];
    text.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tt_edge.left, tt_edge.left)];
    text.leftViewMode = UITextFieldViewModeAlways;
    
    UIImage *normal = [UIImage imageNamed:@"icon_visible_password_normal"];
    UIImage *selected = [UIImage imageNamed:@"icon_visible_password_selected"];
    CGRect btnFrame = CGRectMake(0, 0, normal.size.width + 2*tt_edge.left, normal.size.height);
    UIButton *btn = [[UIButton alloc] initWithFrame:btnFrame];
    [btn setImage:normal forState:UIControlStateNormal];
    [btn setImage:selected forState:UIControlStateHighlighted];
    [btn setImage:selected forState:UIControlStateSelected];
    [btn setImage:selected forState:UIControlStateHighlighted|UIControlStateSelected];
    [btn addTarget:text action:@selector(sf_input_right_button_action:) forControlEvents:UIControlEventTouchUpInside];
    
    text.rightView = btn;
    text.rightViewMode = UITextFieldViewModeAlways;
    text.secureTextEntry = YES;
    text.clearsOnBeginEditing = NO;
    return text;
}


@end
