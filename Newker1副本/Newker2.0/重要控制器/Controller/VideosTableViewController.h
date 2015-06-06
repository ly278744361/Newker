//
//  VideosTableViewController.h
//  Newker2.0
//
//  Created by lanou3g on 15/5/28.
//  Copyright (c) 2015年 谢腾飞. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Videos.h"
@interface VideosTableViewController : UITableViewController

@property (nonatomic , strong) Videos * videos;
@property (nonatomic , strong) NSString * photosetID;
@property (nonatomic , strong) NSString * imgextra;

@end
