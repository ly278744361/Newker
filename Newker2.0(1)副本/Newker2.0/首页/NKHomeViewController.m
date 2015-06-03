//
//  NKHomeViewController.m
//  Newker
//
//  Created by lanou3g on 15/5/20.
//  Copyright (c) 2015年 谢腾飞. All rights reserved.
//


#import "TopNewsView.h"
#import "NKHomeViewController.h"
#import "NKNewsbreakViewController.h"
#import "UIBarButtonItem+Extension.h"
#import "UIButton+Extension.h"
#import "NKRecreationTableViewController.h"
#import "NKNewsDayTableViewController.h"
#import "NKScienceTableViewController.h"
#import "NKFinanceTableViewController.h"
#import "NKFashionTableViewController.h"
#import "NKPhysicalTableViewController.h"
#import "NKMilitaryTableViewController.h"
#import "NKHistoryTableViewController.h"
#import "NKOpenClassTableViewController.h"
#import "TopNewInfoModel.h"
#import "TopNewsDetailsModel.h"
#import "TopNewsDetailController.h"
//轮播图接口
#define TN_Topics_Feature @"http://c.m.163.com/nc/ad/headline/0-4.html"
//轮播图点击详情接口
#define TN_Topics_Details @"http://c.m.163.com"

#define ScreenHeight [UIScreen mainScreen].bounds.size.height
//  屏幕宽度
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define TN_TOPNEWSWIDTH [[UIScreen mainScreen] bounds].size.width    //屏宽
#define TN_TOPNEWSHEIGHT [[UIScreen mainScreen] bounds].size.height

@interface NKHomeViewController ()<pushDelegate>
{
    NSMutableArray * _homePageNewsData;
    
    NSUInteger currentPage;
    
    
    
}

@property (nonatomic, strong) NSMutableArray * array;

@property (nonatomic, strong) TopNewsView * topNewsView;




@end

@implementation NKHomeViewController


-(TopNewsView *)topNewsView
{
    
    if (!_topNewsView) {
        
//        _topNewsView.backgroundColor = [UIColor redColor];
        _topNewsView = [[TopNewsView alloc] initWithFrame:CGRectMake(0, 0, TN_TOPNEWSWIDTH, [UIScreen mainScreen].bounds.size.height-64-320)];
        
    }
    return _topNewsView;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
//    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(acquireweather) image:@"readercell_share_normal" highImage:@"readercell_share_highlight"];
    
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.topNewsView = [[TopNewsView alloc] initWithFrame:CGRectMake(0, 64, TN_TOPNEWSWIDTH, [UIScreen mainScreen].bounds.size.height-64-320)] ;
    
//    self.topNewsView.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:self.topNewsView];
    
    
    _homePageNewsData = [NSMutableArray array];
    
    self.topNewsView.delegate = self;
    
    [self getTopNews];
    
    currentPage = 0;
    
    
//    NSLog(@"%f",[UIScreen mainScreen].bounds.size.height);
//    NSLog(@"%f",self.view.bounds.size.height);
//    
    
    
                                                                    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(Newsbreak) image:@"top_navi_bell_normal" highImage:@"top_navi_bell_highlight"];
    
    
    [self.view addSubview:[UIButton buttonWithTitle:@"今日要闻" target:self selector:@selector(HotDay) frame:CGRectMake(0, self.view.bounds.size.height - 320, self.view.frame.size.width/3, 90) image:[UIImage imageNamed:@"today's news"] darkTextColor:YES]];
    
    [self.view addSubview:[UIButton buttonWithTitle:@"娱乐八卦" target:self selector:@selector(Recreation) frame:CGRectMake(self.view.frame.size.width/3, self.view.bounds.size.height - 320, self.view.frame.size.width/3, 90) image:[UIImage imageNamed:@"Entertainment channel"] darkTextColor:YES]];
    
    [self.view addSubview:[UIButton buttonWithTitle:@"财经资讯" target:self selector:@selector(Finance) frame:CGRectMake(self.view.frame.size.width *2/3, self.view.bounds.size.height - 320, self.view.frame.size.width/3, 90) image:[UIImage imageNamed:@"Finance"] darkTextColor:YES]];
    
    [self.view addSubview:[UIButton buttonWithTitle:@"时尚引领" target:self selector:@selector(Fashion) frame:CGRectMake(0, self.view.bounds.size.height - 230, self.view.frame.size.width/3, 90) image:[UIImage imageNamed:@"Fishion"] darkTextColor:YES]];
    
    [self.view addSubview:[UIButton buttonWithTitle:@"科技前沿" target:self selector:@selector(Science) frame:CGRectMake(self.view.frame.size.width/3, self.view.bounds.size.height - 230, self.view.frame.size.width/3, 90) image:[UIImage imageNamed:@"Science and technology"] darkTextColor:YES]];
    
    [self.view addSubview:[UIButton buttonWithTitle:@"体育赛事" target:self selector:@selector(     Physical) frame:CGRectMake(self.view.frame.size.width *2/3, self.view.bounds.size.height - 230, self.view.frame.size.width/3, 90) image:[UIImage imageNamed:@"Sports"] darkTextColor:YES]];
    
    [self.view addSubview:[UIButton buttonWithTitle:@"军事观察" target:self selector:@selector(     Military) frame:CGRectMake(0, self.view.bounds.size.height - 140, self.view.frame.size.width/3, 90) image:[UIImage imageNamed:@"Military"] darkTextColor:YES]];

    [self.view addSubview:[UIButton buttonWithTitle:@"历史积淀" target:self selector:@selector(     History) frame:CGRectMake(self.view.frame.size.width/3, self.view.bounds.size.height - 140, self.view.frame.size.width/3, 90) image:[UIImage imageNamed:@"History"] darkTextColor:YES]];
    
    [self.view addSubview:[UIButton buttonWithTitle:@"旅游在线" target:self selector:@selector(     OpenClass) frame:CGRectMake(self.view.frame.size.width *2/3, self.view.bounds.size.height - 140, self.view.frame.size.width/3, 90) image:[UIImage imageNamed:@"2015"] darkTextColor:YES]];
    
}

