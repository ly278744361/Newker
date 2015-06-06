//
//  Techonlogy.h
//  Newker2.0
//
//  Created by lanou3g on 15/5/26.
//  Copyright (c) 2015年 谢腾飞. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Techonlogy : NSObject

@property (retain, nonatomic)NSString *adTitle;
@property (retain, nonatomic)NSString *digest;
@property (retain, nonatomic)NSString *docid;//参数
@property (retain, nonatomic)NSString *imgsrc;//图片资质
@property (retain, nonatomic)NSArray *imgextra;//图片数组
@property (retain, nonatomic)NSString *lmodify;
@property (assign, nonatomic)NSInteger priority;
@property (retain, nonatomic)NSString *ptime;
@property (assign, nonatomic)NSInteger replyCount;
@property (retain, nonatomic)NSString *source;
@property (retain, nonatomic)NSString *subtitle;
@property (retain, nonatomic)NSString *timeConsuming;
@property (retain, nonatomic)NSString *title;
@property (retain, nonatomic)NSString *url;
@property (retain, nonatomic)NSString *url_3w;
@property (retain, nonatomic)NSString *TAG;
@property (retain, nonatomic)NSString *TAGS;
@property (retain, nonatomic)NSString *skipID;
@property (retain, nonatomic)NSString *skipType;
@property (retain, nonatomic)NSString *specialID;
@property (retain, nonatomic)NSString *alias;
@property (retain, nonatomic)NSString *cid;
@property (retain, nonatomic)NSString *ename;
@property (retain, nonatomic)NSString *hasAD;
@property (retain, nonatomic)NSString *hasCover;
@property (retain, nonatomic)NSString *hasHead;
@property (retain, nonatomic)NSString *hasIcon;
@property (retain, nonatomic)NSString *hasImg;
@property (retain, nonatomic)NSString *photosetID;
@property (assign, nonatomic)NSInteger imgType;
@property (retain, nonatomic)NSString *videoID;

@end
