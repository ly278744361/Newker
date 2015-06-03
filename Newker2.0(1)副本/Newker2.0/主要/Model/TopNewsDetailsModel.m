//
//  TopNewsDetailsModel.m
//  Newker2.0
//
//  Created by lanou3g on 15/6/2.
//  Copyright (c) 2015年 谢腾飞. All rights reserved.
//

#import "TopNewsDetailsModel.h"

@implementation TopNewsDetailsModel

-(id)initWithAttributes:(NSDictionary *)attributes
{
    self=[super init];
    if (self && attributes) {
        self.note=attributes[@"note"];
        self.timgurl=attributes[@"timgurl"];
        self.squareimgurl=attributes[@"squareimgurl"];
        self.imgurl=attributes[@"imgurl"];
    }
    return self;
}
@end
