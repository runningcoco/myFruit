//
//  Tarbar.h
//  myFruit
//
//  Created by 我是僵尸 on 15/10/27.
//  Copyright (c) 2015年 echochief. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Tarbar;

@protocol TabBarDelegate <UITabBarDelegate>
@optional

@end

@interface Tarbar : UITabBar
@property (nonatomic, weak) id <TabBarDelegate> delegate;
@end
