
//
//  TextDetailsViewController.m
//  Newker2.0
//
//  Created by lanou3g on 15/5/28.
//  Copyright (c) 2015年 谢腾飞. All rights reserved.
//

#import "TextDetailsViewController.h"
#import "DataHandle.h"

@interface TextDetailsViewController ()

@property(nonatomic , strong)UIActivityIndicatorView * quanquan;
@property (nonatomic , strong)Details *details;

@end

@implementation TextDetailsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
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
    //    NSLog(@"%@", );
    self.details = [[Details alloc] init];
    [self.details setValuesForKeysWithDictionary:[dic objectForKey:self.docid]];
    [self.quanquan stopAnimating];
    
}
- (void)createView
{
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 66, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    _scrollView.contentSize = CGSizeMake(self.view.frame.size.width, 1600);
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, [UIScreen mainScreen].bounds.size.width-40, 30)];
    self.sourceLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 40, 80, 20)];
    _sourceLabel.font = [UIFont boldSystemFontOfSize:12.f];
    _sourceLabel.alpha = 0.5;
    
    self.ptimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 40, [UIScreen mainScreen].bounds.size.width - 120, 20)];
    _ptimeLabel.font = [UIFont boldSystemFontOfSize:12.f];
    _ptimeLabel.alpha = 0.5;
    
    self.contactLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 55,[UIScreen mainScreen].bounds.size.width-40, 1500)];
    
    
    [_scrollView addSubview:_titleLabel];
    [_scrollView addSubview:_ptimeLabel];
    [_scrollView addSubview:_sourceLabel];
    [_scrollView addSubview:_contactLabel];
    [self.view addSubview:_scrollView];
    
}
- (void)dismissAlterView:(UIAlertView *)alterView
{
    [alterView dismissWithClickedButtonIndex:0 animated:YES];
}
- (void)setDetails
{
    
    self.titleLabel.text = self.details.title;
    self.sourceLabel.text = self.details.source;
    self.ptimeLabel.text = self.details.ptime;
    self.contactLabel.text = [_details.body stringByReplacingOccurrencesOfString:@"<p>" withString:@"\n\n"];
    self.contactLabel.text = [_contactLabel.text stringByReplacingOccurrencesOfString:@"</p>" withString:@""];
    self.contactLabel.text = [_contactLabel.text stringByReplacingOccurrencesOfString:@"<b>" withString:@""];
    self.contactLabel.text = [_contactLabel.text stringByReplacingOccurrencesOfString:@"</b>" withString:@""];
    self.contactLabel.text = [_contactLabel.text stringByReplacingOccurrencesOfString:@"&gt;" withString:@""];
    _contactLabel.text = [_contactLabel.text stringByReplacingOccurrencesOfString:@"<strong>" withString:@""];
    _contactLabel.text = [_contactLabel.text stringByReplacingOccurrencesOfString:@"</strong>" withString:@""];
    

    for (int i = 0; i<=[_details.img count]; i++) {
        NSString *number = [NSString stringWithFormat:@"<!--SPINFO#%d>",i];
        self.contactLabel.text = [_contactLabel.text stringByReplacingOccurrencesOfString:number withString:@""];
    }
    
    
    for (int i= 0 ; i<[_details.link count]; i++) {
        NSString *number = [NSString stringWithFormat:@"<!--link%d-->",i];
        self.contactLabel.text = [_contactLabel.text stringByReplacingOccurrencesOfString:number withString:@""];
    }
    for (int i = 0; i <[_details.video count]; i++) {
        NSString *number = [NSString stringWithFormat:@"<!--VIDEO#%d-->",i];
        self.contactLabel.text = [_contactLabel.text stringByReplacingOccurrencesOfString:number withString:@""];
    }
    for (int i = 0; i<[_details.img count]; i++) {
        NSString *number = [NSString stringWithFormat:@"<!--IMG#%d-->",i];
        _contactLabel.text = [_contactLabel.text stringByReplacingOccurrencesOfString:number withString:@""];
    }
    //自适应高度
    _contactLabel.numberOfLines = 0;
    _contactLabel.font = [UIFont systemFontOfSize:15.f];
    _contactLabel.lineBreakMode = NSLineBreakByWordWrapping;
    CGSize size = [_contactLabel sizeThatFits:CGSizeMake(_contactLabel.frame.size.width, MAXFLOAT)];
    _contactLabel.frame = CGRectMake(_contactLabel.frame.origin.x,_contactLabel.frame.origin.y, _contactLabel.frame.size.width, size.height);
    
    //scrollView自适应
    _scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, size.height +_contactLabel.frame.origin.y + 140);
    
    
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

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self creatquanquan];
    [self json];
    [self createView];
    [self setDetails];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

@end
