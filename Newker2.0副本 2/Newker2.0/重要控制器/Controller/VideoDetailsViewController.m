//
//  VideoDetailsViewController.m
//  Newker2.0
//
//  Created by lanou3g on 15/5/28.
//  Copyright (c) 2015年 谢腾飞. All rights reserved.
//

#import "VideoDetailsViewController.h"
#import "UIImageView+WebCache.h"
@interface VideoDetailsViewController ()

@end

@implementation VideoDetailsViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil

{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createView];
    [self setData:self.details];
}

- (void)createView
{
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    _scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 1800);
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, [UIScreen mainScreen].bounds.size.width-40, 30)];
    self.sourceLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 40, 120, 20)];
    _sourceLabel.font = [UIFont boldSystemFontOfSize:11.0f];
    _sourceLabel.alpha = 0.5;
    self.ptimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(140, 40, [UIScreen mainScreen].bounds.size.width-160, 20)];
    _ptimeLabel.font = [UIFont boldSystemFontOfSize:11.0f];
    _ptimeLabel.alpha = 0.5;
    
    self.contactLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, ([_details.video count]*300+60)+[_details.img count]*290+30, [UIScreen mainScreen].bounds.size.width-40, 1000)];
    
    for (int i = 0; i<[self.details.video count]; i++) {
        
        UIImageView *imageView= [[UIImageView alloc] initWithFrame:CGRectMake(20, i*300+60, [UIScreen mainScreen].bounds.size.width-40, 300)];
        imageView.userInteractionEnabled = YES;
        imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[[_details.video objectAtIndex:i]objectForKey:@"cover"]]]];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(imageView.frame.size.width/2-30, imageView.frame.size.height/2-30, 80, 60);
        [button setBackgroundImage:[UIImage imageNamed:@"bigvideo.png"] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(didClickWebView:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = 1990+i;
        [imageView addSubview:button];
        [_scrollView addSubview:imageView];
        
        
        UILabel *altLabel = [[UILabel alloc] initWithFrame:CGRectMake(imageView.frame.origin.x, imageView.frame.origin.y+imageView.frame.size.height, imageView.frame.size.width, 20)];
        altLabel.font = [UIFont systemFontOfSize:11.0f];
        altLabel.alpha = 0.5;
        altLabel.text = [[_details.video objectAtIndex:i] objectForKey:@"alt"];
        [_scrollView addSubview:altLabel];
        
    }
    for (int i = 0; i<[_details.img count]; i++) {
        
        UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(20,([_details.video count]*300+60)+i*290+30,[UIScreen mainScreen].bounds.size.width-40 , 280)];
        [image sd_setImageWithURL:[NSURL URLWithString:[[_details.img objectAtIndex:i] objectForKey:@"src"]]];
        [_scrollView addSubview:image];
       
    }
    
    [_scrollView addSubview:_titleLabel];
    [_scrollView addSubview:_sourceLabel];
    [_scrollView addSubview:_ptimeLabel];
    [_scrollView addSubview:_contactLabel];
    [self.view addSubview:_scrollView];

}

- (void)didClickWebView:(UIButton *)button
{
    NSString *string = [NSString stringWithFormat:@"%ld",(long)button.tag];
    NSString *indexString = [[string componentsSeparatedByString:@"99"] objectAtIndex:1];
    NSInteger index = [indexString integerValue];
    self.webView = [[UIWebView alloc] init];
    self.webView.delegate = self;
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[[self.details.video objectAtIndex:index] objectForKey:@"url_mp4"]]]];
    [self.view addSubview:_webView];
}

- (void)setData:(Details *)details
{
    self.titleLabel.text = details.title;
    self.sourceLabel.text = details.source;
    self.ptimeLabel.text = details.ptime;
    self.contactLabel.text = details.body;
    self.contactLabel.text = [_contactLabel.text stringByReplacingOccurrencesOfString:@"<p>" withString:@"\n"];
    self.contactLabel.text = [_contactLabel.text stringByReplacingOccurrencesOfString:@"</p>" withString:@" "];
    self.contactLabel.text = [_contactLabel.text stringByReplacingOccurrencesOfString:@"&gt;" withString:@" "];
    self.contactLabel.text = [_contactLabel.text stringByReplacingOccurrencesOfString:@"<b>" withString:@" "];
    self.contactLabel.text = [_contactLabel.text stringByReplacingOccurrencesOfString:@"</b>" withString:@" "];
    self.contactLabel.text = [_contactLabel.text stringByReplacingOccurrencesOfString:@"<strong>" withString:@" "];
    self.contactLabel.text = [_contactLabel.text stringByReplacingOccurrencesOfString:@"</strong>" withString:@"  "];
    
   
    for(int i = 0;i<[details.video count];i++){
        NSString *string = [NSString stringWithFormat:@"<!--VIDEO#%d-->",i];
        _contactLabel.text = [_contactLabel.text stringByReplacingOccurrencesOfString:string withString:@" "];
    }
    for (int i = 0; i<[details.img count]; i++) {
        NSString *number = [NSString stringWithFormat:@"<!--SPINFO#%d>",i];
        self.contactLabel.text = [_contactLabel.text stringByReplacingOccurrencesOfString:number withString:@" "];
    }
    
    NSLog(@"%@", self.contactLabel.text);
    for (int i = 0; i <[details.img count]; i++) {
        NSString *number = [NSString stringWithFormat:@"<!--IMG#%d-->",i];
        self.contactLabel.text = [_contactLabel.text stringByReplacingOccurrencesOfString:number withString:@" "];
    }
    for (int i= 0 ; i<[details.link count]; i++) {
        NSString *number = [NSString stringWithFormat:@"<!--link%d-->",i];
        self.contactLabel.text = [_contactLabel.text stringByReplacingOccurrencesOfString:number withString:@" "];
    }
    //自适应高度
    self.contactLabel.numberOfLines = 0;
    self.contactLabel.font = [UIFont systemFontOfSize:15.0f];
    self.contactLabel.lineBreakMode = NSLineBreakByWordWrapping;
    CGSize size = [self.contactLabel sizeThatFits:CGSizeMake(_contactLabel.frame.size.width, MAXFLOAT)];
    self.contactLabel.frame = CGRectMake(_contactLabel.frame.origin.x, _contactLabel.frame.origin.y, _contactLabel.frame.size.width, size.height);
    //自适应高频度
    self.scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, size.height+_contactLabel.frame.origin.y+140);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
