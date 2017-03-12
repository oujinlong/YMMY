//
//  PosLoginViewController.m
//  YGJPos
//
//  Created by mac on 17/1/10.
//  Copyright © 2017年 HD. All rights reserved.
//

#import "PosLoginViewController.h"
#import "PosLoginInputView.h"
#import "POSAnimationButton.h"
#import "YMHomeViewController.h"
#import "YMTabbarVC.h"
#import "AppDelegate.h"
@interface PosLoginViewController () <POSAnimationButtonDelegate>
@property (nonatomic, strong) UIImageView *iconImageView;

@property (nonatomic, strong) UITextField *storeTF;
@property (nonatomic, strong) UITextField *userTF;
@property (nonatomic, strong) UITextField *passwordTF;

@end

@implementation PosLoginViewController
-(UIImageView *)iconImageView{
    if (!_iconImageView){
        _iconImageView = [PosTool imageViewWithImageName:@"logo.jpg" addOnSuperView:self.view];
    }
    return _iconImageView;
}
- (void)viewDidLoad {
    [super viewDidLoad];

    
    
    [self setupUI];


}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}


-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}
-(void)setupUI{
    

    
    
    UIImageView* bgImageView = [PosTool imageViewWithImageName:@"bj_login" addOnSuperView:self.view];
    [bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_offset(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_offset(0);
        make.top.mas_offset(110);
        make.size.mas_offset(CGSizeMake(100, 100));
    }];
    [self.iconImageView layoutIfNeeded];
    self.iconImageView.layer.cornerRadius = self.iconImageView.bounds.size.width/2.0;
    self.iconImageView.layer.masksToBounds = YES;

    //用户名
    PosLoginInputView* userView = [PosLoginInputView inputViewWithImage:@"icon2_login" placeHolder:@"请输入用户名" isPassword:NO];
    [self.view addSubview:userView];
    [userView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(44);
        make.top.mas_equalTo(self.iconImageView.mas_bottom).offset(120);
        make.right.mas_equalTo(-44);
        make.height.mas_equalTo(25);
    }];
    self.userTF = [userView getTextField];

    //密码
    PosLoginInputView* passwordView = [PosLoginInputView inputViewWithImage:@"icon3_login" placeHolder:@"请输入密码" isPassword:YES];
    [self.view addSubview:passwordView];
    [passwordView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(44);
        make.top.mas_equalTo(userView.mas_bottom).offset(40);
        make.right.mas_equalTo(-44);
        make.height.mas_equalTo(25);
    }];
    self.passwordTF = [passwordView getTextField];

    //登录
    

    [self.view layoutIfNeeded];
    
    POSAnimationButton* loginButton = [POSAnimationButton buttonWithFrame:CGRectMake(passwordView.frame.origin.x , CGRectGetMaxY(passwordView.frame) + 40, passwordView.frame.size.width , 45)];
    loginButton.delegate = self;
    [loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [loginButton setBackgroundColor:[UIColor colorWithHexString:@"FFFFFF" alpha:0.7]];
    [self.view addSubview:loginButton];
    [loginButton setTitleColor:[UIColor colorWithHexString:@"#319AE7" alpha:1.0] forState:UIControlStateNormal];
    [loginButton addTarget:self action:@selector(loginClick) forControlEvents:UIControlEventTouchUpInside];
    bgImageView.userInteractionEnabled = YES;

    [loginButton setborderColor:[UIColor whiteColor]];
    
    
    //忘记密码
//    UIButton* fogotBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [fogotBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
//    
//    [fogotBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [self.view addSubview:fogotBtn];
//    [fogotBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(loginButton.mas_bottom).offset(5);
//        make.right.mas_equalTo(loginButton);
//    }];
//    
//    [fogotBtn addTarget:self action:@selector(forgotBtnClick) forControlEvents:UIControlEventTouchUpInside];

}

-(void)forgotBtnClick{
    POSLog(@"忘记密码");
    
    
    
}



#pragma mark button action
-(void)loginClick{
   
//   [button startAnimation];
    POSLog(@"登录");
    [(AppDelegate*)[UIApplication sharedApplication].delegate toHomeTabbar];
}


-(void)POSAnimationButtonDidStartAnimation:(POSAnimationButton *)POSAnimationButton{
    //在这里写发送请求给服务器
    NSString* userName = self.userTF.text;
    NSString* password = self.passwordTF.text;
//    NSString *identifierForVendor = [[UIDevice currentDevice].identifierForVendor UUIDString];
    POSLog(@"用户名:%@--密码:%@",userName,password);
    
   
        
        
    
}

-(void)POSAnimationButtonDidFinishAnimation:(POSAnimationButton *)POSAnimationButton{

}

-(void)POSAnimationButtonWillFinishAnimation:(POSAnimationButton *)POSAnimationButton{

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
