//
//  TTSignViewController.m
//  tentacle
//
//  Created by lingminjun on 15/3/26.
//  Copyright (c) 2015年 SF. All rights reserved.
//

#import "TTSignViewController.h"

@interface TTSignViewController ()

@property (nonatomic) BOOL isLoginModel;

@end

@implementation TTSignViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor tt_C5];
    
    self.title = @"顺丰海淘";
    
    UITextField *username = [UITextField tt_I1];
    username.placeholder = @"用户名";
    
    UITextField *password = [UITextField tt_I2];
    password.placeholder = @"密码";
    
    UIButton *login = [UIButton tt_B1];
    [login addTarget:self action:@selector(doneButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [login setTitle:@"登录" forState:UIControlStateNormal];
    
    SSNUIFlowLayout *layout = [self.view ssn_flowLayoutWithRowHeight:60 spacing:20];
    layout.contentInset = UIEdgeInsetsMake(84, 0, 0, 0);
    layout.contentMode = SSNUIContentModeCenter;
    
    NSInteger index = 0;
    ssn_layout_add(layout, username, index++, username);
    ssn_layout_add(layout, password, index++, password);
    ssn_layout_add(layout, login, index++, login);
    
    [self setNavigationRightItem:@"注册" action:@selector(switchButtonAction:)];
    _isLoginModel = YES;
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

//注册账号
- (IBAction)switchButtonAction:(id)sender {
    
    _isLoginModel = !_isLoginModel;
    if (_isLoginModel) {
        [self setNavigationRightItem:@"注册" action:@selector(switchButtonAction:)];
        [ssn_panel_get(UIButton, self.view, login) setTitle:@"登录" forState:UIControlStateNormal];
    }
    else {
        [self setNavigationRightItem:@"登录" action:@selector(switchButtonAction:)];
        [ssn_panel_get(UIButton, self.view, login) setTitle:@"注册" forState:UIControlStateNormal];
    }
    
//    if (![self isEmpty]) {
//        //隐藏键盘
//        [self.view endEditing:YES];
//        //判断是否是中文，但不支持中英文混编
//        if ([self.usernameTextField.text isChinese]) {
//            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"login.nameNotSupportZh", @"Name does not support Chinese")
//                                                            message:nil
//                                                           delegate:nil
//                                                  cancelButtonTitle:NSLocalizedString(@"ok", @"OK")
//                                                  otherButtonTitles:nil];
//            
//            [alert show];
//            
//            return;
//        }
//        [self showHudInView:self.view hint:NSLocalizedString(@"register.ongoing", @"Is to register...")];
//        //异步注册账号
//        [[EaseMob sharedInstance].chatManager asyncRegisterNewAccount:_usernameTextField.text
//                                                             password:_passwordTextField.text
//                                                       withCompletion:
//         ^(NSString *username, NSString *password, EMError *error) {
//             [self hideHud];
//             
//             if (!error) {
//                 TTAlertNoTitle(NSLocalizedString(@"register.success", @"Registered successfully, please log in"));
//             }else{
//                 switch (error.errorCode) {
//                     case EMErrorServerNotReachable:
//                         TTAlertNoTitle(NSLocalizedString(@"error.connectServerFail", @"Connect to the server failed!"));
//                         break;
//                     case EMErrorServerDuplicatedAccount:
//                         TTAlertNoTitle(NSLocalizedString(@"register.repeat", @"You registered user already exists!"));
//                         break;
//                     case EMErrorServerTimeout:
//                         TTAlertNoTitle(NSLocalizedString(@"error.connectServerTimeout", @"Connect to the server timed out!"));
//                         break;
//                     default:
//                         TTAlertNoTitle(NSLocalizedString(@"register.fail", @"Registration failed"));
//                         break;
//                 }
//             }
//         } onQueue:nil];
//    }
}

//点击登陆后的操作
- (void)loginWithUsername:(NSString *)username password:(NSString *)password
{
//    [self showHudInView:self.view hint:NSLocalizedString(@"login.ongoing", @"Is Login...")];
//    //异步登陆账号
//    [[EaseMob sharedInstance].chatManager asyncLoginWithUsername:username
//                                                        password:password
//                                                      completion:
//     ^(NSDictionary *loginInfo, EMError *error) {
//         [self hideHud];
//         if (loginInfo && !error) {
//             [[EaseMob sharedInstance].chatManager setIsAutoLoginEnabled:YES];
//             //发送自动登陆状态通知
//             [[NSNotificationCenter defaultCenter] postNotificationName:KNOTIFICATION_LOGINCHANGE object:@YES];
//             //将旧版的coredata数据导入新的数据库
//             EMError *error = [[EaseMob sharedInstance].chatManager importDataToNewDatabase];
//             if (!error) {
//                 error = [[EaseMob sharedInstance].chatManager loadDataFromDatabase];
//             }
//         }else {
//             switch (error.errorCode) {
//                 case EMErrorServerNotReachable:
//                     TTAlertNoTitle(NSLocalizedString(@"error.connectServerFail", @"Connect to the server failed!"));
//                     break;
//                 case EMErrorServerAuthenticationFailure:
//                     TTAlertNoTitle(error.description);
//                     break;
//                 case EMErrorServerTimeout:
//                     TTAlertNoTitle(NSLocalizedString(@"error.connectServerTimeout", @"Connect to the server timed out!"));
//                     break;
//                 default:
//                     TTAlertNoTitle(NSLocalizedString(@"login.fail", @"Logon failure"));
//                     break;
//             }
//         }
//     } onQueue:nil];
}

//弹出提示的代理方法
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
//    if ([alertView cancelButtonIndex] != buttonIndex) {
//        //获取文本输入框
//        UITextField *nameTextField = [alertView textFieldAtIndex:0];
//        if(nameTextField.text.length > 0)
//        {
//            //设置推送设置
//            [[EaseMob sharedInstance].chatManager setApnsNickname:nameTextField.text];
//        }
//    }
//    //登陆
//    [self loginWithUsername:_usernameTextField.text password:_passwordTextField.text];
}

//登陆账号
- (IBAction)doneButtonAction:(id)sender {
//    if (![self isEmpty]) {
//        [self.view endEditing:YES];
//        //支持是否为中文
//        if ([self.usernameTextField.text isChinese]) {
//            UIAlertView *alert = [[UIAlertView alloc]
//                                  initWithTitle:NSLocalizedString(@"login.nameNotSupportZh", @"Name does not support Chinese")
//                                  message:nil
//                                  delegate:nil
//                                  cancelButtonTitle:NSLocalizedString(@"ok", @"OK")
//                                  otherButtonTitles:nil];
//            
//            [alert show];
//            
//            return;
//        }
//#if !TARGET_IPHONE_SIMULATOR
//        //弹出提示
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:NSLocalizedString(@"login.inputApnsNickname", @"Please enter nickname for apns") delegate:self cancelButtonTitle:NSLocalizedString(@"cancel", @"Cancel") otherButtonTitles:NSLocalizedString(@"ok", @"OK"), nil];
//        [alert setAlertViewStyle:UIAlertViewStylePlainTextInput];
//        UITextField *nameTextField = [alert textFieldAtIndex:0];
//        nameTextField.text = self.usernameTextField.text;
//        [alert show];
//#elif TARGET_IPHONE_SIMULATOR
//        [self loginWithUsername:_usernameTextField.text password:_passwordTextField.text];
//#endif
//    }
}


#pragma mark - SSNPage
- (BOOL)ssn_canRespondURL:(NSURL *)url query:(NSDictionary *)query {
    return YES;
}

@end
