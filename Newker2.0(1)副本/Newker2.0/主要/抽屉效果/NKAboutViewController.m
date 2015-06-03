//
//  NKAboutViewController.m
//  Newker2.0
//
//  Created by lanou3g on 15/5/31.
//  Copyright (c) 2015年 谢腾飞. All rights reserved.
//

#import "NKAboutViewController.h"

@interface NKAboutViewController ()

@end

@implementation NKAboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"关于我们";
    // Do any additional setup after loading the view.
    //    UIBarButtonItem * rightButton = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    //    self.navigationItem.rightBarButtonItem = rightButton;
    
    UIImageView *imageView= [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tubiao"]];
    imageView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 100, self.view.bounds.size.height / 4 - 100, 200, 100);
    [self.view addSubview:imageView];
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 60, self.view.bounds.size.height / 4 + 20, 120, 20)];
    label1.text = @"Newker  1.0.1";
    label1.textAlignment = NSTextAlignmentCenter;
    label1.textColor = [UIColor lightGrayColor];
    [self.view addSubview:label1];
    
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 120, self.view.bounds.size.height / 4 + 40, 240, 120)];
    label2.text = @"       感谢您对我们的大力支持，我们会尽全力做好每项工作，争取将Newker做到最适合每一位青年人的一款APP，您的支持就是我们最大的动力。";
    label2.numberOfLines = 0;
    label2.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:label2];
    
    UILabel *label4 = [[UILabel alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 120, 380, 240, 30)];
    label4.text = @"邮箱：xtfei_2011@126.com";
    label4.textAlignment = 1;
    label4.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:label4];
    
    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 120, self.view.bounds.size.height / 4 + 380, 240, 50 )];
    label3.textAlignment = 1;
    label3.textColor = [UIColor lightGrayColor];
    label3.text = @"Newker  版权所有\nCopyright © 2011 - 2015 \nAll Rights Reserved";
    label3.numberOfLines = 0;
    label3.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:label3];
    
}

//-(void)back
//{
//    [self dismissViewControllerAnimated:YES completion:nil];
//}
#pragma mark - leftBarButtonAction 事件
//- (void)leftBarButtonAction:(UIBarButtonItem *)back
//{
//    [self.navigationController popViewControllerAnimated:YES];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
