//
//  CommonTableViewCell.h
//  Newker2.0
//
//  Created by lanou3g on 15/5/28.
//  Copyright (c) 2015年 谢腾飞. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Techonlogy.h"
#import "Docs.h"
#import "Videos.h"

@interface CommonTableViewCell : UITableViewCell

@property (nonatomic , strong) UIImageView * headerImage;
@property (nonatomic , strong) UILabel * titleLabel;
@property (nonatomic , strong) UILabel * detalLabel;
@property (nonatomic , strong) UILabel * replyLabel;
@property (nonatomic , strong) UILabel * lineLabel;
@property (nonatomic , strong) UILabel * label;
@property (nonatomic , strong) Techonlogy * techonlogy;
@property (nonatomic , strong) Docs * docss;
@property (nonatomic , strong) UIImageView * imageview;
@property (nonatomic , strong) Videos * videos;

@end
