//
//  LoginViewController.m
//  myFruit
//
//  Created by 我是僵尸 on 15/10/26.
//  Copyright (c) 2015年 echochief. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController () <UISearchBarDelegate>
{
    UISearchBar *customSearchBar;
}

@end

@implementation LoginViewController

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor orangeColor]];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *backBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 5, 24, 24)];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"ic_back"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *back = [[UIBarButtonItem alloc]initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = back;
    
    UIView *searchView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width - 100, 45)];
    //    searchView.backgroundColor = [UIColor redColor];
    [self.navigationItem setTitleView:searchView];
    
    customSearchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 5, self.view.frame.size.width - 100, 30)];
    customSearchBar.barStyle = UISearchBarStyleDefault;
    [customSearchBar setBarTintColor:[UIColor clearColor]];
    customSearchBar.autocorrectionType = UITextAutocorrectionTypeNo;
    customSearchBar.placeholder = @"搜水果搜水果...";
    customSearchBar.keyboardType = UIKeyboardAppearanceDefault;
    customSearchBar.delegate = self;
    customSearchBar.layer.cornerRadius = 5.0f;
    customSearchBar.layer.masksToBounds = YES;
    customSearchBar.layer.borderColor = [[UIColor orangeColor] CGColor];
    customSearchBar.layer.borderWidth = 1.0f;
    customSearchBar.backgroundColor = [UIColor clearColor];
    customSearchBar.showsCancelButton = NO;
    [self.navigationItem.titleView sizeToFit];
    [searchView addSubview:customSearchBar];
}

-(void)backClick
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UISearchBar
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSLog(@"search click!");
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [customSearchBar resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
