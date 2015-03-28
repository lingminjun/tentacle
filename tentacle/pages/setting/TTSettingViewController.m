//
//  TTSettingViewController.m
//  tentacle
//
//  Created by lingminjun on 15/3/26.
//  Copyright (c) 2015年 SF. All rights reserved.
//

#import "TTSettingViewController.h"

#import "TTSectionCell.h"
#import "TTSettingCell.h"

@interface TTSettingViewController ()

@end

@implementation TTSettingViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"设置";
    self.view.backgroundColor = [UIColor tt_C5];
    
    self.ssn_tableViewConfigurator.tableView = self.tableView;
    [self.ssn_tableViewConfigurator.listFetchController loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - SSNPage
- (BOOL)ssn_canRespondURL:(NSURL *)url query:(NSDictionary *)query {
    return YES;
}

#pragma mark - SSNListFetchControllerDataSource

- (void)ssn_configurator:(SSNTableViewConfigurator *)configurator controller:(SSNListFetchController *)controller loadDataWithOffset:(NSUInteger)offset limit:(NSUInteger)limit userInfo:(NSDictionary *)userInfo completion:(void (^)(NSArray *results, BOOL hasMore, NSDictionary *userInfo, BOOL finished))completion {
    
    NSMutableArray *ary = [NSMutableArray array];
    
    [ary addObject:[TTSectionCellModel model]];
    
    [ary addObject:[TTSettingCellModel modelWithTitle:@"关于"]];
    
    [ary addObject:[TTSectionCellModel model]];
    
    [ary addObject:[TTSettingCellModel modelWithTitle:@"注销"]];
    
    [ary addObject:[TTSectionCellModel lastModel]];
    
    completion(ary,NO,nil,YES);
}

- (void)ssn_configurator:(SSNTableViewConfigurator *)configurator tableView:(UITableView *)tableView didSelectModel:(TTSettingCellModel *)model atIndexPath:(NSIndexPath *)indexPath {
    if ([model.title isEqualToString:@"注销"]) {
        [self ssn_open:@"app://login"];
    }
//    else if ([model.title isEqualToString:@"UILayout"]) {
//        [self openRelativePath:@"../layout" query:nil];
//    }
//    else {
//        //        tableView.editing = YES;
//        NSIndexPath *nextPath = [NSIndexPath indexPathForRow:indexPath.row+1 inSection:indexPath.section];
//        [self.ssn_tableViewConfigurator.listFetchController deleteDatasAtIndexPaths:@[indexPath,nextPath]];
//    }
}


@end
