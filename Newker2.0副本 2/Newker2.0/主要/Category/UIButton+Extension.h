//
//  UIButton+Extension.h
//  Newker2.0
//
//  Created by lanou3g on 15/5/26.
//  Copyright (c) 2015年 谢腾飞. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Extension)

+ (UIButton *)buttonWithTitle:        (NSString *)title
                       target:(id)target
                     selector:(SEL)selector
                        frame:(CGRect)frame
                        image:(UIImage *)image
                darkTextColor:(BOOL)darkTextColor;

@end
