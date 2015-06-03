//
//  TopNewsDetailController.m
//  Newker2.0
//
//  Created by lanou3g on 15/6/2.
//  Copyright (c) 2015年 谢腾飞. All rights reserved.
//

#import "TopNewsDetailController.h"
#import "TopNewsDetailsModel.h"
#import "TopNewsDetailView.h"
#import "Kr_AFNHTTPRequestOPManager.h"
#define TN_TOPNEWSWIDTH [[UIScreen mainScreen] bounds].size.width    //屏宽
#define TN_TOPNEWSHEIGHT [[UIScreen mainScreen] bounds].size.height
#define TN_SCREENWIDTH [UIScreen mainScreen].bounds.size.width //屏宽
#define TN_SCREENHEIGHT [UIScreen mainScreen].bounds.size.height
#define TN_TTTTT  @"/photo/api/set/0096/"
@interface TopNewsDetailController ()

@property(nonatomic,strong)UIButton *cButton;
@property(nonatomic,strong)TopNewsDetailView *Tn_topNewDetails;
@property(nonatomic,strong)NSMutableArray *arrayy;

@end

@implementation TopNewsDetailController

- (void)viewDidLoad {
    
    
    [super viewDidLoad];
    
//    self.view.backgroundColor = [UIColor whiteColor];
    [self getTopNewsDails];
    self.Tn_topNewDetails=[[TopNewsDetailView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.Tn_topNewDetails.titleLabel.text = self.selectTitle;
    self.arrayy=[[NSMutableArray alloc]initWithCapacity:10];
    
    self.view = self.Tn_topNewDetails;
    self.Tn_topNewDetails.userInteractionEnabled = YES;
    self.view.backgroundColor=[UIColor blackColor];
    
    self.cButton=[UIButton buttonWithType:UIButtonTypeCustom];
    self.cButton.frame=CGRectMake(10, 40, 30, 30);
    [self.cButton setBackgroundImage:[UIImage imageNamed:@"navigationbar_back_highlighted@2x"] forState:UIControlStateNormal];
    [self.cButton addTarget:self action:@selector(diss) forControlEvents:UIControlEventTouchDown];
    _cButton.tag = 1000;
    [self.view addSubview:_cButton];
    
    UIFont * font=[UIFont fontWithName:@"≤" size:30];
    UILabel * viewtext=[[UILabel alloc]initWithFrame:CGRectMake(TN_SCREENWIDTH/2+40, TN_SCREENHEIGHT/2+210, 120, 30)];
    viewtext.tag=1001;
    viewtext.text=@"";
    viewtext.textColor=[UIColor redColor];
    [viewtext setFont:font];
    [self.view addSubview:viewtext];
//
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#define mark  获取轮播图详情信息
-(void)getTopNewsDails
{
    NSString *a=[_detailUrl substringFromIndex:9];
    NSString *urlll=[NSString stringWithFormat:@"%@%@",a,@".json"];
    NSString *aaa =[TN_TTTTT stringByAppendingString:urlll];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [Kr_AFNHTTPRequestOPManager getWithSubUrl:aaa parameters:nil responseBlock:^(id result, NSError *error) {
            if (error) {
                NSLog(@"errrrrr %@",error);
            }
            NSArray *array=result[@"photos"];
            for (NSDictionary * dic in array) {
                TopNewsDetailsModel * details =[[TopNewsDetailsModel alloc]initWithAttributes:dic];
                [self.arrayy addObject:details];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                self.Tn_topNewDetails.topNewsDailsArray = self.arrayy;
            });
        }];
    });
}

-(void)diss
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
