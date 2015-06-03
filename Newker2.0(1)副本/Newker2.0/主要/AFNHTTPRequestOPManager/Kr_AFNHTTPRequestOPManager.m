//
//  Kr_AFNHTTPRequestOPManager.m
//  Kr_Demo
//
//  Created by admin on 15/2/3.
//  Copyright (c) 2015年 ssl. All rights reserved.
//

#import "Kr_AFNHTTPRequestOPManager.h"
#import "NSString+ConciseKit.h"
#import "JSONKit.h"
#define TN_Topics_Feature @"http://c.m.163.com/nc/ad/headline/0-4.html"
//轮播图点击详情接口
#define TN_Topics_Details @"http://c.m.163.com"
@implementation Kr_AFNHTTPRequestOPManager
+ (instancetype)shareManager
{
    static Kr_AFNHTTPRequestOPManager *_shareManager = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        _shareManager = [[Kr_AFNHTTPRequestOPManager alloc]initWithBaseURL:[NSURL URLWithString:TN_Topics_Details]];
        //给请求队列管理器，配置反悔数据的接收格式（数据类型）
        _shareManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/json", @"application/json", @"text/html", @"text/css", nil];
    });
    return _shareManager;
}

+ (void)getWithSubUrl:(NSString *)subUrl parameters:(NSDictionary *)parameters responseBlock:(void (^)(id, NSError *))block
{
    [[[self class] shareManager] GET:[TN_Topics_Details $append:subUrl] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (responseObject != nil) {
            block(responseObject,nil);
        } else {
            
            //将获取的数据转换成字符串
            NSString *resultString = [[NSString alloc]initWithData:operation.responseData encoding:NSUTF8StringEncoding];
            //将字符串解析成json对象
            
           
            NSObject *resultObj = [resultString objectFromJSONString];
            //数据回调
            block(resultObj, nil);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //failure 方法里面的operation.responseData有可能含有我们想要的正确的数据
        block(nil, error);
    }];
}
@end
