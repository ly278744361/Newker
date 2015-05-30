//
//  NKNewsDayTableViewController.m
//  Newker2.0
//
//  Created by lanou3g on 15/5/28.
//  Copyright (c) 2015年 谢腾飞. All rights reserved.
//

#import "NKNewsDayTableViewController.h"
#define BaseNews @"http://c.3g.163.com/nc/article/headline/T1348647909107/0-20.html"
#define BasePTDetal @"http://c.3g.163.com/photo/api/set/0096/52249.json"
#define BaseVideo @"http://c.3g.163.com/nc/video/detail/VABOPUC4S.html"
#import "Techonlogy.h"
#import "PhotosTableViewCell.h"
#import "BigPictureTableViewCell.h"
#import "CommonTableViewCell.h"
#import "RollTableViewCell.h"
#import "Details.h"
#import "DetailsViewController.h"
#import "TextDetailsViewController.h"
#import "VideoDetailsViewController.h"
#import "PhotosDetailsViewController.h"
#import "MJRefresh.h"
#import "DataHandle.h"
#import "RollPhotosViewController.h"
#import "VideoDetailsViewController.h"
#import "Special.h"
#import "SpecialTableViewController.h"
#import "Videos.h"
#import "VideosTableViewController.h"
@interface NKNewsDayTableViewController ()

@property (nonatomic , strong)UIActivityIndicatorView * quanquan;

@end

static NSInteger PN = 20;
@implementation NKNewsDayTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.view.backgroundColor = [UIColor whiteColor];
    [self creatquanquan];
    self.navigationController.title = @"今日要闻";
    [self jsonData];
    [self.tableView addLegendFooterWithRefreshingTarget:self refreshingAction:@selector(footerRereshing)];
    [self.tableView addLegendHeaderWithRefreshingTarget:self refreshingAction:@selector(headerRereshing)];
}

- (void)footerRereshing
{
    [self performSelector:@selector(reloadFooter) withObject:self afterDelay:2.0];
    
}

- (void)reloadFooter
{
    [self.tableView.footer endRefreshing];
    [self refreshPN];
}

- (void)refreshPN
{
    PN+=20;
    [self jsonData];
}

- (void)headerRereshing
{
    [self performSelector:@selector(reloadHeader) withObject:self afterDelay:1.0];
}

