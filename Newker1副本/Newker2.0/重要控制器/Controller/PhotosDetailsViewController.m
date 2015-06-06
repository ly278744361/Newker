//
//  PhotosDetailsViewController.m
//  Newker2.0
//
//  Created by lanou3g on 15/5/28.
//  Copyright (c) 2015年 谢腾飞. All rights reserved.
//

#import "PhotosDetailsViewController.h"
#import "UIImageView+WebCache.h"
#import "DataHandle.h"
#import "WebViewController.h"

@interface PhotosDetailsViewController ()

@property(nonatomic , strong)UIActivityIndicatorView * quanquan;
@property (nonatomic , strong)Details *details;

@end

@implementation PhotosDetailsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createView];
    [self json];
    [self setData:self.details];

}

-(void)json
{
    __block NSURL *url = [NSURL URLWithString:self.stringurl];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0f];
    NSURLResponse  *response= nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    if (data == nil) {
        return;
    }
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    self.details = [[Details alloc] init];
    [self.details setValuesForKeysWithDictionary:[dic objectForKey:self.docid]];
    [self.quanquan stopAnimating];
    
}

- (void)dismissAlterView:(UIAlertView *)alterView
{
    [alterView dismissWithClickedButtonIndex:0 animated:YES];
}

- (void)createView
{
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height)];
    _scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 1600);
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 15,[UIScreen mainScreen].bounds.size.width-40, 30)];
    self.sourceLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 40, 80, 20)];
    _sourceLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    _sourceLabel.alpha = 0.5;
    self.ptimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 40, 130, 20)];
    _ptimeLabel.font = [UIFont boldSystemFontOfSize:12.f];
    _ptimeLabel.alpha = 0.5;
    
    self.contactLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 400,[UIScreen mainScreen].bounds.size.width-20, 570)];
    NSLog(@"Photos");
    
    [_scrollView addSubview:_titleLabel];
    [_scrollView addSubview:_sourceLabel];
    [_scrollView addSubview:_ptimeLabel];
    [_scrollView addSubview:_image1];
    [_scrollView addSubview:_image2];
    [_scrollView addSubview:_image3];
    [_scrollView addSubview:_contactLabel];
    [self.view addSubview:_scrollView];
    
}

- (void)setData:(Details *)details
{
    self.titleLabel.text = details.title;
    self.sourceLabel.text = details.source;
    self.ptimeLabel.text = details.ptime;
    self.contactLabel.text = [details.body stringByReplacingOccurrencesOfString:@"<p>" withString:@"\n\n"];
    self.contactLabel.text = [_contactLabel.text stringByReplacingOccurrencesOfString:@"</p>" withString:@""];
    self.contactLabel.text = [_contactLabel.text stringByReplacingOccurrencesOfString:@"<b>" withString:@""];
    self.contactLabel.text = [_contactLabel.text stringByReplacingOccurrencesOfString:@"</b>" withString:@""];
    self.contactLabel.text = [_contactLabel.text stringByReplacingOccurrencesOfString:@"&gt;" withString:@""];
    _contactLabel.text = [_contactLabel.text stringByReplacingOccurrencesOfString:@"<strong>" withString:@""];
    _contactLabel.text = [_contactLabel.text stringByReplacingOccurrencesOfString:@"</strong>" withString:@""];
    for (int i = 0; i<[details.img count]; i++) {
        NSString *number = [NSString stringWithFormat:@"<!--SPINFO#%d>",i];
        self.contactLabel.text = [_contactLabel.text stringByReplacingOccurrencesOfString:number withString:@""];
    }
    for (int i= 0 ; i<[details.link count]; i++) {
        NSString *number = [NSString stringWithFormat:@"<!--link%d-->",i];
        self.contactLabel.text = [_contactLabel.text stringByReplacingOccurrencesOfString:number withString:@""];
    }
    for (int i = 0; i <[details.video count]; i++) {
        NSString *number = [NSString stringWithFormat:@"<!--VIDEO#%d-->",i];
        self.contactLabel.text = [_contactLabel.text stringByReplacingOccurrencesOfString:number withString:@""];
    }
    for (int i = 0; i<[_details.img count]; i++) {
        NSString *number = [NSString stringWithFormat:@"<!--IMG#%d-->",i];
        UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(10, i*200+60,[UIScreen mainScreen].bounds.size.width - 20 , 190)];
        [image sd_setImageWithURL:[NSURL URLWithString:[[_details.img objectAtIndex:i] objectForKey:@"src"]]];
        [_scrollView addSubview:image];
        image.userInteractionEnabled = YES;
        _contactLabel.text = [_contactLabel.text stringByReplacingOccurrencesOfString:number withString:@""];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0, 0, image.frame.size.width, image.frame.size.height);
        button.tag = 17800+i;
        [button addTarget:self action:@selector(didClickWebView:) forControlEvents:UIControlEventTouchUpInside];
        [image addSubview:button];
        
    }
    
    //Label的自适应高度
    _contactLabel.numberOfLines = 0;
    _contactLabel.font = [UIFont systemFontOfSize:15.0f];
    _contactLabel.lineBreakMode = NSLineBreakByWordWrapping;
    CGSize size = [_contactLabel sizeThatFits:CGSizeMake(_contactLabel.frame.size.width, MAXFLOAT)];
    _contactLabel.frame = CGRectMake(_contactLabel.frame.origin.x,[_details.img count]*200 + 40, _contactLabel.frame.size.width, size.height );
    //ScrollView的自适应高度
    self.scrollView.contentSize = CGSizeMake(_scrollView.frame.size.width, size.height +_contactLabel.frame.origin.y+100);

}

