//
//  ShareSDKTestViewController.m
//  BlueMobiProject
//
//  Created by 朱 亮亮 on 14-5-6.
//  Copyright (c) 2014年 朱 亮亮. All rights reserved.
//

#import "ShareSDKTestViewController.h"
#import "ShareSDKHandler.h"

@interface ShareSDKTestViewController ()

@end

@implementation ShareSDKTestViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    // 判断是否授权，以新浪微博为例 （微信是不能判断是否授权的）
    if ([ShareSDKHandler hasAuthorizedWithType:ShareTypeSinaWeibo]) { }
    
    
    
    // 授权，以新浪微博为例
    [ShareSDKHandler authWithType:ShareTypeSinaWeibo 
                           result:^(BOOL result, id<ISSPlatformUser> userInfo, id<ICMErrorInfo> error) {
                               if (result)
                               {
                                   // 可以从userInfo对象中获取信息
                               }
                               
                               if (error) 
                               {
                                   DEF_DEBUG(@"%d:%@",[error errorCode], [error errorDescription]);
                               }
                           }];
    

    
    // 分享，以新浪微博为例（微信朋友圈的分享，必须带图片，否则会分享失败）
    [ShareSDKHandler content:@"你好content" 
                       image:nil 
                       title:@"你好title" 
                         url:@"http://www.baidu.com"
                 description:nil 
                        type:ShareTypeWeixiSession 
                      result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                          if (state == SSPublishContentStateSuccess)
                          {
                              NSLog(@"success");
                          }
                          else if (state == SSPublishContentStateFail)
                          {
                              if ([error errorCode] == -22003)
                              {
                                  UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示"
                                                                                      message:[error errorDescription]
                                                                                     delegate:nil
                                                                            cancelButtonTitle:@"知道了"
                                                                            otherButtonTitles:nil];
                                  [alertView show];
                              }
                          }
                      }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
