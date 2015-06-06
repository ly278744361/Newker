//
//  FontHandle.m
//  Newker2.0
//
//  Created by lanou3g on 15/6/3.
//  Copyright (c) 2015年 谢腾飞. All rights reserved.
//

#import "FontHandle.h"

@implementation FontHandle

static FontHandle *fontHandle = nil;
+(FontHandle *)shareHandle{
    
    @synchronized(self){
        if (fontHandle == nil) {
            fontHandle = [[FontHandle alloc] init];
            
        }
        
    }
    return  fontHandle;
}


@end
