//
//  DataHandle.h
//  Newker2.0
//
//  Created by lanou3g on 15/5/28.
//  Copyright (c) 2015年 谢腾飞. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Collect.h"

@interface DataHandle : NSObject

+ (instancetype)sharedDataHandle;

@property (nonatomic , strong) NSString * headurlstring;
@property (nonatomic , strong) NSString * headskipID;
//打开数据库
-(void)openDB;
//关闭数据库
-(void)closeDB;
//插入数据
-(void)insertIntoNews:(Collect *)collect;
//根据imgsrc删除收藏信息
-(void)deleteCollectWithnewsurl:(NSString *)newsurl;
//判断是否收藏
-(BOOL)isFavourited:(NSString *)newsurl;
//根据imgsrc查询收藏信息
-(Collect *)queryNewsWithnewsurl:(NSString *)newsurl;
//获取数据库中所有信息
-(NSArray *)queryAllCollect;

@end
