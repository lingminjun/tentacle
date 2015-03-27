//
//  TTCell.m
//  tentacle
//
//  Created by lingminjun on 15/3/27.
//  Copyright (c) 2015年 SF. All rights reserved.
//

#import "TTCell.h"

@interface TTCell ()

@property (nonatomic,strong) UIImageView *bottomLine;

@end


@implementation TTCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        UIView *selectedView = [[UIView alloc] init];
        selectedView.backgroundColor = [UIColor tt_C6];
        self.selectedBackgroundView = selectedView;
        
        UIView *backgroundView = [[UIView alloc] init];
        backgroundView.backgroundColor = [UIColor tt_C4];
        self.backgroundView = backgroundView;
        
        //
        _bottomLine = [UIImageView tt_L2];
        [self.contentView addSubview:_bottomLine];
    }
    return self;
}

- (void)ssn_configureCellWithModel:(id<SSNCellModel>)model atIndexPath:(NSIndexPath *)indexPath inTableView:(UITableView *)tableView {
    [super ssn_configureCellWithModel:model atIndexPath:indexPath inTableView:tableView];
    
    BOOL hidden = NO;
    NSUInteger x = 0;
    if ([model isKindOfClass:[TTCellModel class]]) {
        hidden = [(TTCellModel *)model hiddenBottomLine];
        x = [(TTCellModel *)model bottomLineHeaderWidth];
    }
    _bottomLine.hidden = hidden;
    
    _bottomLine.ssn_y = model.cellHeight - _bottomLine.ssn_height;
    _bottomLine.ssn_x = x;
    
}

- (void)prepareForReuse {
    [super prepareForReuse];
    _bottomLine.hidden = NO;
    _bottomLine.ssn_x = 0;
}

@end


@implementation TTCellModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.cellClass = [TTCell class];
    }
    return self;
}

+ (instancetype)model {
    return [[[self class] alloc] init];
}

@end

