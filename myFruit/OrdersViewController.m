//
//  OrdersViewController.m
//  myFruit
//
//  Created by dstwuhan on 15/10/27.
//  Copyright (c) 2015年 echochief. All rights reserved.
//

#import "OrdersViewController.h"

@interface OrdersViewController ()

@end

@implementation OrdersViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth/2, self.navigationController.navigationBar.frame.size.height)];
    
    NSLog(@"frame:%@",NSStringFromCGRect(titleView.frame));
    
    [self.navigationItem setTitleView:titleView];
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, titleView.frame.size.width, titleView.frame.size.height)];
    title.text = @"最近的订单";
    title.textColor = [UIColor whiteColor];
    title.font = [UIFont fontWithName:@"Verdana-BoldItalic" size:17.0f];
    title.textAlignment = NSTextAlignmentCenter;
    [titleView addSubview:title];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
