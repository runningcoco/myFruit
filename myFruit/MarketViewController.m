//
//  LoginViewController.m
//  myFruit
//
//  Created by 我是僵尸 on 15/10/26.
//  Copyright (c) 2015年 echochief. All rights reserved.
//

#import "MarketViewController.h"

@interface MarketViewController () <UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource>
{
    UISearchBar *customSearchBar;
    UITableView *leftTV;
    UITableView *rightTV;
    NSArray *arrayName;
    
}

@end

@implementation MarketViewController


- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor orangeColor]];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *backBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 5, 24, 24)];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"ic_back"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *back = [[UIBarButtonItem alloc]initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = back;
    
    UIView *searchView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width - 100, 45)];
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
    
    leftTV = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth/4, kScreenHeigth)];
    UIView *headerview = [[UIView alloc]initWithFrame:CGRectZero];
    headerview.backgroundColor = [UIColor colorWithWhite:0.92 alpha:1.0f];
    leftTV.tableHeaderView = headerview;
    UIView *v = [[UIView alloc] init];
    leftTV.tableFooterView = v;
    leftTV.delegate = self;
    leftTV.dataSource = self;
    leftTV.scrollEnabled = NO;
    [self.view addSubview:leftTV];
    
    arrayName = [NSArray arrayWithObjects:@"限时优惠", @"一米团",@"每日推荐",@"Bigger套餐",@"缤纷鲜果",@"奶鲜饮品",@"乐享零食",nil];
    
    rightTV = [[UITableView alloc] initWithFrame:CGRectMake(kScreenWidth/5, 0, kScreenWidth *0.8, kScreenHeigth)];
    
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


#pragma mark - tableView delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [arrayName count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 7) {
        return 150;
    } else
        return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"生成的单元格(组：%li , 行%ld)",(long)indexPath.section, (long)indexPath.row);
    
    static NSString *cellIdentifier = @"cellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
    }
    
    cell.textLabel.textColor = [UIColor lightGrayColor];
    [cell.textLabel setText:[arrayName objectAtIndex:indexPath.row]];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.font = [UIFont systemFontOfSize:12.5f];
    
    UIView *v = [[UIView alloc] init];
    v.backgroundColor = [UIColor orangeColor];
    cell.selectedBackgroundView = v;
    cell.textLabel.highlightedTextColor = [UIColor whiteColor];
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
