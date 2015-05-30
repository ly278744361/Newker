//
//  BigPictureTableViewCell.m
//  Newker2.0
//
//  Created by lanou3g on 15/5/28.
//  Copyright (c) 2015年 谢腾飞. All rights reserved.
//

#import "BigPictureTableViewCell.h"
#import "UIImageView+WebCache.h"

@implementation BigPictureTableViewCell

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
    self.lineLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 159.5, [UIScreen mainScreen].bounds.size.width, 0.5)];
    _lineLabel.backgroundColor = [UIColor grayColor];
    //创建视图布局大小
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, [UIScreen mainScreen].bounds.size.width - 40, 30)];
    _titleLabel.font = [UIFont boldSystemFontOfSize:12.f];
    self.image = [[UIImageView alloc] initWithFrame:CGRectMake(10, 30, [UIScreen mainScreen].bounds.size.width - 20, 105)];
    self.detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 137, [UIScreen mainScreen].bounds.size.width - 20, 20)];
    _detailLabel.font = [UIFont boldSystemFontOfSize:11.f];
    _detailLabel.alpha = 0.5;
    _detailLabel.numberOfLines = 0;
    self.replyCountLabel = [[UILabel alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 100, 137, 90, 20)];
    _replyCountLabel.font = _detailLabel.font;
    _replyCountLabel.alpha = 0.5;
    _replyCountLabel.textAlignment = 2;
    //添加到Cell上
    [self.contentView addSubview:_titleLabel];
    [self.contentView addSubview:_image];
    [self.contentView addSubview:_detailLabel];
    [self.contentView addSubview:_replyCountLabel];
    [self.contentView addSubview:_lineLabel];

}

- (void)setTechonlogy:(Techonlogy *)techonlogy
{
    self.titleLabel.text = techonlogy.title;
    self.detailLabel.text = techonlogy.digest;
    self.replyCountLabel.text = [[NSString stringWithFormat:@"%ld",(long)techonlogy.replyCount] stringByAppendingString:@"人关注"];
    [self.image sd_setImageWithURL:[NSURL URLWithString:techonlogy.imgsrc] placeholderImage:[UIImage imageNamed:@"  "]];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
