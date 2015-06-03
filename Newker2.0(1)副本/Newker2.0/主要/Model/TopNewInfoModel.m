//
//  TopNewInfoModel.m
//  Newker2.0
//
//  Created by lanou3g on 15/6/2.
//  Copyright (c) 2015年 谢腾飞. All rights reserved.
//

#import "TopNewInfoModel.h"

@interface TopNewInfoModel ()
@property(nonatomic,strong,readwrite)NSString *title;//标题
@property(nonatomic,strong,readwrite)NSString *subtitle;//子标题
@property(nonatomic,strong,readwrite)NSString *tag;//标示
@property(nonatomic,strong,readwrite)NSString *url;
@property(nonatomic,strong,readwrite)NSString *imgsrc;//新闻图片地址

@end
@implementation TopNewInfoModel

-(id)initWithAttributes:(NSDictionary *)attributes
{
    self=[super init];
    if (self && attributes) {
        self.title = attributes[@"title"];
        self.subtitle = attributes[@"subtitle"];
        self.tag = attributes[@"tag"];
        self.url = attributes[@"url"];
        self.imgsrc = attributes[@"imgsrc"];
    }
    return self;
}
@end
