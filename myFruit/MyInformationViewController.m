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
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    UINavigationBar *navigationbar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, screenRect.size.width, 50)];
    navigationbar.tintColor = [UIColor orangeColor];
    
    UILabel *titleV = [[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth/3, 0, kScreenWidth/3, navigationbar.frame.size.height)];
    titleV.backgroundColor = [UIColor clearColor];
    [titleV setText:@"个人信息"];
    titleV.textColor = [UIColor whiteColor];
    titleV.textAlignment = NSTextAlignmentCenter;
    
    UINavigationItem *navigationTitle = [[UINavigationItem alloc] init];
    [navigationbar addSubview:titleV];
    
//    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(back)];
//    [backItem setBackgroundImage:[UIImage imageNamed:@"ic_back"] forState:UIControlStateNormal style:UIBarButtonSystemItemReply barMetrics:UIBarMetricsDefault];
//    navigationTitle.leftBarButtonItem = backItem;
//    [navigationbar setItems:[NSArray arrayWithObject:navigationTitle]];
    
//    UIButton *backBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 5, 24, 24)];
//    [backBtn setBackgroundImage:[UIImage imageNamed:@"ic_back"] forState:UIControlStateNormal];
//    [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
//    UIBarButtonItem *back = [[UIBarButtonItem alloc]initWithCustomView:backBtn];
//    navigationTitle.leftBarButtonItem = back;
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"back" style:UIBarButtonSystemItemReply target:self action:@selector(back)];
    [navigationTitle setBackBarButtonItem:backItem];
    
    [self.view addSubview:navigationbar];
    
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
