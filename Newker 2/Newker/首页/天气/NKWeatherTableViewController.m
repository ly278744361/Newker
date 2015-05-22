//
//  NKWeatherTableViewController.m
//  Newker
//
//  Created by lanou3g on 15/5/21.
//  Copyright (c) 2015年 谢腾飞. All rights reserved.
//

#import "NKWeatherTableViewController.h"

@interface NKWeatherTableViewController ()

@end

@implementation NKWeatherTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 2;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    // Configure the cell...
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        
        
    }
    
    
    cell.textLabel.text = [NSString stringWithFormat:@"测试数据--%ld",indexPath.row + 1];
    
    return cell;
}


@end