- (void)getTopNews
{
    NSString * urlStr = TN_Topics_Feature;
    NSURL * url = [NSURL URLWithString:urlStr];
    
    [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:url] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        if (connectionError != nil) {
            
            NSLog(@"%@", connectionError);
            
            return ;
            
        }
        
        NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
        NSArray * array = dict[@"headline_ad"];
        
        self.array = [[NSMutableArray alloc] initWithCapacity:10];
        
        
        for (NSDictionary * dict in array) {
            [self.array addObject:[[TopNewInfoModel alloc] initWithAttributes:dict]];
            
 
        }
        
        self.topNewsView.homeTopNews = self.array;
        
        [self.topNewsView startAnimation];
        
        
    }];
}


- (void)OpenClass
{
    NKOpenClassTableViewController * openClass = [[NKOpenClassTableViewController alloc] init];
    
    [self.navigationController pushViewController:openClass animated:YES];
}

- (void)History
{
    NKHistoryTableViewController * history = [[NKHistoryTableViewController alloc] init];
    
    [self.navigationController pushViewController:history animated:YES];
}

- (void)Military
{
    NKMilitaryTableViewController * military = [[NKMilitaryTableViewController alloc] init];
    
    [self.navigationController pushViewController:military animated:YES];
}

- (void)Physical
{
    NKPhysicalTableViewController * physical = [[NKPhysicalTableViewController alloc] init];

    [self.navigationController pushViewController:physical animated:YES];
}

- (void)Fashion
{
    NKFashionTableViewController * fashion = [[NKFashionTableViewController alloc] init];

    [self.navigationController pushViewController:fashion animated:YES];
}

- (void)Finance
{
    NKFinanceTableViewController * finance = [[NKFinanceTableViewController alloc] init];

    [self.navigationController pushViewController:finance animated:YES];
}

- (void)Science
{
    NKScienceTableViewController * science = [[NKScienceTableViewController alloc] init];

    [self.navigationController pushViewController:science animated:YES];
}

- (void)Recreation
{
    NKRecreationTableViewController * recreation = [[NKRecreationTableViewController alloc] init];

    [self.navigationController pushViewController:recreation animated:YES];
    
    NSLog(@"娱乐频道");
}

-(void)HotDay
{
    NKNewsDayTableViewController * newsDay = [[NKNewsDayTableViewController alloc] init];

    [self.navigationController pushViewController:newsDay animated:YES];
    NSLog(@"进入今日新闻");
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
-(void)pushController:(NSInteger)selectIndex
{
    TopNewsDetailController *detailsVC=[[TopNewsDetailController alloc]init];
    detailsVC.selectTitle = [(TopNewInfoModel *)self.array[selectIndex] title];
    detailsVC.detailUrl=[(TopNewInfoModel *)self.array[selectIndex] url];
    detailsVC.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
    [self presentViewController:detailsVC animated:YES completion:nil];
}




@end
