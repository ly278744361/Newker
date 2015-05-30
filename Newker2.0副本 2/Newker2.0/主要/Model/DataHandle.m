//
//  DataHandle.m
//  Newker2.0
//
//  Created by lanou3g on 15/5/28.
//  Copyright (c) 2015年 谢腾飞. All rights reserved.
//

#import "DataHandle.h"
#import <sqlite3.h>
#define DatabasePath @"News.sqlite"

static DataHandle * dataHandle = nil;

static sqlite3 * db = nil;

@implementation DataHandle

+(instancetype)sharedDataHandle
{
    @synchronized(self){
        if (dataHandle == nil) {
            dataHandle = [[DataHandle alloc]init];
        }}
    return dataHandle;
}


//打开数据库
-(void)openDB
{
    //判断数据库是否打开
    if (db != nil) {
        return;
    }
    //创建数据库
    NSString * dbpath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
    NSString * sqlpath = [dbpath stringByAppendingPathComponent:DatabasePath];
    //    NSLog(@"%@",sqlpath);
    //根据路径创建并打开数据库
    int result = sqlite3_open(sqlpath.UTF8String, &db);
    //判断数据库是否成功打开
    if (result == SQLITE_OK) {
        //准备创建表的语句
        NSString * creatTableSql = @"CREATE TABLE News (title TEXT, newsurl TEXT PRIMARY KEY , digest TEXT  , docid TEXT , count INTEGER)";
        //执行SQL语句
        char * error = nil;
        int  result1 = sqlite3_exec(db, creatTableSql.UTF8String, NULL , NULL, &error);
        if (result1 == SQLITE_OK) {
            NSLog(@"sucess");
        }
    }
    
}
//关闭数据库
-(void)closeDB
{
    int result = sqlite3_close(db);
    if (result == SQLITE_OK) {
        db = nil;
        //        NSLog(@"close success");
    }
}
//插入数据
-(void)insertIntoNews:(Collect *)collect
{
    //打开数据库
    [self openDB];
    NSString * insertsql = [NSString stringWithFormat:@"insert into News(title,newsurl,digest,docid,count) values('%@','%@','%@','%@','%ld')",collect.title,collect.newsurl,collect.digest,collect.docid,(long)collect.count];
    //NSLog(@"%@",insertsql);
    //执行SQL语句
    char * error = nil;
    int result = sqlite3_exec(db, insertsql.UTF8String, NULL, NULL, &error);
    if (result == SQLITE_OK) {
        //        NSLog(@"插入成功");
    }else
    {
        NSLog(@"插入失败");
    }
}
//根据newsurl删除收藏信息
-(void)deleteCollectWithnewsurl:(NSString *)newsurl
{
    [self openDB];
    NSString * deleteSql = [NSString stringWithFormat:@"delete from News where newsurl = '%@'",newsurl];
    char * error = nil;
    int result = sqlite3_exec(db, deleteSql.UTF8String, NULL, NULL, &error);
    if (result == SQLITE_OK) {
        NSLog(@"delete success");
    }else{
        NSLog(@"删除失败");
    }
    [self closeDB];
}
//判断是否收藏
-(BOOL)isFavourited:(NSString *)newsurl
{
    Collect * collect = [self queryNewsWithnewsurl:newsurl];
    if (collect.newsurl == nil) {
        return NO;
    }
    return YES;
}
//根据newsurl查询收藏信息
-(Collect *)queryNewsWithnewsurl:(NSString *)newsurl
{
    [self openDB];
    NSString * selectSql = @"select * from News where newsurl = ?";
    //创建一个跟随指针
    sqlite3_stmt * stmt = nil;
    //执行SQL语句
    int result = sqlite3_prepare_v2(db, selectSql.UTF8String, -1, &stmt, NULL);
    //判断结果
    if (result == SQLITE_OK) {
        //绑定'?'的值
        sqlite3_bind_text(stmt, 1, [newsurl UTF8String], -1, NULL);
        //获取对象
        Collect * collect = [[Collect alloc]init];
        if (sqlite3_step(stmt) == SQLITE_ROW) {
            //获取字段中的值
            NSString * title = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 0)];
            NSString * newsurl = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 1)];
            NSString * digest = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 2)];
            NSString * docid = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 3)];
            
            collect.title = title;
            collect.digest = digest;
            collect.newsurl = newsurl;
            collect.docid = docid;
            
        }
        //结束跟随指针
        sqlite3_finalize(stmt);
        [self closeDB];
        return collect;
    }
    sqlite3_finalize(stmt);
    [self closeDB];
    return nil;
    
}
//获取数据库中所有信息
-(NSArray *)queryAllCollect
{
    //打开数据库
    [self openDB];
    NSString * selectSql = [NSString stringWithFormat:@"select * from News"];
    sqlite3_stmt * stmt = nil;
    int result = sqlite3_prepare_v2(db, selectSql.UTF8String, -1, &stmt, NULL);
    NSMutableArray * collectArray = [NSMutableArray array];
    if (result == SQLITE_OK) {
        while (sqlite3_step(stmt)== SQLITE_ROW) {
            NSString * title = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 0)];
            NSString * newsurl = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 1)];
            NSString * digest = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 2)];
            NSString * docid = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 3)];
            NSInteger count = sqlite3_column_int(stmt, 4);
            Collect * collect = [[Collect alloc]init];
            collect.count = count;
            collect.title = title;
            collect.newsurl = newsurl;
            collect.digest = digest;
            collect.docid = docid;
            [collectArray addObject:collect];
        }
        sqlite3_finalize(stmt);
        [self closeDB];
        return  collectArray;
    }else{
        sqlite3_finalize(stmt);
        [self closeDB];
        NSLog(@"查询失败");
        return nil;
    }
    
}


@end
