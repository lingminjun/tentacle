//
//  TTSectionCell.h
//  tentacle
//
//  Created by lingminjun on 15/3/27.
//  Copyright (c) 2015年 SF. All rights reserved.
//

#import "TTCell.h"

@interface TTSectionCell : TTCell

@property (nonatomic,strong,readonly) UILabel *title;

@end


@interface TTSectionCellModel : TTCellModel

@property (nonatomic,copy) NSString *title;

+ (instancetype)lastModel;

@end