- (void)reloadHeader
{
    [self.tableView.header endRefreshing];
    [self jsonData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Table view data source

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    Techonlogy *techonlogy = [self.hotspotArray objectAtIndex:indexPath.row];
    NSString *filePath = BaseNews;
    NSString *docid = [techonlogy.docid stringByAppendingString:@"/full"];
    filePath = [filePath stringByReplacingOccurrencesOfString:@"headline/T1348647909107/0-20" withString:docid];
    NSURL *url = [NSURL URLWithString:filePath];
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0f];
    NSURLResponse  *response= nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    if (data == nil) {
        return;
    }
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSDictionary *dict = [dic objectForKey:techonlogy.docid];
    Details *details = [[Details alloc] init];
    [details setValuesForKeysWithDictionary:dict];
    
    if (techonlogy.photosetID&&techonlogy.imgextra) {
        NSString *filePath1 = BasePTDetal;
        NSArray *array = [techonlogy.photosetID componentsSeparatedByString:@"|"];
        filePath1 = [filePath1 stringByReplacingOccurrencesOfString:@"52249" withString:[array objectAtIndex:1]];
        NSURL *Purl = [NSURL URLWithString:filePath1];
        NSURLRequest *request1 = [NSURLRequest requestWithURL:Purl cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20];
        NSURLResponse *response1 = nil;
        NSData *data1 = [NSURLConnection sendSynchronousRequest:request1 returningResponse:&response1 error:nil];
        if (data1 == nil) {
            return;
        }
        
        NSDictionary *dic1 = [NSJSONSerialization JSONObjectWithData:data1 options:NSJSONReadingMutableContainers error:nil];
        PhotosModle *photosdetail = [[PhotosModle alloc] init];
        [photosdetail setValuesForKeysWithDictionary:dic1];
        
        RollPhotosViewController *RVC = [[RollPhotosViewController alloc] init];
        RVC.photosModle = photosdetail;
        [self.navigationController pushViewController:RVC animated:YES];
    }
    
    //专题详情
    if ([techonlogy.skipType isEqualToString:@"special"]){
        NSString *filePath1 = BaseNews;
        NSString *string = @"special/";
        NSString *special = [string stringByAppendingString:techonlogy.specialID];
        filePath1 = [filePath1 stringByReplacingOccurrencesOfString:@"article/headline/T1348647909107/0-20" withString:special];
        NSURL *url1 = [NSURL URLWithString:filePath1];
        NSURLRequest *request1 = [NSURLRequest requestWithURL:url1 cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0f];
        NSURLResponse  *response1= nil;
        NSData *data1 = [NSURLConnection sendSynchronousRequest:request1 returningResponse:&response1 error:nil];
        if (data1 == nil) {
            return;
        }
        NSDictionary *dic1 = [NSJSONSerialization JSONObjectWithData:data1 options:NSJSONReadingMutableContainers error:nil];
        NSDictionary *dict1 = [dic1 objectForKey:techonlogy.specialID];
        Special *speciall = [[Special alloc] init];
        [speciall setValuesForKeysWithDictionary:dict1];
        SpecialTableViewController *STVC = [[SpecialTableViewController alloc] init];
        STVC.special = speciall;
        [self.navigationController pushViewController:STVC animated:YES];
    }
    
    if ([techonlogy.skipType isEqualToString:@"video"]&&![techonlogy.skipType isEqualToString:@"special"]) {
        NSString *filePath = BaseVideo;
        filePath = [filePath stringByReplacingOccurrencesOfString:@"VABOPUC4S" withString:techonlogy.skipID];
        NSURL *url = [NSURL URLWithString:filePath];
        NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20];
        NSURLResponse *response = nil;
        NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
        if (data == nil) {
            return;
        }
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSDictionary *dict = [dic objectForKey:techonlogy.videoID];
        Videos *videos = [[Videos alloc] init];
        [videos setValuesForKeysWithDictionary:dict];
        VideosTableViewController *VDVC = [[VideosTableViewController alloc] init];
        VDVC.videos = videos;
        [self.navigationController pushViewController:VDVC animated:YES];
        
    }
    
    if ([details.img count]==0&&!techonlogy.photosetID&&!details.video&&![techonlogy.skipType isEqualToString:@"special"])
    {
        TextDetailsViewController *TVC = [[TextDetailsViewController alloc] init];
        TVC.stringurl = filePath;
        TVC.docid = techonlogy.docid;
        TVC.digest = techonlogy.digest;
        [self.navigationController pushViewController:TVC animated:YES];
        
    }else if ([details.img count]==1&&!techonlogy.photosetID&&!details.video&&![techonlogy.skipType isEqualToString:@"special"])
    {
        DetailsViewController *DVC = [[DetailsViewController alloc] init];
        DVC.stringurl = filePath;
        DVC.docid = techonlogy.docid;
        DVC.digest = techonlogy.digest;
        
        [self.navigationController pushViewController:DVC animated:YES];
        
    }else if ([details.img count]>=2&&!techonlogy.photosetID&&!details.video&&![techonlogy.skipType isEqualToString:@"special"]){
        
        PhotosDetailsViewController *PVC = [[PhotosDetailsViewController alloc] init];
        PVC.stringurl = filePath;
        PVC.docid = techonlogy.docid;
        PVC.digest = techonlogy.digest;
        
        [self.navigationController pushViewController:PVC animated:YES];
    }else if (details.video&&![techonlogy.skipType isEqualToString:@"special"]){
        VideoDetailsViewController *VVC = [[VideoDetailsViewController alloc] init];
        VVC.details = details;
        [self.navigationController pushViewController:VVC animated:YES];
    }
    
    
}
-(void)creatquanquan
{
    self.quanquan = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    self.quanquan.frame = CGRectMake(0, 0, 220, 120);
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 80, 220, 20)];
    label.font = [UIFont systemFontOfSize:12.0f];
    label.textColor = [UIColor lightGrayColor];
    label.text = @"Newker小二正在努力加载中......";
    label.textAlignment = NSTextAlignmentCenter;
    [self.quanquan addSubview:label];
    self.quanquan.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2 ,[UIScreen mainScreen].bounds.size.height/2 -100);
    self.quanquan.color = [UIColor grayColor];
    self.quanquan.hidesWhenStopped = YES;
    [self.quanquan startAnimating];
    [self.view addSubview:self.quanquan];
    
}

