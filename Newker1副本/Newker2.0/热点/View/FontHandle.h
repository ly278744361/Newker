//
//  FontHandle.h
//  Newker2.0
//
//  Created by lanou3g on 15/6/3.
//  Copyright (c) 2015年 谢腾飞. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FontHandle : NSObject

+(FontHandle *)shareHandle;

//夜间模式
@property (nonatomic)BOOL isNight;
@property (nonatomic)BOOL isYes;

//wifi网络
@property (nonatomic)BOOL isWifi;
@property (nonatomic)BOOL isOne;

@property (nonatomic,assign)NSInteger fontValue;



@end
