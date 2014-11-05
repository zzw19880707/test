//
//  APNSHandler.m
//  BlueMobiProject
//
//  Created by 朱 亮亮 on 14-5-4.
//  Copyright (c) 2014年 朱 亮亮. All rights reserved.
//

#import "APNSHandler.h"

@implementation APNSHandler

+ (APNSHandler *)shareInstance
{
    static APNSHandler * manager = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        manager = [[APNSHandler alloc] init];
    });
    
    return manager;
}

+ (void)registerForRemoteNotificationTypes:(UIRemoteNotificationType)types application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [[UIApplication sharedApplication] registerForRemoteNotificationTypes:types];
    
    // 向第三方注册APNS类型
    // ...
}

+ (NSString *)registerDeviceToken:(NSData *)deviceToken
{
    // 向第三方注册deviceToken
    // ...
    
    // 生成新的deviceToken
    NSString *newDeviceToken = [[[deviceToken description] stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"<>"]] stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    DEF_PERSISTENT_SET_OBJECT(newDeviceToken, @"deviceToken");
    
    return newDeviceToken;
}

- (void)handleWithRemoteNotification:(NSDictionary *)userInfo
{
    NSDictionary *aps = [userInfo objectForKey:@"aps"];
    NSString *alert = [aps objectForKey:@"alert"];
    
#ifdef DEBUG
    NSLog(@"userInfo:%@ \n alert:%@", userInfo, alert);
#endif
    
    // 你的处理代码
    // ...
    
    // 将应用的Icon上的红色数字清零，看需求来保留或注销此代码
    [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
}

@end