- (void)jsonData
{
    NSString *pn = [NSString stringWithFormat:@"-%ld",(long)PN];
    NSURL *url = [NSURL URLWithString:[BaseNews stringByReplacingOccurrencesOfString:@"-20" withString:pn]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20];
    NSOperationQueue *queue = [NSOperationQueue mainQueue];
    __block NKNewsDayTableViewController *FTVC = self;
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if(data == nil){
            return ;
        }
        //解析
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        self.hotspotArray = [NSMutableArray array];
        NSArray *array = [dic objectForKey:@"T1348647909107"];
        for (NSDictionary *dic in array){
            Techonlogy *techonlogy = [[Techonlogy alloc] init];
            [techonlogy setValuesForKeysWithDictionary:dic];
            [FTVC.hotspotArray addObject:techonlogy];
        }
        [self.quanquan stopAnimating];
        [FTVC.tableView reloadData];
    }];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.hotspotArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Techonlogy *techonlogy = [self.hotspotArray objectAtIndex:indexPath.row];
    if (indexPath.row==0)
    {
        static NSString *identifierroll = @"roll";
        [self.tableView registerClass:[RollTableViewCell class] forCellReuseIdentifier:identifierroll];
        RollTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierroll forIndexPath:indexPath];
        cell.techonlogy =techonlogy;
        return cell;
        
    }else if (techonlogy.imgextra){
        static NSString *identifierPhoto = @"photo";
        [self.tableView registerClass:[PhotosTableViewCell class] forCellReuseIdentifier:identifierPhoto];
        PhotosTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierPhoto forIndexPath:indexPath];
        cell.techonlogy = techonlogy;
        return cell;
        
    }else if(techonlogy.imgType==1){
        static NSString *identifierBig = @"Big";
        [self.tableView registerClass:[BigPictureTableViewCell class] forCellReuseIdentifier:identifierBig];
        BigPictureTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierBig forIndexPath:indexPath];
        cell.techonlogy = techonlogy;
        return cell;
        
    }else {
        if ([techonlogy.skipType isEqualToString:@"live"]){
            static NSString *identifier = @"live";
            [self.tableView registerClass:[CommonTableViewCell class] forCellReuseIdentifier:identifier];
            CommonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
            cell.techonlogy =techonlogy;
            [cell.contentView removeFromSuperview];
            return cell;
        }
        static NSString *identifier = @"technology";
        [self.tableView registerClass:[CommonTableViewCell class] forCellReuseIdentifier:identifier];
        CommonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
        cell.techonlogy =techonlogy;
        return cell;
    }
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    Techonlogy *techonlogy = [self.hotspotArray objectAtIndex:indexPath.row];
    
    if (indexPath.row==0)
    {
        return 230;
    }else if (techonlogy.imgextra)
    {
        return 110;
    }else if (techonlogy.imgType==1){
        return 160;
    }else if ([techonlogy.skipType isEqualToString:@"live"]){
        return 0;
    }
    return 70;
    
}


@end
