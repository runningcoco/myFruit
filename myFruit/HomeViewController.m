//
//  HomeViewController.m
//  myFruit
//
//  Created by 我是僵尸 on 15/10/26.
//  Copyright (c) 2015年 echochief. All rights reserved.
//

#import "HomeViewController.h"
#import "MarketViewController.h"
#import "RegistViewController.h"
#import "TabBarViewController.h"
#import "NavigationController.h"

#import <QuartzCore/QuartzCore.h>

@interface HomeViewController () <UITabBarDelegate>
{
    UITabBar *bottomTabBar;
    
    UILabel *userLabel;
    UITextField *userField;
    
    UILabel *passLabel;
    UITextField *passwordField;
    
    UIButton *loginBtn;
    UIButton *registBtn;
    UIButton *touristBtn;
    
    UILabel *infolabel;
}

@end

@implementation HomeViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (self.navigationController.isNavigationBarHidden) {
        self.navigationController.navigationBarHidden = NO;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    [self setupTabbar];
    [self setupUI];
}

- (void)setupTabbar
{
    bottomTabBar = [[UITabBar alloc] init];
    bottomTabBar.delegate = self;
    UITabBarItem *mainPage = [[UITabBarItem alloc] initWithTitle:@"主页" image:nil tag:1];
    NSArray *itemArray = [NSArray arrayWithObject:mainPage];
    [bottomTabBar setItems:itemArray];
    [self.view addSubview:bottomTabBar];
}

- (void)setupUI
{
    self.navigationController.navigationBar.hidden = YES;
    
    UIImageView *bgImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeigth)];
    bgImg.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bgImg];
    
    //  user
    userLabel = [[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth/2 - 50 - 100, kScreenHeigth/2, 90, 40)];
    userLabel.text = @"账号";
    userLabel.textColor = [UIColor orangeColor];
    userLabel.font = [UIFont systemFontOfSize:18.0f weight:2.0f];
    userLabel.textAlignment = NSTextAlignmentRight;
    //    userLabel.backgroundColor = [UIColor redColor];
    [self.view addSubview:userLabel];
    
    userField = [[UITextField alloc] initWithFrame:CGRectMake(kScreenWidth/2 - 50, kScreenHeigth/2, 180, 40)];
    userField.placeholder = @"请输入用户名";
    userField.textColor = [UIColor orangeColor];
    userField.borderStyle = UITextBorderStyleRoundedRect;
    userField.layer.masksToBounds = YES;
    userField.layer.cornerRadius = 15.0f;
    userField.layer.borderWidth = 1.0f;
    userField.layer.borderColor = [[UIColor orangeColor] CGColor];
    [self.view addSubview:userField];
    
    //  password
    passLabel = [[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth/2 - 50 - 100, kScreenHeigth/2 + 60, 90, 40)];
    passLabel.text = @"密码";
    passLabel.textColor = [UIColor orangeColor];
    passLabel.font = [UIFont systemFontOfSize:18.0f weight:2.0f];
    passLabel.textAlignment = NSTextAlignmentRight;
    //    passLabel.backgroundColor = [UIColor redColor];
    [self.view addSubview:passLabel];
    
    passwordField = [[UITextField alloc] initWithFrame:CGRectMake(kScreenWidth/2 - 50, kScreenHeigth/2 + 60, 180, 40)];
    passwordField.placeholder = @"请输入密码";
    passwordField.textColor = [UIColor orangeColor];
    passwordField.borderStyle = UITextBorderStyleRoundedRect;
    passwordField.layer.masksToBounds = YES;
    passwordField.layer.cornerRadius = 15.0f;
    passwordField.layer.borderWidth = 1.0f;
    passwordField.layer.borderColor = [[UIColor orangeColor] CGColor];
    [self.view addSubview:passwordField];
    
    //  login
    loginBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    loginBtn.frame = CGRectMake(kScreenWidth/2 - 85, kScreenHeigth/2 + 60 + 60, 210, 40);
    loginBtn.layer.masksToBounds = YES;
    loginBtn.layer.cornerRadius = 20.0f;
    loginBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [loginBtn setTitle:@"登  录" forState:UIControlStateNormal];
    [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    loginBtn.titleLabel.font = [UIFont systemFontOfSize:22.0f weight:5.0f];
    loginBtn.backgroundColor = [UIColor orangeColor];
    [loginBtn addTarget:self action:@selector(loginClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    
    //  regist
    registBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    registBtn.frame = CGRectMake(kScreenWidth/2 - 85, kScreenHeigth/2 + 60 + 120, 210, 40);
    registBtn.layer.masksToBounds = YES;
    registBtn.layer.cornerRadius = 20.0f;
    registBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [registBtn setTitle:@"注  册" forState:UIControlStateNormal];
    [registBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    registBtn.titleLabel.font = [UIFont systemFontOfSize:22.0f weight:5.0f];
    registBtn.backgroundColor = [UIColor orangeColor];
    [registBtn addTarget:self action:@selector(registClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registBtn];
    
    //  tourist
    touristBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    touristBtn.frame = CGRectMake(kScreenWidth/2 - 85, kScreenHeigth/2 + 60 + 180, 210, 40);
    touristBtn.layer.masksToBounds = YES;
    touristBtn.layer.cornerRadius = 20.0f;
    touristBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [touristBtn setTitle:@"游  客" forState:UIControlStateNormal];
    [touristBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    touristBtn.titleLabel.font = [UIFont systemFontOfSize:22.0f weight:5.0f];
    touristBtn.backgroundColor = [UIColor orangeColor];
    [touristBtn addTarget:self action:@selector(loginClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:touristBtn];
    
}

- (void)loginClick:(id)sender
{
    MarketViewController *loginVC = [[MarketViewController alloc] init];
    NavigationController *nav = [[NavigationController alloc] initWithRootViewController:loginVC];
    [self.navigationController presentViewController:nav animated:YES completion:nil];
    //    [self.navigationController presentModalViewController:loginVC animated:YES];
}

- (void)registClick
{
    NSLog(@"click registBtn !");
    MarketViewController *loginVC = [[MarketViewController alloc] init];
    [self.navigationController pushViewController:loginVC animated:YES];
    self.navigationController.navigationBarHidden = NO;
}

#pragma mark - tabbar delegate
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    if (tabBar == bottomTabBar) {
        switch (item.tag) {
            case 1:
                NSLog(@"首页");
                break;
                
            default:
                break;
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
