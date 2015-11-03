//
//  GPLoginController.m
//  03-权限控制
//
//  Created by qianfeng on 15-10-9.
//  Copyright (c) 2015年 肖喆. All rights reserved.
//

#import "GPLoginController.h"
#import <MOBFoundation/MOBFoundation.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import <ShareSDKExtension/SSEThirdPartyLoginHelper.h>
#import "GuardViewController.h"

@interface GPLoginController ()

@property (weak, nonatomic) IBOutlet UITextField *nameText;
@property (weak, nonatomic) IBOutlet UITextField *pwdText;

@end

@implementation GPLoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStylePlain target:self action:@selector(btnCloseTouch:)];

}

- (void)btnCloseTouch:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

- (IBAction)btnTouch:(id)sender {
    
    NSString * name = self.nameText.text;
    NSString * pwd = self.nameText.text;
    
    //系统提供的一个键值存储plist文件工具类
    //使用方法就是与可变字典对象相同
    NSUserDefaults * ud = [NSUserDefaults standardUserDefaults];
    
    [ud setObject:name forKey:@"name"];
    [ud setObject:pwd forKey:@"pwd"];
    
    //立即执行存储到plist文件中
    [ud synchronize];
    
    
}
- (IBAction)weiboLogin:(id)sender {
    [SSEThirdPartyLoginHelper loginByPlatform:SSDKPlatformTypeSinaWeibo
                                   onUserSync:^(SSDKUser *user, SSEUserAssociateHandler associateHandler) {
                                       
                                       //在此回调中可以将社交平台用户信息与自身用户系统进行绑定，最后使用一个唯一用户标识来关联此用户信息。
                                       //在此示例中没有跟用户系统关联，则使用一个社交用户对应一个系统用户的方式。将社交用户的uid作为关联ID传入associateHandler。
                                       associateHandler (user.uid, user, user);
                                       //在这里获得用户信息，存储到userInfo中，使用
                                       NSLog(@"nickname = %@", user.nickname);
                                   }
                                onLoginResult:^(SSDKResponseState state, SSEBaseUser *user, NSError *error) {
                                    
                                    if (state == SSDKResponseStateSuccess)
                                    {
                                        NSLog(@"success");
//                                        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
//                                        GuardViewController *vc = [storyBoard instantiateViewControllerWithIdentifier:@"GuardViewController"];
//                                        
//                                        [self presentViewController:vc animated:YES completion:nil];
                                        [self dismissViewControllerAnimated:YES completion:nil];
                                    }
                                    else
                                    {
                                        NSLog(@"failure");
                                    }
                                    
                                }];
}


@end
