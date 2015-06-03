//
//  NKPeelingViewController.m
//  Newker2.0
//
//  Created by lanou3g on 15/6/2.
//  Copyright (c) 2015年 谢腾飞. All rights reserved.
//

#import "NKPeelingViewController.h"
#import "UIBarButtonItem+Extension.h"

#define bgBlue [UIColor colorWithRed:0.406 green:0.798 blue:1.000 alpha:0.8];
#define bgPink [UIColor colorWithRed:0.960 green:0.496 blue:0.524 alpha:0.5];
#define bgBlack [UIColor colorWithWhite:0.145 alpha:0.5];
#define bgYellow [UIColor colorWithRed:1.000 green:0.973 blue:0.366 alpha:1.000];

//  屏幕高度
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
//  屏幕宽度
#define ScreenWidth [UIScreen mainScreen].bounds.size.width

@interface NKPeelingViewController ()

@end

static NSInteger count = 1;

@implementation NKPeelingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"一键换肤";
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(cancelBtn:) image:@"readercell_share_normal" highImage:@"readercell_share_highlight"];

    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(50, 80, ScreenHeight/2+50, 50)];
    label.numberOfLines = 0;
    label.text = @"";
    label.textColor = [UIColor grayColor];
    [self.view addSubview:label];
    
    
    UIButton * btu = [UIButton buttonWithType:UIButtonTypeCustom];
    self.blueBtn = btu;
    btu.frame = CGRectMake(10, 150, ScreenWidth/2 - 10, 100);
    btu.backgroundColor = bgBlack;
    [btu addTarget:self action:@selector(changedBlueColor:) forControlEvents:UIControlEventTouchCancel];
    [self.view addSubview:btu];
    
    UILabel * defaultLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, 75, ScreenWidth/10, 20)];
    defaultLabel.text = @"(默认)";
    defaultLabel.font = [UIFont systemFontOfSize:12];
    [btu addSubview:defaultLabel];
    
    //添加粉色颜色块，点击可以更改导航条颜色
    UIButton * pinkBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.pinkBtn = pinkBtn;
    pinkBtn.frame = CGRectMake(ScreenWidth/2+10, 150, ScreenWidth/2-20, 100);
    pinkBtn.backgroundColor = bgPink;
    [pinkBtn addTarget:self action:@selector(changedPinkColor:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pinkBtn];
    
    //添加黄色颜色块，点击可以更改导航条颜色
    UIButton * yellowkBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.yellowBtn = yellowkBtn;
    yellowkBtn.frame = CGRectMake(10, 270, ScreenWidth/2-10, 100);
    yellowkBtn.backgroundColor = bgYellow;
    [yellowkBtn addTarget:self action:@selector(changedyellowColor:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:yellowkBtn];
    
    //添加黑色颜色块，点击可以更改导航条颜色
    UIButton * blackBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.blackBtn = blackBtn;
    blackBtn.frame = CGRectMake(ScreenWidth/2+10, 270, ScreenWidth/2-20, 100);
    blackBtn.backgroundColor = bgBlack;
    [blackBtn addTarget:self action:@selector(changedblackColor:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:blackBtn];
    
}

- (void)cancelBtn:(UIBarButtonItem *)cancel
{
    [UIView transitionWithView:self.view duration:2 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
        [self dismissViewControllerAnimated:YES completion:nil];
        
    } completion:^(BOOL finished) {
        
    }];
}

//蓝色
- (void)changedBlueColor:(UIButton *)blueColor
{
    if (count == 1) {
        count ++;
        //添加对勾
        UIImageView * imgView = [[UIImageView alloc]initWithFrame:CGRectMake(60, 50, ScreenWidth/9, 20)];
        self.imgView = imgView;
        imgView.image = [UIImage imageNamed:@"对勾"];
        [_blueBtn addSubview:imgView];
        
        //改变导航条的颜色为选中的颜色
        [UINavigationBar appearance].barTintColor = bgBlue;
        
        
    }else
    {
        [self.imgView removeFromSuperview];
        count = 1;
    }
    
}

//粉色
- (void)changedPinkColor:(UIButton *)pinkColor
{
    if (count == 1) {
        count ++;
        //添加对勾
        UIImageView * imgView = [[UIImageView alloc]initWithFrame:CGRectMake(60, 50, ScreenWidth/9, 20)];
        self.imgView = imgView;
        imgView.image = [UIImage imageNamed:@"对勾"];
        [_pinkBtn addSubview:imgView];
        
        [UINavigationBar appearance].barTintColor = bgPink;
    }else{
        [self.imgView removeFromSuperview];
        count = 1;
    }
    
}

//黄色
- (void)changedyellowColor:(UIButton *)blueColor
{
    if (count == 1) {
        count ++;
        //添加对勾
        UIImageView * imgView = [[UIImageView alloc]initWithFrame:CGRectMake(60, 50, ScreenWidth/9, 20)];
        self.imgView = imgView;
        imgView.image = [UIImage imageNamed:@"对勾"];
        [_yellowBtn addSubview:imgView];
        
        //改变导航条的颜色为选中的颜色
        [UINavigationBar appearance].barTintColor = bgYellow;
        
    }else
    {
        [self.imgView removeFromSuperview];
        count = 1;
    }
    
}

//黑色
- (void)changedblackColor:(UIButton *)blueColor
{
    if (count == 1) {
        count ++;
        //添加对勾
        UIImageView * imgView = [[UIImageView alloc]initWithFrame:CGRectMake(60, 50, ScreenWidth/9, 20)];
        self.imgView = imgView;
        imgView.image = [UIImage imageNamed:@"对勾"];
        [_blackBtn addSubview:imgView];
        
        //改变导航条的颜色为选中的颜色
        [UINavigationBar appearance].barTintColor = bgBlack;
        
    }else
    {
        [self.imgView removeFromSuperview];
        count = 1;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
