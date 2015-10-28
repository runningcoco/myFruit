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

@interface PersonalViewController ()
{
    UIImageView *imgView;
    UIButton *headpotrait;
    
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
    
    imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeigth * 0.35)];
    imgView.backgroundColor = [UIColor orangeColor];
    imgView.userInteractionEnabled = YES;
    [self.view addSubview:imgView];
    
    headpotrait = [[UIButton alloc] initWithFrame:CGRectMake(imgView.frame.size.width/2 - 40, imgView.frame.size.height/2.5 - 40, 90, 90)];
    
    headpotrait.layer.cornerRadius = headpotrait.bounds.size.width/2;
    headpotrait.backgroundColor = [UIColor redColor];
    headpotrait.layer.masksToBounds = YES;
    [headpotrait addTarget:self action:@selector(myInformationClick) forControlEvents:UIControlEventTouchUpInside];
    [imgView addSubview:headpotrait];
    
}

- (void)myInformationClick
{
    NSLog(@"dian");
    MyInformationViewController *myInfo = [[MyInformationViewController alloc] init];
    myInfo.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:myInfo animated:YES completion:nil];
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
