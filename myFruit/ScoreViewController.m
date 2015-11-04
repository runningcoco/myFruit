//
//  ScoreViewController.m
//  myFruit
//
//  Created by 我是僵尸 on 15/11/3.
//  Copyright (c) 2015年 echochief. All rights reserved.
//

#import "ScoreViewController.h"

@interface ScoreViewController ()

@end

@implementation ScoreViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth/2, self.navigationController.navigationBar.frame.size.height)];
    [self.navigationItem setTitleView:titleView];
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, titleView.frame.size.width, titleView.frame.size.height)];
    title.text = @"积分商城";
    title.textColor = [UIColor whiteColor];
    title.font = [UIFont fontWithName:@"Verdana-BoldItalic" size:17.0f];
    title.textAlignment = NSTextAlignmentCenter;
    [titleView addSubview:title];
    
    self.navigationController.navigationBar.topItem.titleView.tintColor = [UIColor whiteColor];
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
