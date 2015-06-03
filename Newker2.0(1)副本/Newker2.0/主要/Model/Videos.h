//
//  Videos.h
//  Newker2.0
//
//  Created by lanou3g on 15/5/28.
//  Copyright (c) 2015年 谢腾飞. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Videos : NSObject

@property (nonatomic , strong) NSString * cover;
@property (nonatomic , strong) NSString * m3u8_url;
@property (nonatomic , strong) NSArray * recommend;
@property (nonatomic , strong) NSString * title;
@property (nonatomic , strong) NSString * videoid;
@property (nonatomic , strong) NSString * length;

@end
