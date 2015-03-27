//
//  TTSectionCell.m
//  tentacle
//
//  Created by lingminjun on 15/3/27.
//  Copyright (c) 2015年 SF. All rights reserved.
//

#import "TTSectionCell.h"

@implementation TTSectionCell

@synthesize title = _title;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //
        _title = [TTLabel tt_S1_2];
        [self.contentView addSubview:_title];
        self.backgroundView.backgroundColor = [UIColor tt_C5];
    }
    return self;
}

- (void)ssn_configureCellWithModel:(id<SSNCellModel>)model atIndexPath:(NSIndexPath *)indexPath inTableView:(UITableView *)tableView {
    [super ssn_configureCellWithModel:model atIndexPath:indexPath inTableView:tableView];
    
    if (![model isKindOfClass:[TTSectionCellModel class]]) {
        return ;
    }
    
    TTSectionCellModel *sec = (TTSectionCellModel *)model;
    _title.text = sec.title;
    
    _title.ssn_x = tt_edge.left;
    _title.ssn_center_y = ssn_ceil(sec.cellHeight/2);
}

- (void)prepareForReuse {
    [super prepareForReuse];
    _title.text = @"";
}

@end


@implementation TTSectionCellModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.cellHeight = 20;
        self.cellClass = [TTSectionCell class];
        self.disabledSelect = YES;
    }
    return self;
}

+ (instancetype)lastModel {
    TTSectionCellModel *model = [self model];
    model.hiddenBottomLine = YES;
    return model;
}

@end