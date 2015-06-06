//
//  AppDelegate.m
//  Newker2.0
//
//  Created by lanou3g on 15/5/25.
//  Copyright (c) 2015年 谢腾飞. All rights reserved.
//

#import "AppDelegate.h"
#import "NKTabBarViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] init];
    self.window.frame = [UIScreen mainScreen].bounds;
    self.window.rootViewController = [[NKTabBarViewController alloc] init];
    
    [self.window makeKeyAndVisible];
    return YES;
}

@end
