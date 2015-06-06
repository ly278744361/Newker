//
//  UIButton+Extension.m
//  Newker2.0
//
//  Created by lanou3g on 15/5/26.
//  Copyright (c) 2015年 谢腾飞. All rights reserved.
//

#import "UIButton+Extension.h"

@implementation UIButton (Extension)

+ (UIButton *)buttonWithTitle:        (NSString *)title
                       target:(id)target
                     selector:(SEL)selector
                        frame:(CGRect)frame
                        image:(UIImage *)image
                darkTextColor:(BOOL)darkTextColor
{
    UIButton *button = [[UIButton alloc] initWithFrame:frame];
    
    UIImageView * buttonImageView = [[UIImageView alloc] initWithFrame:CGRectMake(40, -button.titleLabel.bounds.size.width + 20, 30, 30)];
    
    buttonImageView.image = image;
    
    [button addSubview:buttonImageView];
    
    [button.layer setMasksToBounds:YES];

    [button.layer setBorderWidth:1.0];
    
    [button.layer setBorderColor:[[UIColor grayColor] CGColor]];
    
    button.titleEdgeInsets = UIEdgeInsetsMake(40, -button.titleLabel.bounds.size.width, 0, 0);
    
    button.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    
    [button setTitle:title forState:UIControlStateNormal];
    
    if (darkTextColor)
    {
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    else
    {
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

@end
