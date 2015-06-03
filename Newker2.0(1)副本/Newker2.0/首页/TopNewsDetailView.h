//
//  TopNewsDetailView.h
//  Newker2.0
//
//  Created by lanou3g on 15/6/2.
//  Copyright (c) 2015年 谢腾飞. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopNewsDetailView : UIView<UIScrollViewDelegate,UITextViewDelegate>


@property(nonatomic, strong)UIScrollView * TopNewsDetailScrollView;
@property(nonatomic, strong)UILabel      * titleLabel;//标题
@property(nonatomic, strong)UIImageView  * topNewsImage;//图片
@property(nonatomic,strong)NSArray       * topNewsDailsArray;

@property(nonatomic,strong)UITextView    * textView;
@end
