//
//  ImageDownloader.m
//  Newker2.0
//
//  Created by lanou3g on 15/5/25.
//  Copyright (c) 2015年 谢腾飞. All rights reserved.
//

#import "ImageDownloader.h"

@implementation ImageDownloader

+ (instancetype)imageDownloaderWIthURL:(NSString *)urlStr andDelegate:(id<ImageDownloaderDelegate>)delegate
{
    ImageDownloader *dowloader = [[ImageDownloader alloc] init];
    dowloader.delegate = delegate;
    dowloader.urlStr = urlStr;
    [dowloader startDownload];
    return dowloader;
}

- (instancetype)initWithURL:(NSString *)urlStr andDelegate:(id<ImageDownloaderDelegate>)delegate
{
    self = [super init];
    if (self) {
        self.delegate = delegate;
        self.urlStr = urlStr;
    }
    return self;
}
- (void)startDownload
{
    NSURL *url = [NSURL URLWithString:self.urlStr];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        UIImage *img = [[UIImage alloc] initWithData:data];
        if (_delegate != nil && [_delegate respondsToSelector:@selector(imageDownloader:didFinshLoading:)]) {
            [_delegate imageDownloader:self didFinshLoading:img];
            
            NSLog(@"运行到了ImageDownloader");
        }else{
            NSLog(@"====运行到了ImageDownloader");
        }
    }];
}


@end
