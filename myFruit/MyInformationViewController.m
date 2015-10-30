//
//  MyInformationViewController.m
//  myFruit
//
//  Created by 我是僵尸 on 15/10/27.
//  Copyright (c) 2015年 echochief. All rights reserved.
//

#import "MyInformationViewController.h"

@interface MyInformationViewController ()

@end

@implementation MyInformationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setNavigationbar];
}

- (void)setNavigationbar
{
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth/2, self.navigationController.navigationBar.frame.size.height)];
    [self.navigationItem setTitleView:titleView];
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, titleView.frame.size.width, titleView.frame.size.height)];
    title.text = @"个人信息";
    title.textColor = [UIColor whiteColor];
    title.font = [UIFont fontWithName:@"Verdana-BoldItalic" size:17.0f];
    title.textAlignment = NSTextAlignmentCenter;
    [titleView addSubview:title];
    
    self.navigationController.navigationBar.topItem.titleView.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.topItem.title = @"个人信息";

    UIButton *backBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 5, 24, 24)];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"ic_back"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *back = [[UIBarButtonItem alloc]initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = back;
    
}

- (void)back
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
