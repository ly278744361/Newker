//
//  Details.h
//  Newker2.0
//
//  Created by lanou3g on 15/5/28.
//  Copyright (c) 2015年 谢腾飞. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Details : NSObject

@property (retain ,nonatomic)NSString *body;
@property (retain ,nonatomic)NSString *docid;
@property (assign ,nonatomic)BOOL hasNext;
@property (retain ,nonatomic)NSArray *img;
@property (retain ,nonatomic)NSString *pixel;
@property (retain ,nonatomic)NSString *ref;
@property (retain ,nonatomic)NSString *src;
@property (retain ,nonatomic)NSString *alt;
@property (retain ,nonatomic)NSString *photosetID;
@property (assign ,nonatomic)BOOL *picnews;
@property (retain ,nonatomic)NSString *ptime;
@property (retain ,nonatomic)NSString *replyBoard;
@property (assign ,nonatomic)NSString *replyCount;
@property (retain ,nonatomic)NSString *source;
@property (retain ,nonatomic)NSString *tid;
@property (retain ,nonatomic)NSString *title;
@property (retain ,nonatomic)NSString *alias;
@property (retain ,nonatomic)NSString *ename;
@property (retain ,nonatomic)NSString *eubnum;
@property (retain ,nonatomic)NSString *tname;
@property (retain ,nonatomic)NSString *voicecomment;
@property(nonatomic,retain)NSString * stringurl;//详情页面的网址
@property (retain, nonatomic)NSArray *link;
@property (retain, nonatomic)NSArray *video;

@property(nonatomic,retain)NSString * imgextra;
@property(nonatomic,retain)NSString * skipType;

@end
