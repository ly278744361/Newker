//
//  NKTabBarViewController.m
//  Newker
//
//  Created by lanou3g on 15/5/20.
//  Copyright (c) 2015年 谢腾飞. All rights reserved.
//

#import "NKTabBarViewController.h"
#import "NKHomeViewController.h"
#import "NKHotspotViewController.h"
#import "NKProfileViewController.h"
#import "NKNavigationController.h"
//#import "NKDiscussViewController.h"

@interface NKTabBarViewController ()

@end

@implementation NKTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NKHomeViewController * home = [[NKHomeViewController alloc] init];
    [self addChildVc:home title:@"首页" image:@"tabbar_home"];
    
    NKHotspotViewController * hotspot = [[NKHotspotViewController alloc] init];
    [self addChildVc:hotspot title:@"热点" image:@"tabbar_discover"];
    
    NKProfileViewController * profile = [[NKProfileViewController alloc] init];
    [self addChildVc:profile title:@"我的" image:@"tabbar_profile"];
    
//    NKDiscussViewController * discuss = [[NKDiscussViewController alloc] init];
//    [self addChildVc:discuss title:@"讨论" image:@"compose_mentionbutton_background"];
    
}

- (void)addChildVc:(UIViewController *)chiledVc title:(NSString *)title image:(NSString *)image
{
    
    chiledVc.title = title;
    chiledVc.tabBarItem.image = [UIImage imageNamed:image];
    NSMutableDictionary * textAttrs = [NSMutableDictionary dictionary];
    NSMutableDictionary * selectdic = [NSMutableDictionary dictionary];
    [chiledVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [chiledVc.tabBarItem setTitleTextAttributes:selectdic forState:UIControlStateSelected];
    chiledVc.view.backgroundColor = [UIColor whiteColor];
    
    NKNavigationController * nav = [[NKNavigationController alloc] initWithRootViewController:chiledVc];
    
    [self addChildViewController:nav];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
