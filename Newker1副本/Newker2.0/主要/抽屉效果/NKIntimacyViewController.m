//
//  NKIntimacyViewController.m
//  Newker2.0
//
//  Created by lanou3g on 15/6/3.
//  Copyright (c) 2015年 谢腾飞. All rights reserved.
//

#import "NKIntimacyViewController.h"

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

@interface NKIntimacyViewController ()

@property (nonatomic,retain)UIImageView *imageView;
@property (nonatomic,retain)UILabel *nameLable;
@property (nonatomic,retain)UILabel *versionLable;
@property (nonatomic,retain)UILabel *introLable;

@end

@implementation NKIntimacyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UINavigationBar * navigationBar=[[UINavigationBar alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44+20)];
    
    [self.view addSubview:navigationBar];
    
    
    [self layoutBarButton];
    [self layoutImageView];
    [self layoutNameLable];
    [self layoutVersionLable];
    [self layoutIntroLable];
    
}

-(void)layoutImageView{
    
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2 - 60, SCREEN_HEIGHT * 0.18, 120, 120)];
    _imageView.image = [UIImage imageNamed:@"tubiao"];
    [self.view addSubview:_imageView];
    
    
}

-(void)layoutNameLable{
    
    self.nameLable = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2 - 50 , SCREEN_HEIGHT * 0.18 + 140, 100, 30)];
    _nameLable.text = @"Newker";
    _nameLable.textAlignment = NSTextAlignmentCenter;
    _nameLable.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:_nameLable];
    
}

-(void)layoutVersionLable{
    
    self.versionLable = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2 - 65, SCREEN_HEIGHT * 0.18 + 170, 130, 20)];
    _versionLable.font = [UIFont systemFontOfSize:13];
    _versionLable.text = @"Newker_version1.0";
    _versionLable.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_versionLable];
    
}

-(void)layoutIntroLable{
    
    self.introLable = [[UILabel alloc] initWithFrame:CGRectMake(20, SCREEN_HEIGHT * 0.16 + 220, SCREEN_WIDTH - 40, 220)];
    _introLable.text = @"       本app所有内容,包括⽂字、图⽚、视频、以及版式设计等均在网上有所搜集。访问者可将本app提供的内容或服务用于个人学习、研究或欣赏,以及其他非商业性或非盈利性⽤途,但同时应遵守著作权法及其他相关法律的规定,不得侵犯本app及相关权利⼈的合法权利。除此以外,将本app任何内容或服务用于其他⽤途时,须征得本app及相关权利人的书⾯许可,并⽀付报酬。本app所涉及内容的原作者如不愿意在本app刊登内容,请及时通知本app,予以删除。本App保留最终解释权！！";
    _introLable.numberOfLines = 0;
    _introLable.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:_introLable];
    
}


-(void)layoutBarButton{
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeSystem];
    
    button.frame=CGRectMake(10, 30, 30, 30);
    [button setBackgroundImage:[UIImage imageNamed:@"fanhui_normal 2.png"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftItem=[[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.leftBarButtonItem=leftItem;
    [self.view addSubview:button];
    
    
}

-(void)dismiss
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
