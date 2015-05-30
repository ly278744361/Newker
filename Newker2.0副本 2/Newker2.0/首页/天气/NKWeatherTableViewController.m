//
//  NKWeatherTableViewController.m
//  Newker
//
//  Created by lanou3g on 15/5/21.
//  Copyright (c) 2015年 谢腾飞. All rights reserved.
//

#import "NKWeatherTableViewController.h"
#import "UIBarButtonItem+Extension.h"
#import "NKCityGroup.h"
#import "MJRefresh.h"
#import "MJExtension.h"

@interface NKWeatherTableViewController ()

@property (nonatomic , strong)NSArray * cityGroup;

@end

@implementation NKWeatherTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.cityGroup = [NKCityGroup objectArrayWithFilename:@"cityGroups.plist" ];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    
    return self.cityGroup.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    NKCityGroup * group = self.cityGroup[section];
    
    return group.cities.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    // Configure the cell...
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    NKCityGroup * group = self.cityGroup[indexPath.section];
    
    cell.textLabel.text = group.cities[indexPath.row];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NKCityGroup * group = self.cityGroup[section];
    return group.title;
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return [self.cityGroup valueForKeyPath:@"title"];
}

@end
