//
//  NKClearViewController.m
//  Newker2.0
//
//  Created by lanou3g on 15/5/31.
//  Copyright (c) 2015年 谢腾飞. All rights reserved.
//

#import "NKClearViewController.h"
#import "SDImageCache.h"
@interface NKClearViewController ()

@end

@implementation NKClearViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [_myView.clearButton addTarget:self action:@selector(cleanButton) forControlEvents:UIControlEventTouchUpInside];
}

-(void)cleanButton
{
    CGFloat bety = [[SDImageCache sharedImageCache] getSize];
    CGFloat KB = bety/1024;
    CGFloat MB = KB/1024;
    CGFloat GB = MB/1024;
    if(KB>1024&&MB<1024){
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"清除缓存%.2fMB",MB] message:@"确定要清除缓存吗?" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
        [alertView show];
        
    }else if(MB>1024){
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"清除缓存%.2fG",GB] message:@"确定要清除缓存吗?" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
        [alertView show];
        
    }else if (KB<1024&&KB!=0){
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"清除缓存%.2fKB",KB] message:@"确定要清除缓存吗?" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
        [alertView show];
        
    }else{
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"没有要清理的缓存" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertView show];
        
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    [[SDImageCache sharedImageCache] clearMemory];
    [[SDImageCache sharedImageCache] cleanDisk];
    [[SDImageCache sharedImageCache] clearDisk];
    if(buttonIndex==0){
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"清除成功" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertView show];
        
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
