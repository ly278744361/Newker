//
//  TopNewsView.m
//  Newker2.0
//
//  Created by lanou3g on 15/6/2.
//  Copyright (c) 2015年 谢腾飞. All rights reserved.
//

#import "TopNewInfoModel.h"
#import "TopNewsView.h"
#import "UIButton+AFNetworking.h"
#import "NKHomeViewController.h"
#define Tn_ColorRGBValue(rgbValue) [UIColor colorWithRed:(float)((rgbValue & 0xFF0000) >> 16)/255.0 green:(float)((rgbValue & 0xFF00) >> 8)/255.0 blue:(float)((rgbValue & 0xFF))/255.0 alpha:1.0]
#define TN_TOPNEWSWIDTH [[UIScreen mainScreen] bounds].size.width    //屏宽
#define TN_TOPNEWSHEIGHT [[UIScreen mainScreen] bounds].size.height

#define TN_SCREENWIDTH [UIScreen mainScreen].bounds.size.width //屏宽
#define TN_SCREENHEIGHT [UIScreen mainScreen].bounds.size.height
@interface TopNewsView ()
@property(nonatomic,strong)UILabel *titleLabel;
@end


@implementation TopNewsView


-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        
//        self.backgroundColor = [UIColor blackColor];
//        self.backgroundColor = Tn_ColorRGBValue(0xf6f6f6);
        [self addScrollView];
        [self addHorizontalScrollIndicator];
    }
    return self;
}

#pragma mark  设置子视图
-(void)addScrollView
{
    
//    self.topNewScrollView.backgroundColor = [UIColor redColor];
    
    self.topNewScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0.0, 0 , TN_TOPNEWSWIDTH, self.bounds.size.height)];
    
//    self.topNewScrollView.backgroundColor = [UIColor redColor];
//    self.topNewScrollView.backgroundColor=[UIColor clearColor];
    
    self.topNewScrollView.bounces=NO;
    
    self.topNewScrollView.showsHorizontalScrollIndicator = NO;
    
    self.topNewScrollView.pagingEnabled=YES;
    
    self.topNewScrollView.delegate=self;
    
    [self addSubview:self.topNewScrollView];
    
}

-(void)addHorizontalScrollIndicator

{
    
//    self.pageControl.backgroundColor = [UIColor blackColor];
    self.pageControl=[[UIPageControl alloc]initWithFrame:CGRectMake(self.bounds.size.width - (TN_TOPNEWSWIDTH / 3) + 10, self.bounds.size.height-12,TN_TOPNEWSWIDTH/3,6)];
    self.pageControl.backgroundColor=[UIColor clearColor];
    self.pageControl.pageIndicatorTintColor=[UIColor whiteColor];
    self.pageControl.currentPageIndicatorTintColor=[UIColor blackColor];
    
    
    self.pageControl.currentPage=0;
    
}
-(void)setHomeTopNews:(NSArray *)homeTopNews
{
    if (_homeTopNews==homeTopNews) {
        return;
    }
    _homeTopNews=homeTopNews;
    
    self.pageControl.numberOfPages=_homeTopNews.count;
    
    for (UIView *view in self.topNewScrollView.subviews) {
        [view removeFromSuperview];
    }
    
    self.previousTouchPoint =self.frame.size.width/_homeTopNews.count;
    
    for (int i=0; i<_homeTopNews.count; i++) {
        TopNewInfoModel *Tn_homeModel=_homeTopNews[i];
        UIButton * topNewImageButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
//        topNewImageButton.backgroundColor = [UIColor greenColor];
        
        topNewImageButton.tag = 1000+i;
        topNewImageButton.frame  =CGRectMake(self.frame.size.width*i, 0.0, self.bounds.size.width, self.bounds.size.height);
        
        
        [topNewImageButton setBackgroundImageForState:UIControlStateNormal withURL:[NSURL URLWithString:Tn_homeModel.imgsrc] placeholderImage:[UIImage imageNamed:@"Topic_Top_News"]];
        
        [topNewImageButton addTarget:self action:@selector(jump:) forControlEvents:UIControlEventTouchDown];
        
        [self.topNewScrollView addSubview:topNewImageButton];
        
        _titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(10, self.bounds.size.height - 40, topNewImageButton.frame.size.width, 60)];
        _titleLabel.backgroundColor=[UIColor clearColor];
        _titleLabel.textColor=[UIColor whiteColor];
        _titleLabel.font=[UIFont boldSystemFontOfSize:14];
        _titleLabel.numberOfLines=0;
        _titleLabel.text = Tn_homeModel.title;
        
        [topNewImageButton addSubview:_titleLabel];
        [self addSubview:self.pageControl];
    }
    self.topNewScrollView.contentSize = CGSizeMake(_homeTopNews.count * self.topNewScrollView.frame.size.width, 0);
    
}

#pragma mark 轮播方法
- (void)cycleScroll
{
    self.currentPage++;
    
    if (self.currentPage == 4)
    {
        self.currentPage = 0;
    }
    self.topNewScrollView.contentOffset = CGPointMake(self.topNewScrollView.frame.size.width * (self.currentPage % _homeTopNews.count) , 0);
}

- (void)startAnimation{
    
    [self stopAnimation];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(cycleScroll) userInfo:nil repeats:YES];
    
    
}

- (void)stopAnimation{
    
    if (self.timer && [self.timer isValid]) {
        [self.timer invalidate];
    }
}


#pragma mark UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
    [self startAnimation];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //在某些场景下，需要使用__block 来修饰局部变量
    
    [self startAnimation];
    [UIView animateWithDuration:1 animations:^{
        self.pageControl.currentPage=scrollView.contentOffset.x/320;
        
        
        
    }];
}

-(void)jump:(UIButton *)button
{
    [self.delegate  pushController:button.tag-1000];
}
@end