- (void)didClickWebView:(UIButton *)button
{
    
    NSString *string = [NSString stringWithFormat:@"%ld",(long)button.tag];
    NSArray *array = [string componentsSeparatedByString:@"78"];
    NSString *index = [array objectAtIndex:1];
    NSInteger i = [index integerValue];
    WebViewController *webVC = [[WebViewController alloc]init];
    NSInteger width = [[[[[self.details.img objectAtIndex:i] objectForKey:@"pixel"] componentsSeparatedByString:@"*"] objectAtIndex:0] integerValue];
    NSInteger height = [[[[[self.details.img objectAtIndex:i] objectForKey:@"pixel"] componentsSeparatedByString:@"*"] objectAtIndex:1] integerValue];
    if (width>=[UIScreen mainScreen].bounds.size.width&&height>=[UIScreen mainScreen].bounds.size.height) {
        UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(0,64,[UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height)];
        [imageview sd_setImageWithURL:[NSURL URLWithString:[[self.details.img objectAtIndex:i] objectForKey:@"src"]]];
        [webVC.view addSubview:imageview];
        [self.navigationController pushViewController:webVC animated:YES];
        
        
    }else if (width>=[UIScreen mainScreen].bounds.size.width&&height<=[UIScreen mainScreen].bounds.size.height){
        UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(0,([UIScreen mainScreen].bounds.size.height-height)/2,[UIScreen mainScreen].bounds.size.width, height)];
        [imageview sd_setImageWithURL:[NSURL URLWithString:[[self.details.img objectAtIndex:i] objectForKey:@"src"]]];
        
        [webVC.view addSubview:imageview];
        [self.navigationController pushViewController:webVC animated:YES];
        self.tabBarController.hidesBottomBarWhenPushed = YES;
        
    }else if (width<=[UIScreen mainScreen].bounds.size.width&&height>=[UIScreen mainScreen].bounds.size.height){
        UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width-width)/2,64,width, [UIScreen mainScreen].bounds.size.height)];
        [imageview sd_setImageWithURL:[NSURL URLWithString:[[self.details.img objectAtIndex:i] objectForKey:@"src"]]];
        [webVC.view addSubview:imageview];
        [self.navigationController pushViewController:webVC animated:YES];
        
    }else{
        
        UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0,width, height)];
        imageview.center = webVC.view.center;
        [imageview sd_setImageWithURL:[NSURL URLWithString:[[self.details.img objectAtIndex:i] objectForKey:@"src"]]];
        [webVC.view addSubview:imageview];
        [self.navigationController pushViewController:webVC animated:YES];
        
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
