//
//  PersonalViewController.m
//  myFruit
//
//  Created by 我是僵尸 on 15/10/27.
//  Copyright (c) 2015年 echochief. All rights reserved.
//

#import "PersonalViewController.h"
#import "MyInformationViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "NavigationController.h"

#define kImgViewHeight imgView.frame.size.height

@interface PersonalViewController () <UITableViewDelegate, UITableViewDataSource>
{
    UIImageView *imgView;
    UIButton *headpotrait;
    
    UILabel *nameLabel;
    UILabel *level;
    UILabel *levelInfo;
    
    UIButton *accountBtn;
    UIButton *cardBtn;
    UIButton *scoreBtn;
    
    UITableView *customActionTV;
    
}

@end

@implementation PersonalViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)setupUI
{
    self.navigationController.navigationBar.hidden = YES;
    self.view.backgroundColor = COLOR(242, 244, 248, 1);
    self.view.userInteractionEnabled = YES;
    
    imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeigth * 0.35)];
    imgView.backgroundColor = [UIColor orangeColor];
    imgView.userInteractionEnabled = YES;
    [self.view addSubview:imgView];
    
    headpotrait = [[UIButton alloc] initWithFrame:CGRectMake(kScreenWidth/2 - 45, kImgViewHeight/2.5 - 40, 90, 90)];
    
    headpotrait.layer.cornerRadius = headpotrait.bounds.size.width/2;
    headpotrait.backgroundColor = [UIColor redColor];
    headpotrait.layer.masksToBounds = YES;
    [headpotrait addTarget:self action:@selector(myInformationClick) forControlEvents:UIControlEventTouchUpInside];
    [imgView addSubview:headpotrait];
    
    nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth/2 - 24, kImgViewHeight/2.5 + 60, 48, 28)];
    nameLabel.text = @"网友";
    nameLabel.textColor = [UIColor grayColor];
    nameLabel.textAlignment = NSTextAlignmentCenter;
    nameLabel.font = [UIFont systemFontOfSize:14.0f];
    nameLabel.backgroundColor = [UIColor yellowColor];
    nameLabel.layer.cornerRadius = 14.0f;
    nameLabel.layer.masksToBounds = YES;
    [imgView addSubview:nameLabel];
    
    level = [[UILabel alloc] initWithFrame:CGRectMake(0, kImgViewHeight/2.5 + 90, kScreenWidth, 25)];
    level.text = @"等级:Lv1";
    level.font = [UIFont systemFontOfSize:12.0f];
    level.textAlignment = NSTextAlignmentCenter;
    level.textColor = [UIColor whiteColor];
    [imgView addSubview:level];
    
    levelInfo = [[UILabel alloc] initWithFrame:CGRectMake(0, kImgViewHeight/2.5 + 110, kScreenWidth, 25)];
    levelInfo.text = @"本月累计积分: 0  升级需要: 1000";
    levelInfo.font = [UIFont systemFontOfSize:12.0f];
    levelInfo.textAlignment = NSTextAlignmentCenter;
    levelInfo.textColor = [UIColor whiteColor];
    [imgView addSubview:levelInfo];
    
    accountBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, kImgViewHeight, (kScreenWidth - 2)/3, 65)];
    accountBtn.backgroundColor = [UIColor whiteColor];
    [accountBtn setTitle:@"0 元" forState:UIControlStateNormal];
    [accountBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [accountBtn addTarget:self action:@selector(accountClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:accountBtn];
    
    cardBtn = [[UIButton alloc] initWithFrame:CGRectMake(accountBtn.frame.size.width + 1, kImgViewHeight, (kScreenWidth - 2)/3, 65)];
    cardBtn.backgroundColor = [UIColor whiteColor];
    [cardBtn setTitle:@"0 个优惠券" forState:UIControlStateNormal];
    [cardBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [cardBtn addTarget:self action:@selector(accountClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cardBtn];
    
    scoreBtn = [[UIButton alloc] initWithFrame:CGRectMake(kScreenWidth - accountBtn.frame.size.width, kImgViewHeight, (kScreenWidth - 2)/3, 65)];
    scoreBtn.backgroundColor = [UIColor whiteColor];
    [scoreBtn setTitle:@"0 分" forState:UIControlStateNormal];
    [scoreBtn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [scoreBtn addTarget:self action:@selector(accountClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:scoreBtn];
    
    customActionTV = [[UITableView alloc] initWithFrame:CGRectMake(0, kImgViewHeight + 65, kScreenWidth, kScreenHeigth - kImgViewHeight - 80)];
    UIView *headerview = [[UIView alloc]initWithFrame:CGRectZero];
    headerview.backgroundColor = [UIColor colorWithWhite:0.92 alpha:1.0f];
    customActionTV.delegate = self;
    customActionTV.dataSource = self;
    customActionTV.tableHeaderView = headerview;
    UIView *v = [[UIView alloc]init];
    customActionTV.tableFooterView = v;
//    customActionTV.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
//    customActionTV.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    customActionTV.scrollEnabled = NO;
    [self.view addSubview:customActionTV];
}

- (void)accountClick
{
    NSLog(@"点了一下");
}

- (void)myInformationClick
{
    MyInformationViewController *myInfo = [[MyInformationViewController alloc] init];
    NavigationController *nav = [[NavigationController alloc] initWithRootViewController:myInfo];
    myInfo.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:nav animated:YES completion:nil];
}

#pragma mark - TableViewDataSource Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 6;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"生成的单元格(组：%li , 行%ld)",(long)indexPath.section, (long)indexPath.row);
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 25;
    } else
    return 15;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 5) {
        return 150;
    } else
        return 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
