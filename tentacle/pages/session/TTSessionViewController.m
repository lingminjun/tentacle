//
//  TTSessionViewController.m
//  tentacle
//
//  Created by lingminjun on 15/3/26.
//  Copyright (c) 2015年 SF. All rights reserved.
//

#import "TTSessionViewController.h"

@interface TTSessionViewController ()

@end

@implementation TTSessionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"海淘";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"聊天" style:UIBarButtonItemStyleDone target:self action:@selector(action)];
}

- (void)action {
    [self ssn_open:@"../chat"];
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

@end
