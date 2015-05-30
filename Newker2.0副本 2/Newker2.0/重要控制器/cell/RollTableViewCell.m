//
//  RollTableViewCell.m
//  Newker2.0
//
//  Created by lanou3g on 15/5/28.
//  Copyright (c) 2015年 谢腾飞. All rights reserved.
//

#import "RollTableViewCell.h"
#import "UIImageView+WebCache.h"
@implementation RollTableViewCell

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
    self.lineLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 229.5, [UIScreen mainScreen].bounds.size.width, 0.5)];
    _lineLabel.backgroundColor = [UIColor grayColor];
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 230)];
    _scrollView.contentSize = CGSizeMake(2*[UIScreen mainScreen].bounds.size.width, 200);
    _scrollView.pagingEnabled = YES;
    _scrollView.showsHorizontalScrollIndicator = FALSE;
    self.image1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200)];
    self.image2 = [[UIImageView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width, 0, [UIScreen mainScreen].bounds.size.width, 200)];
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 205, [UIScreen mainScreen].bounds.size.width - 40, 25)];
    _titleLabel.font = [UIFont systemFontOfSize:16.f];
    [_scrollView addSubview:_image1];
    [_scrollView addSubview:_image2];
    [_scrollView addSubview:_titleLabel];
    [_scrollView addSubview:_lineLabel];
    [self.contentView addSubview:_scrollView];
}

- (void)setTechonlogy:(Techonlogy *)techonlogy
{
    self.titleLabel.text = techonlogy.title;
    [self.image1 sd_setImageWithURL:[NSURL URLWithString:techonlogy.imgsrc] placeholderImage:[UIImage imageNamed:@"   "]];
    [self.image2 sd_setImageWithURL:[NSURL URLWithString:techonlogy.imgsrc] placeholderImage:[UIImage imageNamed:@"   "]];
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
