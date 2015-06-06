//
//  MyScrollView.m
//  Newker2.0
//
//  Created by lanou3g on 15/6/2.
//  Copyright (c) 2015年 谢腾飞. All rights reserved.
//

#import "MyScrollView.h"

@implementation MyScrollView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
 */- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        //设置图片缩放比例
        self.minimumZoomScale=0.5;
        self.maximumZoomScale=2;
        //self.delegate=self;
    }
    return self;
}

//用方法来设定每个ScrollView所带图片的坐标点
-(instancetype)initWithFrame:(CGRect)frame image:(UIImage *)image
{
    if (self=[self initWithFrame:frame]) {
        self.imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 200)];
        
        self.imageView.backgroundColor = [UIColor redColor];
        self.imageView.image=image;
        [self addSubview:self.imageView];
    }
    return self;
}


//缩放方法，放回每个ScrollView所带的图片
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}

-(void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    
    //当缩放比率小于1的时候，让ScrollView携带的图片居中显示
    if (scrollView.zoomScale<=1) {
        _imageView.center=CGPointMake(scrollView.bounds.size.width/2, self.frame.origin.y/2);
    }
    if (scrollView.zoomScale>1) {
        _imageView.center=CGPointMake(scrollView.bounds.size.width/2, scrollView.frame.origin.y/2);
        //
    }
    
}


@end
