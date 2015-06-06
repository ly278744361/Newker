//
//  Kr_AFNHTTPRequestOPManager.h
//  Kr_Demo
//
//  Created by admin on 15/2/3.
//  Copyright (c) 2015年 ssl. All rights reserved.
//

#import "AFHTTPRequestOperationManager.h"

@interface Kr_AFNHTTPRequestOPManager : AFHTTPRequestOperationManager
+ (instancetype)shareManager;
/**
 *  get请求，获取网络数据
 *
 *  @param subUrl     接口地址
 *  @param parameters 参数集
 *  @param block      请求返回数据的回调block
 */
+ (void)getWithSubUrl:(NSString *)subUrl parameters:(NSDictionary *)parameters responseBlock:(void (^)(id result, NSError *error))block;

/**
 *  post请求，获取网络数据
 *
 *  @param subUrl     接口地址
 *  @param parameters 参数集
 *  @param block      请求返回数据的回调block
 */
@end
