//
//  SINTabBarController.m
//  PLMMPRJK
//
//  Created by HuXuPeng on 2017/5/11.
//  Copyright © 2017年 GoMePrjk. All rights reserved.
//

#import "SINTabBarController.h"
#import "SINHomeViewController.h"
#import "SINMessageViewController.h"
#import "SINPublishViewController.h"
#import "SINDiscoveryViewController.h"
#import "SINProfileViewController.h"
#import "SINTabBar.h"

@interface SINTabBarController ()

@end

@implementation SINTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBar.tintColor = [UIColor orangeColor];
    self.titlePositionAdjustment = UIOffsetMake(0, -3);
   
    [self addTabarItems];
    [self addChildViewControllers];
    
}



/**
 *  利用 KVC 把系统的 tabBar 类型改为自定义类型。覆盖父类方法
 */
- (void)setUpTabBar {
    SINTabBar *tabBar = [[SINTabBar alloc] init];
    
    LMJWeakSelf(self);
    [tabBar setPublishBtnClick:^(SINTabBar *tabBar, UIButton *publishBtn){
        
        SINPublishViewController *publishVc = [[SINPublishViewController alloc] init];
        
        [weakself presentViewController:[[LMJNavigationController alloc] initWithRootViewController:publishVc] animated:YES completion:nil];
        
    }];
    
    [self setValue:tabBar forKeyPath:LMJKeyPath(self, tabBar)];
}

- (void)addChildViewControllers
{
    LMJNavigationController *one = [[LMJNavigationController alloc] initWithRootViewController:[[SINHomeViewController alloc] init]];
    
    LMJNavigationController *two = [[LMJNavigationController alloc] initWithRootViewController:[[SINMessageViewController alloc] init]];
    
    LMJNavigationController *four = [[LMJNavigationController alloc] initWithRootViewController:[[SINDiscoveryViewController alloc] init]];
    
    LMJNavigationController *five = [[LMJNavigationController alloc] initWithRootViewController:[[SINProfileViewController alloc] init]];
    
    self.viewControllers = @[one, two, four, five];
    
}

/*
 
 tabbar_home
 */

- (void)addTabarItems
{
    
    
    NSDictionary *firstTabBarItemsAttributes = @{
                                                 CYLTabBarItemTitle : @"首页",
                                                 CYLTabBarItemImage : @"tabbar_home",
                                                 CYLTabBarItemSelectedImage : @"tabbar_home_highlighted",
                                                 };
    
    NSDictionary *secondTabBarItemsAttributes = @{
                                                  CYLTabBarItemTitle : @"消息",
                                                  CYLTabBarItemImage : @"tabbar_message_center",
                                                  CYLTabBarItemSelectedImage : @"tabbar_message_center_highlighted",
                                                  };
    NSDictionary *thirdTabBarItemsAttributes = @{
                                                 CYLTabBarItemTitle : @"发现",
                                                 CYLTabBarItemImage : @"tabbar_discover",
                                                 CYLTabBarItemSelectedImage : @"tabbar_discover_highlighted",
                                                 };
    
    NSDictionary *fourthTabBarItemsAttributes = @{
                                                  CYLTabBarItemTitle : @"我的",
                                                  CYLTabBarItemImage : @"tabbar_profile",
                                                  CYLTabBarItemSelectedImage : @"tabbar_profile_highlighted"
                                                  };
    
    self.tabBarItemsAttributes = @[
                                   firstTabBarItemsAttributes,
                                   thirdTabBarItemsAttributes,
                                   secondTabBarItemsAttributes,
                                   fourthTabBarItemsAttributes
                                   ];
    
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    return YES;
}


@end
