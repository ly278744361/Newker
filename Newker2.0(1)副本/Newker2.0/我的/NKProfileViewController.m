//
//  NKProfileViewController.m
//  Newker2.0
//
//  Created by lanou3g on 15/5/31.
//  Copyright (c) 2015年 谢腾飞. All rights reserved.
//

#import "NKProfileViewController.h"
#import "NKFeedbackViewController.h"
#import "NKAboutViewController.h"
#import "SDImageCache.h"
#import "NKPeelingViewController.h"

#define MainScreen_Size [UIScreen mainScreen].bounds.size

#define MainScreen_Width [UIScreen mainScreen].bounds.size.width


#define MainScreen_Height [UIScreen mainScreen].bounds.size.height

#define SelfScreen_Size     self.view.bounds.size

@interface NKProfileViewController ()

@end

@implementation NKProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBar.translucent = NO;

    
    UIImageView *headView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, MainScreen_Width, MainScreen_Height/7 - 4)];
    headView.image = [UIImage imageNamed:@"tubiao"];
    NSMutableArray * imgs = [NSMutableArray array];
    for (int i = 2; i <= 50; i ++) {
        NSString * name = [NSString stringWithFormat:@"NewKer1－%d（被拖移）.tiff",i];
        UIImage * img = [UIImage imageNamed:name];
        if (!img) {
            continue;
        }
        [imgs addObject:img];
        headView.animationImages = imgs;
        headView.animationDuration = 5;
        [headView startAnimating];
    }
    [self.view addSubview:headView];
    
    /**************定制tableView*********************/
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height/4, MainScreen_Width, MainScreen_Height / 4 * 3) style:UITableViewStyleGrouped];
    tableView.bounces = NO;
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"otherViewCell"];
    
    tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:tableView];
}

    /***********定制HeaderInSection***************/

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *customView = [[UIView alloc]initWithFrame:CGRectMake(10, MainScreen_Height / 3 * 2, MainScreen_Width, MainScreen_Height/3 )];
    customView.backgroundColor=[UIColor cyanColor];
    customView.alpha=0.9;
    
    if (section == 0) {
        UIImageView *collectionImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 20, 20)];
        collectionImageView.image = [UIImage imageNamed:@"Set Up"];
        [customView addSubview:collectionImageView];

        UILabel *collectionLabel = [[UILabel alloc]initWithFrame:CGRectMake(35, 5, 200, 30)];
        collectionLabel.text = @"设置";
        collectionLabel.highlightedTextColor = [UIColor grayColor];
        [customView addSubview:collectionLabel];
       
    }
    
    if (section == 1) {
        UIImageView *cameraImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 20, 20)];
        cameraImageView.image = [UIImage imageNamed:@"tabbar_message_center_selected"];
        [customView addSubview:cameraImageView];

        UILabel *cameraLabel = [[UILabel alloc]initWithFrame:CGRectMake(35, 5, 200, 30)];
        cameraLabel.text = @"建议与反馈";
        [customView addSubview:cameraLabel];
        
    }
    
    return customView;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
   
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return MainScreen_Height / 14;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"otherViewCell"];
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"阅读模式";
            
        }
        else if(indexPath.row == 1){
            cell.textLabel.text = @"一键换肤";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        else
        {
            cell.textLabel.text = @"清除缓存";
            
        }
    }
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"关于我们";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        else if(indexPath.row == 1){
            cell.textLabel.text = @"意见反馈";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        else{
            cell.textLabel.text = @"熟悉Newker";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
    }
    
    return cell;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        [self cleanButton];
    }
    if (indexPath.section == 0 && indexPath.row == 1) {
        NKPeelingViewController * peeling = [[NKPeelingViewController alloc] init];
//        [self presentViewController:peeling animated:YES completion:nil];
        [self.navigationController pushViewController:peeling animated:YES];
    }
    if (indexPath.section == 0 && indexPath.row == 2) {
        [self cleanButton];
    }
    
    if(indexPath.section == 1 && indexPath.row==0){
        NKAboutViewController * about=[[NKAboutViewController alloc]init];
        [self.navigationController pushViewController:about animated:YES];
        
    }
    if(indexPath.section==1 && indexPath.row==1){
        NKFeedbackViewController * feedBack = [NKFeedbackViewController alloc ];
        [self.navigationController pushViewController:feedBack animated:YES];
    }
    
}

-(void)cleanButton
{
    CGFloat bety = [[SDImageCache sharedImageCache] getSize];
    CGFloat KB = bety/1024;
    CGFloat MB = KB/1024;
    CGFloat GB = MB/1024;
    if(KB>1024&&MB<1024){
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"清除缓存%.2fMB",MB] message:@"确定要清除缓存吗?" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
        [alertView show];
        
    }else if(MB>1024){
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"清除缓存%.2fG",GB] message:@"确定要清除缓存吗?" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
        [alertView show];
        
    }else if (KB<1024&&KB!=0){
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"清除缓存%.2fKB",KB] message:@"确定要清除缓存吗?" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
        [alertView show];
        
    }else{
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"没有要清理的缓存" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertView show];
        
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    [[SDImageCache sharedImageCache] clearMemory];
    [[SDImageCache sharedImageCache] cleanDisk];
    [[SDImageCache sharedImageCache] clearDisk];
    if(buttonIndex==0){
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"清除成功" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertView show];
        
    }
    
}

@end
