//
//  ImageDownloader.h
//  Newker2.0
//
//  Created by lanou3g on 15/5/25.
//  Copyright (c) 2015年 谢腾飞. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIImage+Extension.h"
@class ImageDownloader;

@protocol ImageDownloaderDelegate <NSObject>

- (void)imageDownloader:(ImageDownloader *)imageDownload didFinshLoading:(UIImage *)img;

@end

@interface ImageDownloader : NSObject

@property(nonatomic,copy)NSString *urlStr;
@property(nonatomic,assign)id<ImageDownloaderDelegate> delegate;

+ (instancetype)imageDownloaderWIthURL:(NSString *)urlStr andDelegate:(id<ImageDownloaderDelegate>)delegate;
- (void)startDownload;


@end
