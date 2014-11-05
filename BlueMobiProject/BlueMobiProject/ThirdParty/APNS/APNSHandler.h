//
//  APNSHandler.h
//  BlueMobiProject
//
//  Created by 朱 亮亮 on 14-5-4.
//  Copyright (c) 2014年 朱 亮亮. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  苹果远程通知服务Handler类
 */
@interface APNSHandler : NSObject

/**
 *  单例
 *
 *  @return APNSHandler的单例对象
 */
+ (APNSHandler *) shareInstance;

/**
 *  注册APNS类型
 *
 *  @param types UIRemoteNotificationType枚举类型
 *  @param application   UIApplication对象，由AppDelegate代理方法传入
 *  @param launchOptions 字典，由AppDelegate代理方法传入
 */
+ (void)registerForRemoteNotificationTypes:(UIRemoteNotificationType)types application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;        

/**
 *  向第三方注册deviceToken，并且将原本deviceToken中的空格、<>等特殊字符去掉，转换成新的deviceToken
 *
 *  @param deviceToken 从UIApplicationDelegate方法中获得的原始deviceToken
 *
 *  @return 转换后的deviceToken
 */
+ (NSString *)registerDeviceToken:(NSData *)deviceToken;    

/**
 *  处理获取到的远程通知
 *
 *  @param userInfo 远程通知信息
 */
- (void)handleWithRemoteNotification:(NSDictionary *)userInfo;

@end
