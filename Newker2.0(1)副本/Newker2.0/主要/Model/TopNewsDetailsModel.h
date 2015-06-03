//
//  TopNewsDetailsModel.h
//  Newker2.0
//
//  Created by lanou3g on 15/6/2.
//  Copyright (c) 2015年 谢腾飞. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TopNewsDetailsModel : NSObject

@property(nonatomic,strong,readwrite)NSString * note;//详情
@property(nonatomic,strong,readwrite)NSString * imgurl;
@property(nonatomic,strong,readwrite)NSString * timgurl;
@property(nonatomic,strong,readwrite)NSString * squareimgurl;

-(id)initWithAttributes:(NSDictionary *)attributes;

@end
