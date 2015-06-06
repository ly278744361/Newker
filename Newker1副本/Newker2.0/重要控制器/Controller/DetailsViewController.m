//
//  DetailsViewController.m
//  Newker2.0
//
//  Created by lanou3g on 15/5/28.
//  Copyright (c) 2015年 谢腾飞. All rights reserved.
//

#import "DetailsViewController.h"
#import "UIImageView+WebCache.h"
#import "DataHandle.h"
#import "WebViewController.h"

@interface DetailsViewController ()
@property (nonatomic , strong) UIActivityIndicatorView * quanquan;
@property (nonatomic , strong) Details * details;

@end

@implementation DetailsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)dismissAlterView:(UIAlertView *)alterView
{
    [alterView dismissWithClickedButtonIndex:0 animated:YES];
}

-(void)json
{
    __block NSURL * url = [NSURL URLWithString:self.stringurl];
    NSURLRequest * request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0f];
    NSURLResponse * response= nil;
    NSData * data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    if (data == nil) {
        return;
    }
    NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
   
    self.details = [[Details alloc] init];
    [self.details setValuesForKeysWithDictionary:[dic objectForKey:self.docid]];
        NSLog(@"%@",self.details.src);
    
    [self.quanquan stopAnimating];
    
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self creatquanquan];
    [self json];
    [self createView];
    [self setDetails];
    
}

- (void)createView
{
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, [UIScreen mainScreen].bounds.size.width - 20, 30)];
    _titleLabel.font = [UIFont boldSystemFontOfSize:20.0f];
    
    self.sourceLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 40, 100, 20)];
    _sourceLabel.font = [UIFont boldSystemFontOfSize:12.f];
    _sourceLabel.alpha = 0.5;
    
    self.ptimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 40, [UIScreen mainScreen].bounds.size.width - 125, 20)];
    _ptimeLabel.font = [UIFont boldSystemFontOfSize:12.f];
    _ptimeLabel.alpha = 0.5;
    
    self.altLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 225,[UIScreen mainScreen].bounds.size.width - 20, 20)];
    _altLabel.font = [UIFont systemFontOfSize:12.f];
    _altLabel.alpha = 0.5;
    
    self.headerImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 65, [UIScreen mainScreen].bounds.size.width - 20, [UIScreen mainScreen].bounds.size.width * 5 /10)];
    
    self.contactLabel = [[UILabel alloc] initWithFrame:CGRectMake(10,_headerImage.frame.size.height + 60.0, [UIScreen mainScreen].bounds.size.width - 20, 1200)];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 66,[UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    _scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 1600);
    
    [_scrollView addSubview:_titleLabel];
    [_scrollView addSubview:_sourceLabel];
    [_scrollView addSubview:_ptimeLabel];
    [_scrollView addSubview:_headerImage];
    [_scrollView addSubview:_contactLabel];
    [_scrollView addSubview:_altLabel];
    [self.view addSubview:_scrollView];
    
}

