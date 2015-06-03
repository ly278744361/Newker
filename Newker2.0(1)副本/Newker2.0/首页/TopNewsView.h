//
//  TopNewsView.h
//  Newker2.0
//
//  Created by lanou3g on 15/6/2.
//  Copyright (c) 2015年 谢腾飞. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TopNewsView;

@protocol pushDelegate <NSObject>

-(void)pushController:(NSInteger)selectIndex;

@end

@interface TopNewsView : UIView<UIScrollViewDelegate>

@property(nonatomic, strong)       UIScrollView * topNewScrollView;
@property(nonatomic, strong)       UIPageControl * pageControl;
@property(nonatomic, readwrite)    CGFloat previousTouchPoint;
@property(nonatomic, strong)       NSTimer *timer;
@property(nonatomic, readwrite)    NSInteger currentPage;


@property(nonatomic,strong)NSArray * homeTopNews;

@property(nonatomic,assign)id<pushDelegate>delegate;

- (void)startAnimation;

- (void)stopAnimation;


@end