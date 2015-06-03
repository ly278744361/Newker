//
//  UIBarButtonItem+Extension.h
//  Newker
//
//  Created by lanou3g on 15/5/21.
//  Copyright (c) 2015年 谢腾飞. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage;

@end
