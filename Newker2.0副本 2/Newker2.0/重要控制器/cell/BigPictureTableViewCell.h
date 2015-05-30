//
//  BigPictureTableViewCell.h
//  Newker2.0
//
//  Created by lanou3g on 15/5/28.
//  Copyright (c) 2015年 谢腾飞. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Techonlogy.h"
@interface BigPictureTableViewCell : UITableViewCell

@property (nonatomic , strong) UIImageView * image;
@property (nonatomic , strong) UILabel * titleLabel;
@property (nonatomic , strong) UILabel * replyCountLabel;
@property (nonatomic , strong) UILabel * detailLabel;
@property (nonatomic , strong) Techonlogy * techonlogy;
@property (nonatomic , strong) UILabel * lineLabel;

@end
