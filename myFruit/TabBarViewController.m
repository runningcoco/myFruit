//
//  NavigationViewController.m
//  myFruit
//
//  Created by 我是僵尸 on 15/10/26.
//  Copyright (c) 2015年 echochief. All rights reserved.
//

#import "TabBarViewController.h"
#import "NavigationController.h"
#import "MarketViewController.h"
#import "ShoppingcartViewController.h"
#import "OrdersViewController.h"
#import "HomeViewController.h"
#import "PersonalViewController.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    MarketViewController *home = [[MarketViewController alloc] init];
    [self addCViewController:home title:@"商店" image:nil selectedImage:nil];
    
    ShoppingcartViewController *box = [[ShoppingcartViewController alloc] init];
    [self addCViewController:box title:@"购物车" image:nil selectedImage:nil];
    
    OrdersViewController *orders = [[OrdersViewController alloc] init];
    [self addCViewController:orders title:@"订单" image:nil selectedImage:nil];
    
    PersonalViewController *myself = [[PersonalViewController alloc] init];
    [self addCViewController:myself title:@"我的" image:nil selectedImage:nil];
    
    UITabBar *tabBar = [[UITabBar alloc] init];
    [tabBar setTintColor:[UIColor orangeColor]];
    [self setValue:tabBar forKey:@"tabBar"];
    
//    UITabBarItem *myself1 = [[UITabBarItem alloc] initWithTitle:@"我的" image:nil selectedImage:nil];
//    [tabBar addSubview:myself1];
}

- (void)addCViewController:(UIViewController *)childController title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    childController.title = title;
    childController.tabBarItem.image = [UIImage imageNamed:image];
    childController.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    NSMutableDictionary *textAttrs4 = [NSMutableDictionary dictionary];
    textAttrs4[NSForegroundColorAttributeName] = [UIColor greenColor];
    [childController.tabBarItem setTitleTextAttributes:textAttrs4 forState:UIControlStateNormal];
    
//    NSMutableDictionary *selectedTextAttrs4 = [NSMutableDictionary dictionary];
//    selectedTextAttrs4[NSForegroundColorAttributeName] = [UIColor orangeColor];
//    [childController.tabBarItem setTitleTextAttributes:selectedTextAttrs4 forState:UIControlStateSelected];
    
    NavigationController *nav = [[NavigationController alloc] initWithRootViewController:childController];
    [self addChildViewController:nav];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
