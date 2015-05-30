//
//  CommonTableViewCell.m
//  Newker2.0
//
//  Created by lanou3g on 15/5/28.
//  Copyright (c) 2015年 谢腾飞. All rights reserved.
//

#import "CommonTableViewCell.h"
#import "UIImageView+WebCache.h"

@implementation CommonTableViewCell

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
    self.lineLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 69.5, [UIScreen mainScreen].bounds.size.width, 0.5)];
    _lineLabel.backgroundColor = [UIColor grayColor];
    //创建视图布局大小
    self.headerImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 5, 85, 60)];
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(105, 7, [UIScreen mainScreen].bounds.size.width - 90, 20)];
    _titleLabel.font = [UIFont boldSystemFontOfSize:15.f];
    
    self.detalLabel = [[UILabel alloc] initWithFrame:CGRectMake(105, 32, [UIScreen mainScreen].bounds.size.width - 115, 50)];
    _detalLabel.font = [UIFont boldSystemFontOfSize:11.f];
    _detalLabel.alpha = 0.5;
    _detalLabel.numberOfLines=0;
    
    self.replyLabel = [[UILabel alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 90, 50, 80, 10)];
    _replyLabel.font = _detalLabel.font;
    _replyLabel.alpha = 0.5;
    _replyLabel.textAlignment = 2;
    //添加到Cell
    [self.contentView addSubview:_headerImage];
    [self.contentView addSubview:_titleLabel];
    [self.contentView addSubview:_detalLabel];
    [self.contentView addSubview:_replyLabel];
    [self.contentView addSubview:_lineLabel];

}

- (void)setTechonlogy:(Techonlogy *)techonlogy
{
    self.titleLabel.text = techonlogy.title;
    _titleLabel.font = [UIFont systemFontOfSize:15.0f];
    self.detalLabel.text = techonlogy.digest;
    _detalLabel.font = [UIFont systemFontOfSize:11.f];
    _detalLabel.alpha = 0.5;
    _detalLabel.numberOfLines=2;
    CGSize size = [_detalLabel sizeThatFits:CGSizeMake(_detalLabel.frame.size.width, MAXFLOAT)];
    _detalLabel.frame = CGRectMake(_detalLabel.frame.origin.x, _detalLabel.frame.origin.y, _detalLabel.frame.size.width, size.height);
    self.replyLabel.text = [[NSString stringWithFormat:@"%ld",(long)techonlogy.replyCount] stringByAppendingString:@"人关注"];
    //    [self.headerImage sd_setImageWithURL:[NSURL URLWithString:techonlogy.imgsrc]];
    [self.headerImage sd_setImageWithURL:[NSURL URLWithString:techonlogy.imgsrc] placeholderImage:[UIImage imageNamed:@"  "]];
    if ([techonlogy.TAG isEqualToString:@"视频"]&&techonlogy.TAG!=nil)
    {
        if(_imageview.superview==nil)
        {
            self.imageview = [[UIImageView alloc] initWithFrame:CGRectMake(5, 35, 20, 20)];
            _imageview.image = [UIImage imageNamed:@"   "];
            [_headerImage addSubview:_imageview];
            
        }else if (_imageview.superview)
        {
            [_imageview removeFromSuperview];
        }
        
        NSLog(@"%@,%@",techonlogy.TAG,techonlogy.title);
        
    }else if([techonlogy.skipType isEqualToString:@"special"])
    {
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
        if(_label.superview){
            [_label removeFromSuperview];
            
        }else if (_label.superview==nil){
            _label.text = @"专题";
            _label.font = [UIFont boldSystemFontOfSize:12.0];
            _label.textColor = [UIColor blackColor];
            [_headerImage addSubview:_label];
        }
        
    }

}

- (void)setVideos:(Videos *)videos
{
    self.titleLabel.text = videos.title;
    self.detalLabel.text = videos.length;
    [self.headerImage sd_setImageWithURL:[NSURL URLWithString:videos.cover] placeholderImage:[UIImage imageNamed:@" "]];
}

- (void)setDocss:(Docs *)docss
{
    self.titleLabel.text = docss.title;
    self.detalLabel.text = docss.digset;
    NSLog(@"%@",docss.digset);
    _detalLabel.font = [UIFont boldSystemFontOfSize:11.f];
    _detalLabel.alpha = 0.5;
    _detalLabel.numberOfLines=2;
    CGSize size = [_detalLabel sizeThatFits:CGSizeMake(_detalLabel.frame.size.width, MAXFLOAT)];
    _detalLabel.frame = CGRectMake(_detalLabel.frame.origin.x, _detalLabel.frame.origin.y, _detalLabel.frame.size.width, size.height);
    self.replyLabel.text = [[NSString stringWithFormat:@"%ld",(long)docss.replyCount] stringByAppendingString:@"人关注"];
    [self.headerImage sd_setImageWithURL:[NSURL URLWithString:docss.imgsrc] placeholderImage:[UIImage imageNamed:@"   "]];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
