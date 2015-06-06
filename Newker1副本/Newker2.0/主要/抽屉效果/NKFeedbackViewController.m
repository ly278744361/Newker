//
//  NKFeedbackViewController.m
//  Newker2.0
//
//  Created by lanou3g on 15/5/31.
//  Copyright (c) 2015年 谢腾飞. All rights reserved.
//

#import "NKFeedbackViewController.h"
#import "NKProfileViewController.h"

#define MainScreen_Size [UIScreen mainScreen].bounds.size
#define MainScreen_Width [UIScreen mainScreen].bounds.size.width
#define MainScreen_Height [UIScreen mainScreen].bounds.size.height
#define SelfScreen_Size     self.view.bounds.size

@interface NKFeedbackViewController ()<UITextFieldDelegate>

@property (nonatomic , strong)UITextField * feedBackText;

@end

@implementation NKFeedbackViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title=@"意见反馈";
    
    self.feedBackText=[[UITextField alloc]initWithFrame:CGRectMake(10, 40, MainScreen_Width-20, 80)];
    self.feedBackText.delegate=self;
    self.feedBackText.placeholder=@"输入您的宝贵建议";
    self.feedBackText.borderStyle=3;
    self.feedBackText.textAlignment=0;
    [self.view addSubview:self.feedBackText];
    
    UIButton *submitButton=[UIButton buttonWithType:UIButtonTypeSystem];
    submitButton.backgroundColor=[UIColor greenColor];
    [submitButton addTarget:self action:@selector(submitAction) forControlEvents:UIControlEventTouchUpInside];
    [submitButton setTitle:@"提交反馈" forState:UIControlStateNormal];
    submitButton.layer.cornerRadius=15;
    submitButton.frame=CGRectMake(50, 130, MainScreen_Width - 100, 50);
    [self.view addSubview:submitButton];
}
-(void)submitAction{
    [self showMailPicker];
    
    self.feedBackText.text=nil;
    
}

-(void)BackToMenu
{
    NKProfileViewController *mainTabBarVc=[[NKProfileViewController alloc]init];
    [self presentViewController:mainTabBarVc animated:YES completion:nil];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//邮件
-(void)showMailPicker {
    Class mailClass = (NSClassFromString(@"MFMailComposeViewController"));
    
    if (mailClass !=nil) {
        if ([mailClass canSendMail]) {
            [self displayMailComposerSheet];
        }else{
            UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@" "message:@"设备不支持邮件功能" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
            [alert show];
            
        }
    }else{
        
    }
    
}

-(void)displayMailComposerSheet
{
    MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
    
    picker.mailComposeDelegate =self;
    
    [picker setSubject:@"提交反馈"];
    
    NSArray *toRecipients = [NSArray arrayWithObject:@"xtfei_2011@126.com"];
    
    [picker setToRecipients:toRecipients];
    
    NSString *emailBody= self.feedBackText.text;
    
    [picker setMessageBody:emailBody isHTML:NO];
    [self presentViewController:picker animated:YES completion:nil];
    
}
- (void)mailComposeController:(MFMailComposeViewController*)controller
          didFinishWithResult:(MFMailComposeResult)result  error:(NSError*)error {
    
    switch (result)
    {
        caseMFMailComposeResultCancelled:
            
        {
            
            UIAlertView * alert=[[UIAlertView alloc] initWithTitle:@" "message:@"已成功发送" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
            [alert show];
            break;
        }
        caseMFMailComposeResultSaved:
            
            break;
        caseMFMailComposeResultSent:
            
            break;
        caseMFMailComposeResultFailed:
            
            break;
        default:
           
            break;
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}







@end
