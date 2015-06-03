//
//  RollTableViewCell.h
//  Newker2.0
//
//  Created by lanou3g on 15/5/28.
//  Copyright (c) 2015年 谢腾飞. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Techonlogy.h"
#import "Docs.h"

@interface RollTableViewCell : UITableViewCell

@property (nonatomic , strong) UIScrollView * scrollView;
@property (nonatomic , strong) UIImageView * image1;
@property (nonatomic , strong) UIImageView * image2;
@property (nonatomic , strong) UIButton * btn1;

@property (nonatomic, strong) UIButton * btn2;


@property (nonatomic , strong) UILabel * titleLabel;
@property (nonatomic , strong) Techonlogy * techonlogy;
@property (nonatomic , strong) UILabel * lineLabel;
@property (nonatomic , strong) Docs * docss;

@end
