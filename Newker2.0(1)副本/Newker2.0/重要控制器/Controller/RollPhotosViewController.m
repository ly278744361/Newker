//
//  RollPhotosViewController.m
//  Newker2.0
//
//  Created by lanou3g on 15/5/28.
//  Copyright (c) 2015年 谢腾飞. All rights reserved.
//

#import "RollPhotosViewController.h"
#import "UIImageView+WebCache.h"

@interface RollPhotosViewController ()

@end

@implementation RollPhotosViewController

-(void)viewWillAppear:(BOOL)animated
{
    self.view.backgroundColor = [UIColor blackColor];
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self){
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createView];
    [self setData:self.photosModle];
    
}

- (void)createView
{
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.width /5, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width *7/8)];
    _scrollView.contentSize = CGSizeMake([self.photosModle.photos count]*[UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width /5);
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    
    //标题
    self.setnameLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, [UIScreen mainScreen].bounds.size.width * 43/40 + 5, [UIScreen mainScreen].bounds.size.width-40, 30)];
    _setnameLabel.textColor = [UIColor whiteColor];
    self.imgsumLabel = [[UILabel alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width-25, [UIScreen mainScreen].bounds.size.width * 43/40 + 5, 55, 30)];
    _setnameLabel.textAlignment = NSTextAlignmentLeft;
    self.imgsumLabel = [[UILabel alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 2, [UIScreen mainScreen].bounds.size.height / 7, 35, 30)];
    
    self.imgsumLabel.center = CGPointMake(self.view.bounds.size.width * 0.5, 100);
    
    NSLog(@"%f", self.imgsumLabel.center.x);
    
    _imgsumLabel.textColor = [UIColor whiteColor];
    _imgsumLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    
    //内容
    self.descLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, [UIScreen mainScreen].bounds.size.width * 43/40 + 40, [UIScreen mainScreen].bounds.size.width - 40, [UIScreen mainScreen].bounds.size.width * 17/40 - 40)];
    _imgsumLabel.textAlignment = NSTextAlignmentRight;
    self.descLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, [UIScreen mainScreen].bounds.size.height-150, [UIScreen mainScreen].bounds.size.width - 20, 60)];
    _descLabel.textColor = [UIColor whiteColor];
    _descLabel.alpha = 0.5;

    for (int i = 0; i<[self.photosModle.photos count]; i++) {
        
        UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(i*[UIScreen mainScreen].bounds.size.width, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width *7/8)];
        [image sd_setImageWithURL:[NSURL URLWithString:[[_photosModle.photos objectAtIndex:i] objectForKey:@"imgurl"]] placeholderImage:[UIImage imageNamed:@"     "]];
        
        [_scrollView addSubview:image];
        NSLog(@"RollPhoto");
       
    }
    [self.view addSubview:_scrollView];
    [self.view addSubview:_imgsumLabel];
    [self.view addSubview:_descLabel];
    [self.view addSubview:_setnameLabel];
}

- (void)setData:(PhotosModle *)photosModle
{
    self.setnameLabel.text = photosModle.setname;
    self.imgsumLabel.text = photosModle.imgsum;
    NSString * string = [NSString stringWithFormat:@"%.0f/",_scrollView.contentOffset.x/[UIScreen mainScreen].bounds.size.width + 1.0];
    _imgsumLabel.text = [string stringByAppendingString:_imgsumLabel.text];
    self.descLabel.text = [@"   "stringByAppendingString:[[_photosModle.photos objectAtIndex:_scrollView.contentOffset.x/[UIScreen mainScreen].bounds.size.width] objectForKey:@"note"]];
    
    _descLabel.numberOfLines = 0;
    _descLabel.font = [UIFont systemFontOfSize:14.0f];
    CGSize size = [_descLabel sizeThatFits:CGSizeMake(_descLabel.frame.size.width, MAXFLOAT)];
    _descLabel.frame = CGRectMake(10, [UIScreen mainScreen].bounds.size.width * 43/40 + 40, _descLabel.frame.size.width, size.height);
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self setData:self.photosModle];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
}


@end
