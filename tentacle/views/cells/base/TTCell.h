//
//  TTCell.h
//  tentacle
//
//  Created by lingminjun on 15/3/27.
//  Copyright (c) 2015年 SF. All rights reserved.
//

#import <UIKit/UIKit.h>

//cell的基类，底边有一个黑线
@interface TTCell : UITableViewCell

@end



@interface TTCellModel : SSNVMCellItem

//是否隐藏底边线，默认不隐藏
@property (nonatomic) BOOL hiddenBottomLine;

//底线起始值，默认为0
@property (nonatomic) NSUInteger bottomLineHeaderWidth;

+ (instancetype)model;//建议的工厂方法

@end
