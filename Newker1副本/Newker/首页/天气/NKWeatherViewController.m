//
//  NKWeatherViewController.m
//  Newker
//
//  Created by lanou3g on 15/5/21.
//  Copyright (c) 2015年 谢腾飞. All rights reserved.
//

#import "NKWeatherViewController.h"
#import "NKWeatherTableViewController.h"

@interface NKWeatherViewController ()

@property (nonatomic , strong) NKWeatherTableViewController * weatherTVC;

@end

@implementation NKWeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = NKColor(231, 231, 231);
    NKWeatherTableViewController * weatherTVC = [[NKWeatherTableViewController alloc] init];
    weatherTVC.view.frame = CGRectMake(0, 150, self.view.bounds.size.width, self.view.bounds.size.height);
    weatherTVC.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:weatherTVC.view];
    self.weatherTVC = weatherTVC;

    
#pragma mark--------------------------添加搜索框-------------------------------------
    
    NKSearchBar * searchBar = [NKSearchBar searchBar];
    searchBar.frame = CGRectMake(10, 70, self.view.bounds.size.width - 20, 30);
    searchBar.keyboardType = UIKeyboardTypeEmailAddress;
    searchBar.returnKeyType = UIReturnKeyDone;
    [self.view addSubview:searchBar];

    
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
