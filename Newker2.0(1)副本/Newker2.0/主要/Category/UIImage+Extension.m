//
//  UIImage+Extension.m
//  Newker2.0
//
//  Created by lanou3g on 15/5/26.
//  Copyright (c) 2015年 谢腾飞. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)
- (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)newsize
{
    UIGraphicsBeginImageContext(newsize);
    [img drawInRect:CGRectMake(0, 0, newsize.width, newsize.height)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}


@end
