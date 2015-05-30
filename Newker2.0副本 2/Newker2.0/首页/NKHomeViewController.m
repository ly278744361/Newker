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
#import "UIBarButtonItem+Extension.h"
#import "UIButton+Extension.h"
#import "NKRecreationTableViewController.h"
#import "NKNewsDayTableViewController.h"
#import "NKScienceTableViewController.h"
#import "NKFinanceTableViewController.h"
#import "NKFashionTableViewController.h"
#import "NKPhysicalTableViewController.h"
#import "SDCycleScrollView.h"
@interface NKHomeViewController ()<SDCycleScrollViewDelegate>

@end

@implementation NKHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(acquireweather) image:@"readercell_share_normal" highImage:@"readercell_share_highlight"];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(Newsbreak) image:@"top_navi_bell_normal" highImage:@"top_navi_bell_highlight"];
    
    
    [self.view addSubview:[UIButton buttonWithTitle:@"今日要闻" target:self selector:@selector(HotDay) frame:CGRectMake(0, self.view.bounds.size.height - 272, self.view.frame.size.width/3, 110) image:[UIImage imageNamed:@" "] darkTextColor:YES]];
    
    [self.view addSubview:[UIButton buttonWithTitle:@"娱乐频道" target:self selector:@selector(Recreation) frame:CGRectMake(self.view.frame.size.width/3, self.view.bounds.size.height - 272, self.view.frame.size.width/3, 110) image:[UIImage imageNamed:@" "] darkTextColor:YES]];
    
    [self.view addSubview:[UIButton buttonWithTitle:@"财经资讯" target:self selector:@selector(Finance) frame:CGRectMake(self.view.frame.size.width *2/3, self.view.bounds.size.height - 272, self.view.frame.size.width/3, 110) image:[UIImage imageNamed:@" "] darkTextColor:YES]];
    
    [self.view addSubview:[UIButton buttonWithTitle:@"时尚引领" target:self selector:@selector(Fashion) frame:CGRectMake(0, self.view.bounds.size.height - 162, self.view.frame.size.width/3, 110) image:[UIImage imageNamed:@" "] darkTextColor:YES]];
    
    [self.view addSubview:[UIButton buttonWithTitle:@"科技前沿" target:self selector:@selector(Science) frame:CGRectMake(self.view.frame.size.width/3, self.view.bounds.size.height - 162, self.view.frame.size.width/3, 110) image:[UIImage imageNamed:@" "] darkTextColor:YES]];
    
    [self.view addSubview:[UIButton buttonWithTitle:@"体育赛事" target:self selector:@selector(     Physical) frame:CGRectMake(self.view.frame.size.width *2/3, self.view.bounds.size.height - 162, self.view.frame.size.width/3, 110) image:[UIImage imageNamed:@" "] darkTextColor:YES]];
    
    //取消scrollView的自动留白设置
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //创建网络图片的数组
    NSArray *imagesURL = @[
                           [NSURL URLWithString:@"http://imgstore.cdn.sogou.com/app/a/100540002/640568.jpg"],
                           [NSURL URLWithString:@"http://d.hiphotos.baidu.com/zhidao/pic/item/32fa828ba61ea8d336bda72e960a304e251f5879.jpg"],
                           [NSURL URLWithString:@"http://b.hiphotos.baidu.com/zhidao/pic/item/203fb80e7bec54e7af4ec934b8389b504fc26a7e.jpg"],
                           [NSURL URLWithString:@"http://pic1.duowan.com/tx2/1206/204654444031/204655844826.jpg"]];
    //创建文字数组
    NSArray * titles = @[@"弈剑听雨阁",
                         @"云麓仙居",
                         @"冰心堂",
                         @"太虚观"];
    
    //调用SDCycle类
    SDCycleScrollView * cycleView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, 235) imageURLsGroup:imagesURL];
    //枚举值：page的对齐方式
    cycleView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    //遵循代理
    cycleView.delegate = self;
    cycleView.titlesGroup = titles;
    cycleView.titleLabelTextColor = [UIColor whiteColor];
    cycleView.dotColor = [UIColor whiteColor];
    cycleView.placeholderImage = [UIImage imageNamed:@"placeholder"];
    cycleView.autoScrollTimeInterval = 4.0;
    [self.view addSubview:cycleView];

}
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
   
}

- (void)Physical
{
    NKPhysicalTableViewController * physical = [[NKPhysicalTableViewController alloc] init];
    [self.navigationController pushViewController:physical animated:YES];
}

- (void)Fashion
{
    NKFashionTableViewController * fashion = [[NKFashionTableViewController alloc] init];
    fashion.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:fashion animated:YES];
}

- (void)Finance
{
    NKFinanceTableViewController * finance = [[NKFinanceTableViewController alloc] init];
    finance.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:finance animated:YES];
}

- (void)Science
{
    NKScienceTableViewController * science = [[NKScienceTableViewController alloc] init];
    science.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:science animated:YES];
}

- (void)Recreation
{
    NKRecreationTableViewController * recreation = [[NKRecreationTableViewController alloc] init];
    recreation.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:recreation animated:YES];
    
    NSLog(@"娱乐频道");
}

-(void)HotDay
{
    NKNewsDayTableViewController * newsDay = [[NKNewsDayTableViewController alloc] init];
    newsDay.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:newsDay animated:YES];
    NSLog(@"进入今日新闻");
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



@end
