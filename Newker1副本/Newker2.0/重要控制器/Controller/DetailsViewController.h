//
//  DetailsViewController.h
//  Newker2.0
//
//  Created by lanou3g on 15/5/28.
//  Copyright (c) 2015年 谢腾飞. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Collect.h"
#import "Details.h"
@interface DetailsViewController : UIViewController

@property (nonatomic , strong) UILabel * titleLabel;
@property (nonatomic , strong) UILabel * sourceLabel;
@property (nonatomic , strong) UILabel * ptimeLabel;
@property (nonatomic , strong) UIImageView * headerImage;
@property (nonatomic , strong) UILabel * contactLabel;
@property (nonatomic , strong) UIScrollView * scrollView;
@property (nonatomic , strong) UILabel * altLabel;
@property (nonatomic , strong) NSString * stringurl;
@property (nonatomic , strong) NSString * docid;
@property (nonatomic , strong) NSString * digest;

@end
