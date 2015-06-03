//
//  VideosTableViewController.m
//  Newker2.0
//
//  Created by lanou3g on 15/5/28.
//  Copyright (c) 2015年 谢腾飞. All rights reserved.
//

#import "VideosTableViewController.h"
#import "CommonTableViewCell.h"
@interface VideosTableViewController ()

@end

@implementation VideosTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return [self.videos.recommend count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Videos * videosCell = [[Videos alloc] init];
    [videosCell setValuesForKeysWithDictionary:[self.videos.recommend objectAtIndex:indexPath.row]];
    static NSString * identifier = @"video";
    [tableView registerClass:[CommonTableViewCell class] forCellReuseIdentifier:identifier];
    CommonTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    cell.videos = videosCell;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Videos * videos = [[Videos alloc] init];
    [videos setValuesForKeysWithDictionary:[self.videos.recommend objectAtIndex:indexPath.row]];
    UIWebView * webView = [[UIWebView alloc] init];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:videos.m3u8_url]]];
}


@end
