//
//  SpecialTableViewController.m
//  Newker2.0
//
//  Created by lanou3g on 15/5/28.
//  Copyright (c) 2015年 谢腾飞. All rights reserved.
//

#import "SpecialTableViewController.h"
#import "Techonlogy.h"
#import "PhotosTableViewCell.h"
#import "BigPictureTableViewCell.h"
#import "CommonTableViewCell.h"
#import "RollTableViewCell.h"
#import "TextDetailsViewController.h"
#import "VideoDetailsViewController.h"
#import "PhotosDetailsViewController.h"
#import "MJRefresh.h"
#import "RollPhotosViewController.h"
#define BASE @"http://c.3g.163.com/nc/special/S1416188765511.html"
#define BASEV @"http://c.3g.163.com/nc/article/A6GBC74A0016688K/full.html"
#import "docs.h"
#import "DetailsViewController.h"

@interface SpecialTableViewController ()

@end

@implementation SpecialTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView.separatorStyle = NO;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return [self.special.topics count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return [[[self.special.topics objectAtIndex:section] objectForKey:@"docs"] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Docs * docs = [[Docs alloc] init];
    NSDictionary * dic = [[[self.special.topics objectAtIndex:indexPath.section] objectForKey:@"docs"] objectAtIndex:indexPath.row];
    [docs setValuesForKeysWithDictionary:dic];
    
    if (indexPath == 0) {
        
        static NSString * indentifer = @"Big";
        [self.tableView registerClass:[RollTableViewCell class] forCellReuseIdentifier:indentifer];
        RollTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:indentifer forIndexPath:indexPath];
        cell.docss = docs;
        return cell;
    }else{
        static NSString * indentifier = @"common";
        [self.tableView registerClass:[CommonTableViewCell class] forCellReuseIdentifier:indentifier];
        CommonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier forIndexPath:indexPath];
        cell.docss = docs;
        
        return cell;
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    Docs * docs = [[Docs alloc] init];
    NSDictionary *dic = [[[self.special.topics objectAtIndex:indexPath.section]objectForKey:@"docs"] objectAtIndex:indexPath.row];
    [docs setValuesForKeysWithDictionary:dic];
    
    NSString *filePath = BASE;
    NSString *string = @"article/";
    NSString *docid = [docs.docid stringByAppendingString:@"/full"];
    NSString *docid1 = [string stringByAppendingString:docid];
    filePath = [filePath stringByReplacingOccurrencesOfString:@"special/S1416188765511" withString:docid1];
    NSURL *url = [NSURL URLWithString:filePath];
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0f];
    NSURLResponse  *response= nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    NSDictionary *dic1 = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSDictionary *dict = [dic1 objectForKey:docs.docid];
    Details *details = [[Details alloc] init];
    [details setValuesForKeysWithDictionary:dict];
    
    
    if ([details.img count]==0&&!details.photosetID&&!details.video)
    {
        TextDetailsViewController *TVC = [[TextDetailsViewController alloc] init];
        TVC.stringurl = filePath;
        TVC.docid = docs.docid;
        TVC.digest = docs.digset;
        [self.navigationController pushViewController:TVC animated:YES];
        NSLog(@"====0");
        
    }else if ([details.img count]==1 &&!details.photosetID&&!details.video)
    {
        DetailsViewController *DVC = [[DetailsViewController alloc] init];
        DVC.stringurl = filePath;
        DVC.docid = docs.docid;
        DVC.digest = docs.digset;
        [self.navigationController pushViewController:DVC animated:YES];

        NSLog(@"====1");
        
        
    }else if ([details.img count]>=2&&!details.photosetID&&!details.video){
        
        PhotosDetailsViewController *PVC = [[PhotosDetailsViewController alloc] init];
        PVC.stringurl = filePath;
        PVC.docid = docs.docid;
        PVC.digest = docs.digset;
        [self.navigationController pushViewController:PVC animated:YES];
        NSLog(@"===>2");
    }
    if (details.video){
        
        NSString *filePath = BASEV;
        filePath = [filePath stringByReplacingOccurrencesOfString:@"A6GBC74A0016688K" withString:details.docid];
        NSURL *url = [NSURL URLWithString:filePath];
        NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0f];
        NSURLResponse  *response= nil;
        NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
        NSDictionary *dic1 = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSDictionary *dict = [dic1 objectForKey:docs.docid];
        Details *details = [[Details alloc] init];
        [details setValuesForKeysWithDictionary:dict];
        
        VideoDetailsViewController *VVC = [[VideoDetailsViewController alloc] init];
        VVC.stringurl = filePath;
        VVC.docid = docs.docid;
        VVC.digest = docs.digset;
        VVC.details = details;
        [self.navigationController pushViewController:VVC animated:YES];
        
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

@end