- (void)setDetails
{
    self.titleLabel.text = self.details.title;
    self.ptimeLabel.text = self.details.ptime;
    self.contactLabel.text = [self.details.body stringByReplacingOccurrencesOfString:@"<p>" withString:@"\n"];
    self.contactLabel.text = [_contactLabel.text stringByReplacingOccurrencesOfString:@"</p>" withString:@""];
    self.contactLabel.text = [_contactLabel.text stringByReplacingOccurrencesOfString:@"<b>" withString:@""];
    self.contactLabel.text = [_contactLabel.text stringByReplacingOccurrencesOfString:@"</b>" withString:@""];
    self.contactLabel.text = [_contactLabel.text stringByReplacingOccurrencesOfString:@"&gt;" withString:@""];
    _contactLabel.text = [_contactLabel.text stringByReplacingOccurrencesOfString:@"<strong>" withString:@""];
    _contactLabel.text = [_contactLabel.text stringByReplacingOccurrencesOfString:@"</strong>" withString:@""];
    for (int i = 0; i<[self.details.img count]; i++) {
        NSString *number = [NSString stringWithFormat:@"<!--SPINFO#%d>",i];
        self.contactLabel.text = [_contactLabel.text stringByReplacingOccurrencesOfString:number withString:@""];
    }
    for (int i = 0; i <[self.details.img count]; i++) {
        NSString *number = [NSString stringWithFormat:@"<!--IMG#%d-->",i];
        self.contactLabel.text = [_contactLabel.text stringByReplacingOccurrencesOfString:number withString:@""];
    }
    for (int i= 0 ; i<[self.details.link count]; i++) {
        NSString *number = [NSString stringWithFormat:@"<!--link%d-->",i];
        self.contactLabel.text = [_contactLabel.text stringByReplacingOccurrencesOfString:number withString:@""];
    }
    for (int i = 0; i <[self.details.video count]; i++) {
        NSString *number = [NSString stringWithFormat:@"<!--VIDEO#%d-->",i];
        self.contactLabel.text = [_contactLabel.text stringByReplacingOccurrencesOfString:number withString:@""];
    }
  
    _contactLabel.numberOfLines = 0;
    _contactLabel.font = [UIFont systemFontOfSize:15.f];
    _contactLabel.lineBreakMode = NSLineBreakByWordWrapping;
    CGSize size = [_contactLabel sizeThatFits:CGSizeMake(_contactLabel.frame.size.width, MAXFLOAT)];
    _contactLabel.frame = CGRectMake(_contactLabel.frame.origin.x,_contactLabel.frame.origin.y + 20,_contactLabel.frame.size.width,size.height);
    
    _scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, size.height+_contactLabel.frame.origin.y + 140);
    self.altLabel.text = [[self.details.img objectAtIndex:0] objectForKey:@"alt"];
    [self.headerImage sd_setImageWithURL:[NSURL URLWithString:[[self.details.img objectAtIndex:0] objectForKey:@"src"]]];
    UITapGestureRecognizer *tapGest = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didClickWebView)];
    [_headerImage addGestureRecognizer:tapGest];
    _headerImage.userInteractionEnabled = YES;
   
    self.sourceLabel.text = self.details.source;
    
}
- (void)didClickWebView
{
    
    WebViewController *webVC = [[WebViewController alloc]init];
    
    UIWebView *webview = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    
    [webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[[self.details.img objectAtIndex:0] objectForKey:@"src"]]]];
    [webVC.view addSubview:webview];
    
    NSInteger width = [[[[[self.details.img objectAtIndex:0] objectForKey:@"pixel"] componentsSeparatedByString:@"*"] objectAtIndex:0] integerValue];
    NSInteger height = [[[[[self.details.img objectAtIndex:0] objectForKey:@"pixel"] componentsSeparatedByString:@"*"] objectAtIndex:1] integerValue];
    
    if (width>=[UIScreen mainScreen].bounds.size.width&&height>=[UIScreen mainScreen].bounds.size.height) {
        UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height)];
        
        [imageview sd_setImageWithURL:[NSURL URLWithString:[[self.details.img objectAtIndex:0] objectForKey:@"src"]]];
        [webVC.view addSubview:imageview];
        [self.navigationController pushViewController:webVC animated:YES];
        
    }else if (width>=[UIScreen mainScreen].bounds.size.width&&height<=[UIScreen mainScreen].bounds.size.height){
        UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(0, ([UIScreen mainScreen].bounds.size.height-height)/2,[UIScreen mainScreen].bounds.size.width, height)];
        [imageview sd_setImageWithURL:[NSURL URLWithString:[[self.details.img objectAtIndex:0] objectForKey:@"src"]]];
        [webVC.view addSubview:imageview];
        [self.navigationController pushViewController:webVC animated:YES];
        
    }else if (width<=[UIScreen mainScreen].bounds.size.width&&height>=[UIScreen mainScreen].bounds.size.height){
        UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width-width)/2, 0,width, [UIScreen mainScreen].bounds.size.height)];
        [imageview sd_setImageWithURL:[NSURL URLWithString:[[self.details.img objectAtIndex:0] objectForKey:@"src"]]];
        [webVC.view addSubview:imageview];
        [self.navigationController pushViewController:webVC animated:YES];
        
    }else{
        UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0,width, height)];
        imageview.center = webVC.view.center;
        [imageview sd_setImageWithURL:[NSURL URLWithString:[[self.details.img objectAtIndex:0] objectForKey:@"src"]]];
        [webVC.view addSubview:imageview];
        [self.navigationController pushViewController:webVC animated:YES];
    }
}

-(void)creatquanquan
{
    self.quanquan = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    self.quanquan.frame = CGRectMake(0, 0, 120, 120);
    self.quanquan.center = self.view.center;
    self.quanquan.color = [UIColor redColor];
    self.quanquan.hidesWhenStopped = YES;
    [self.quanquan startAnimating];
    [self.view addSubview:self.quanquan];
   
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}

@end
