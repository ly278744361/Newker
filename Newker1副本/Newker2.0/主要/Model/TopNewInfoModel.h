//
//  TopNewInfoModel.h
//  Newker2.0
//
//  Created by lanou3g on 15/6/2.
//  Copyright (c) 2015年 谢腾飞. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TopNewInfoModel : NSObject
@property(nonatomic,strong,readonly)NSString *title;//标题
@property(nonatomic,strong,readonly)NSString *subtitle;//子标题
@property(nonatomic,strong,readonly)NSString *tag;//标示
@property(nonatomic,strong,readonly)NSString *url;
@property(nonatomic,strong,readonly)NSString *imgsrc;//新闻图片地址

- (instancetype)initWithAttributes:(NSDictionary *)attributes;
@end
