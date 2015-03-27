//
//  TTSettingCell.m
//  tentacle
//
//  Created by lingminjun on 15/3/27.
//  Copyright (c) 2015年 SF. All rights reserved.
//

#import "TTSettingCell.h"

@interface TTSettingCell ()

@property (nonatomic,strong) UISwitch *sw;

@end

@implementation TTSettingCell

- (UIImageView *)icon {
    return self.imageView;
}

- (UISwitch *)sw {
    if (_sw) {
        return _sw;
    }
    _sw = [[UISwitch alloc] init];
    [_sw addTarget:self action:@selector(switchDidChangeAction:) forControlEvents:UIControlEventValueChanged];
    [_sw sizeToFit];
    return _sw;
}

@synthesize title = _title;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //
        _title = [TTLabel tt_S1_4];
        [self.contentView addSubview:_title];
    }
    return self;
}

- (void)ssn_configureCellWithModel:(id<SSNCellModel>)model atIndexPath:(NSIndexPath *)indexPath inTableView:(UITableView *)tableView {
    [super ssn_configureCellWithModel:model atIndexPath:indexPath inTableView:tableView];
    
    if (![model isKindOfClass:[TTSettingCellModel class]]) {
        return ;
    }
    
    TTSettingCellModel *set = (TTSettingCellModel *)model;
    
    if (set.icon) {
        self.icon.image = [UIImage imageNamed:set.icon];
    }
    
    _title.text = set.title;
    
    _title.ssn_x = self.icon.ssn_right + tt_edge.left;
    _title.ssn_center_y = ssn_ceil(set.cellHeight/2);
    
    if (set.hiddenDisclosureIndicator) {
        self.accessoryType = UITableViewCellAccessoryNone;
    }
    else {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    if (set.isSwitch) {
        self.accessoryType = UITableViewCellAccessoryNone;
        
        self.accessoryView = self.sw;
        _sw.on = set.switchValue;
    }
}

- (void)switchDidChangeAction:(UISwitch *)sender {
    id<TTSettingCellDelegate> delegate = (id<TTSettingCellDelegate>)(self.ssn_presentingViewController);
    if ([delegate respondsToSelector:@selector(tt_cell:switchDidChangeValue:)]) {
        [delegate tt_cell:self switchDidChangeValue:sender.on];
    }
    else {//不可修改
        sender.on = !sender.on;
    }
}

- (void)prepareForReuse {
    [super prepareForReuse];
    self.icon.image = nil;
    _title.text = @"";
    _sw.on = NO;
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
}

@end


@implementation TTSettingCellModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.cellHeight = 44;
        self.cellClass = [TTSettingCell class];
    }
    return self;
}

+ (instancetype)modelWithTitle:(NSString *)title {
    TTSettingCellModel *model = [self model];
    model.title = title;
    return model;
}

+ (instancetype)modelWithIcon:(NSString *)icon title:(NSString *)title {
    TTSettingCellModel *model = [self model];
    model.title = title;
    model.icon = icon;
    return model;
}

+ (instancetype)modelWithIcon:(NSString *)icon title:(NSString *)title switchValue:(BOOL)switchValue {
    TTSettingCellModel *model = [self model];
    model.title = title;
    model.icon = icon;
    model.isSwitch = YES;
    model.switchValue = switchValue;
    return model;
}

@end