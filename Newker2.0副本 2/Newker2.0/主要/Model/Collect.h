//
//  Collect.h
//  Newker2.0
//
//  Created by lanou3g on 15/5/28.
//  Copyright (c) 2015年 谢腾飞. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Collect : NSObject

@property (nonatomic , strong) NSString * newsurl;
@property (nonatomic , strong) NSString * digest;
@property (nonatomic , strong) NSString * title;
@property (nonatomic , strong) NSString * docid;
@property (nonatomic , assign) NSInteger count;

@end
