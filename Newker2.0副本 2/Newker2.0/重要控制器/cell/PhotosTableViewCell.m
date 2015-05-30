//
//  PhotosTableViewCell.m
//  Newker2.0
//
//  Created by lanou3g on 15/5/28.
//  Copyright (c) 2015年 谢腾飞. All rights reserved.
//

#import "PhotosTableViewCell.h"
#import "UIImageView+WebCache.h"
#define Length ([UIScreen mainScreen].bounds.size.width - 40)

@implementation PhotosTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self createView];
    }
    return self;
}

- (void)createView
{
    
    self.lineLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 109.5, [UIScreen mainScreen].bounds.size.width, 0.5)];
    _lineLabel.backgroundColor = [UIColor grayColor];
    //创建视图布局大小
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, [UIScreen mainScreen].bounds.size.width - 100, 30)];
    _titleLabel.font = [UIFont systemFontOfSize:12.f];
    self.replyLabel = [[UILabel alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 90, 0, 80, 30)];
    _replyLabel.font = [UIFont boldSystemFontOfSize:11.f];
    _replyLabel.alpha = 0.5;
    _replyLabel.textAlignment = 2;
    
    self.image1 = [[UIImageView alloc] initWithFrame:CGRectMake(10, 30, Length/3, 75)];
    self.image2 = [[UIImageView alloc] initWithFrame:CGRectMake(Length/3 + 20, 30, Length/3, 75)];
    self.image3 = [[UIImageView alloc] initWithFrame:CGRectMake(Length*2/3 + 30, 30, Length/3, 75)];
    
    //添加到Cell上
    [self.contentView addSubview:_titleLabel];
    [self.contentView addSubview:_replyLabel];
    [self.contentView addSubview:_image1];
    [self.contentView addSubview:_image2];
    [self.contentView addSubview:_image3];
    [self.contentView addSubview:_lineLabel];
    
}

- (void)setTechonlogy:(Techonlogy *)techonlogy
{
    self.titleLabel.text = techonlogy.title;
    self.replyLabel.text = [[NSString stringWithFormat:@"%ld",(long)techonlogy.replyCount] stringByAppendingString:@"人关注"];
    [self.image1 sd_setImageWithURL:[NSURL URLWithString:techonlogy.imgsrc] placeholderImage:[UIImage imageNamed:@" "]];
    [self.image2 sd_setImageWithURL:[NSURL URLWithString:[[techonlogy.imgextra objectAtIndex:0] objectForKey:@"imgsrc"]] placeholderImage:[UIImage imageNamed:@" "]];
    [self.image3 sd_setImageWithURL:[NSURL URLWithString:[[techonlogy.imgextra objectAtIndex:1] objectForKey:@"imgsrc"]] placeholderImage:[UIImage imageNamed:@" "]];
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

@end
