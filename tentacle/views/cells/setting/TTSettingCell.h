//
//  TTSettingCell.h
//  tentacle
//
//  Created by lingminjun on 15/3/27.
//  Copyright (c) 2015年 SF. All rights reserved.
//

#import "TTCell.h"


@class TTSettingCell;

@protocol TTSettingCellDelegate <NSObject>

@optional
//当switch被改变时委托
- (void)tt_cell:(TTSettingCell *)cell switchDidChangeValue:(BOOL)value;

@end

@interface TTSettingCell : TTCell

@property (nonatomic,strong,readonly) UIImageView *icon;

@property (nonatomic,strong,readonly) UILabel *title;

@end


@interface TTSettingCellModel : TTCellModel

@property (nonatomic,copy) NSString *icon;

@property (nonatomic,copy) NSString *title;

@property (nonatomic) BOOL hiddenDisclosureIndicator;//隐藏指示

@property (nonatomic) BOOL isSwitch;//是一个开关

@property (nonatomic) BOOL switchValue;//开关的值

+ (instancetype)modelWithTitle:(NSString *)title;
+ (instancetype)modelWithIcon:(NSString *)icon title:(NSString *)title;
+ (instancetype)modelWithIcon:(NSString *)icon title:(NSString *)title switchValue:(BOOL)switchValue;

@end
