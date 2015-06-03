//
//  TopNewsDetailView.m
//  Newker2.0
//
//  Created by lanou3g on 15/6/2.
//  Copyright (c) 2015年 谢腾飞. All rights reserved.
//

#import "TopNewsDetailView.h"
#import "NKHomeViewController.h"
#import "UIImageView+AFNetworking.h"
#import "TopNewsDetailsModel.h"
#import "MyScrollView.h"
#define TN_Topics_Feature @"http://c.m.163.com/nc/ad/headline/0-4.html"
//轮播图点击详情接口
#define TN_Topics_Details @"http://c.m.163.com"

#define ScreenHeight [UIScreen mainScreen].bounds.size.height
//  屏幕宽度
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define TN_TOPNEWSWIDTH [[UIScreen mainScreen] bounds].size.width    //屏宽
#define TN_TOPNEWSHEIGHT [[UIScreen mainScreen] bounds].size.height
#define TN_SCREENWIDTH [UIScreen mainScreen].bounds.size.width //屏宽
#define TN_SCREENHEIGHT [UIScreen mainScreen].bounds.size.height
@interface TopNewsDetailView ()

@property (assign, nonatomic)NSInteger currentPage;
@property (assign, nonatomic)NSUInteger sumPage;
@property (nonatomic,strong)UILabel * numberLabel;
@property (nonatomic,strong)UIButton *aButton;
@property(nonatomic,strong)UIButton *bButton;

@end
@implementation TopNewsDetailView


-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        self.currentPage=0;
        self.sumPage = 0;
        
        self.backgroundColor=[UIColor whiteColor];
        
        self.TopNewsDetailScrollView =[[UIScrollView alloc]initWithFrame:CGRectMake(0, TN_SCREENHEIGHT/4, TN_TOPNEWSWIDTH,self.frame.size.height/3)];
        self.TopNewsDetailScrollView.pagingEnabled = YES;
        self.TopNewsDetailScrollView.delegate = self;
        [self addSubview:self.TopNewsDetailScrollView];
        [self addLabel];
        
        
        
    }
    return self;
}
#pragma mark   设置子视图



-(void)addLabel
{
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, TN_TOPNEWSHEIGHT/2+80, 250, 40)];
    [self.titleLabel setTextColor:[UIColor whiteColor]];
    self.titleLabel.font=[UIFont systemFontOfSize:15];
    [self addSubview:_titleLabel];
    [self bringSubviewToFront:_titleLabel];
}

-(void)setTopNewsDailsArray:(NSArray *)topNewsDailsArray
{
    if (self.topNewsDailsArray==topNewsDailsArray) {
        return;
    }
    _topNewsDailsArray=topNewsDailsArray;
    
    self.sumPage = topNewsDailsArray.count;
    
    for (UIView *view in self.TopNewsDetailScrollView.subviews) {
        [view removeFromSuperview];
    }
    
    for (int i=0; i<self.topNewsDailsArray.count; i++) {
        TopNewsDetailsModel * detailsModel=self.topNewsDailsArray[i];
        self.topNewsImage=[[UIImageView alloc]initWithFrame:CGRectMake(TN_SCREENWIDTH*i,0,  TN_TOPNEWSWIDTH,self.frame.size.height/3)];
        [self.topNewsImage setImageWithURL:[NSURL URLWithString:detailsModel.imgurl] placeholderImage:[UIImage imageNamed:@"Topic_Top_News"]];
        
        [self.TopNewsDetailScrollView addSubview:self.topNewsImage];
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapPicAction)];
        [self.TopNewsDetailScrollView addGestureRecognizer:tapGesture];
        self.TopNewsDetailScrollView.contentSize=CGSizeMake(self.topNewsDailsArray.count*TN_SCREENWIDTH, self.frame.size.height/3);
        
        
        self.textView=[[UITextView alloc]initWithFrame:CGRectMake(0, TN_SCREENHEIGHT/2+130, TN_TOPNEWSWIDTH, 60)];
        
        self.textView.editable = NO;
        
        self.textView.font=[UIFont systemFontOfSize:15];
        
        
        self.textView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        
        self.textView.contentSize = CGSizeMake(TN_TOPNEWSWIDTH*self.topNewsDailsArray.count, 50);
        
        self.textView.backgroundColor=[UIColor clearColor];
        self.textView.textColor=[UIColor whiteColor];
        
        [self addSubview:self.textView];
        
        self.numberLabel=[[UILabel alloc]initWithFrame:CGRectMake(TN_SCREENWIDTH-50, TN_SCREENHEIGHT/2+80, 60, 40)];
        self.numberLabel.textColor=[UIColor whiteColor];
        
        [self addSubview:self.numberLabel];
        
    }
    
    
    self.numberLabel.text=[NSString stringWithFormat:@"%ld/%lu",(long)self.currentPage+1,(unsigned long)self.sumPage] ;
    self.textView.text = [self.topNewsDailsArray[self.currentPage] note];
    
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat offsetX = self.TopNewsDetailScrollView.contentOffset.x;
    self.currentPage = offsetX/TN_TOPNEWSWIDTH;
    
    self.textView.text = [self.topNewsDailsArray[self.currentPage] note];
    self.numberLabel.text=[NSString stringWithFormat:@"%ld/%lu",self.currentPage+1,(unsigned long)self.sumPage] ;
}

- (void)tapPicAction
{
    
    BOOL currentState = [UIApplication sharedApplication].statusBarHidden;
    [[UIApplication sharedApplication] setStatusBarHidden:!currentState withAnimation:UIStatusBarAnimationFade];
    [self.titleLabel setHidden:!currentState];
    [self.textView   setHidden:!currentState];
    [self.numberLabel setHidden:!currentState];
    [self.aButton setHidden:!currentState];
    [self.bButton setHidden:!currentState];
    UIButton *backButton = (UIButton *)[self viewWithTag:1000];
    backButton.hidden = !backButton.hidden;
    
    UIImageView * backImage=(UIImageView *)[self viewWithTag:1001];
    backImage.hidden=!backImage.hidden;
    
}

@end
