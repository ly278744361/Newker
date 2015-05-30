//
//  RollPhotosViewController.h
//  Newker2.0
//
//  Created by lanou3g on 15/5/28.
//  Copyright (c) 2015年 谢腾飞. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotosModle.h"

@interface RollPhotosViewController : UIViewController<UIScrollViewDelegate>

@property (nonatomic , strong) UIScrollView * scrollView;
@property (nonatomic , strong) UILabel * descLabel;
@property (nonatomic , strong) UILabel * imgsumLabel;
@property (nonatomic , strong) UILabel * setnameLabel;
@property (nonatomic , strong) PhotosModle * photosModle;

@end
