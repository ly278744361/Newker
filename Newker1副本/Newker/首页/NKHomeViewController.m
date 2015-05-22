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
#import "SDCycleScrollView.h"
@interface NKHomeViewController ()<SDCycleScrollViewDelegate>

@end

@implementation NKHomeViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(acquireweather) image:@"easyicon_net_25" highImage:nil];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(Newsbreak) image:@"easyicon_net_24" highImage:nil];
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
    SDCycleScrollView * cycleView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, 180) imageURLsGroup:imagesURL];
    //枚举值：page的对齐方式
    cycleView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    //遵循代理
    cycleView.delegate = self;
    
    cycleView.titlesGroup = titles;
    cycleView.titleLabelTextColor = [UIColor whiteColor];
    cycleView.dotColor = [UIColor whiteColor];
    cycleView.placeholderImage = [UIImage imageNamed:@"placeholder"];
    cycleView.autoScrollTimeInterval = 3.0;
    [self.view addSubview:cycleView];
    
    
    
};
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    
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
