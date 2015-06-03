//
//  MyScrollView.h
//  Newker2.0
//
//  Created by lanou3g on 15/6/2.
//  Copyright (c) 2015年 谢腾飞. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyScrollView : UIScrollView<UIScrollViewDelegate>

@property (strong, nonatomic) UIImageView *imageView;
-(instancetype)initWithFrame:(CGRect)frame image:(UIImage *)image;
@end
