//
//  NKHomeViewController.m
//  Newker
//
//  Created by lanou3g on 15/5/20.
//  Copyright (c) 2015年 谢腾飞. All rights reserved.
//

#import "NKHomeViewController.h"
#import "NKWeatherViewController.h"
#import "NKNewsbreakViewController.h"
@interface NKHomeViewController ()

@end

@implementation NKHomeViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(acquireweather) image:@"easyicon_net_25" highImage:nil];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(Newsbreak) image:@"easyicon_net_24" highImage:nil];
    
}

- (void)acquireweather
{
    NKWeatherViewController * weather = [[NKWeatherViewController alloc] init];
    weather.title = @"选择你所在的城市";
    weather.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:weather animated:YES];
   
    NSLog(@"天气接口");
    
}

- (void)Newsbreak
{
    NKNewsbreakViewController * newsbreak = [[NKNewsbreakViewController alloc] init];
    newsbreak.title = @"重点要闻";
    newsbreak.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:newsbreak animated:YES];
    
    NSLog(@"重要新闻接口");
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
