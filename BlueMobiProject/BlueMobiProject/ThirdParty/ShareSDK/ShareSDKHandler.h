//
//  ShareSDKHandler.h
//  BlueMobiProject
//
//  Created by 朱 亮亮 on 14-5-4.
//  Copyright (c) 2014年 朱 亮亮. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDK/ShareSDKTypeDef.h>
#import <ShareSDK/ShareSDKEventHandlerDef.h>
#import <ShareSDKCoreService/ISSCAttachment.h>

/**
 *  ShareSDK的Handler类
 */
@interface ShareSDKHandler : NSObject

/**
 *	判断是否授权,微信、QQ、邮件、短信、打印、拷贝类型不支持授权功能。
 *
 *	@param 	type 	社会化平台类型
 *
 *	@return	YES 已授权； NO 未授权
 */
+ (BOOL)hasAuthorizedWithType:(ShareType)type; 

/**
 *  进行授权,微信、QQ、邮件、短信、打印、拷贝类型不支持授权功能。
 *
 *  @param 	type 	社会化平台类型
 *	@param 	resultHandler 	取用户信息事件处理器
 */
+ (void)authWithType:(ShareType)type                       
              result:(SSGetUserInfoEventHandler)resultHandler;

/**
 *	取消授权,微信、QQ、邮件、短信、打印、拷贝类型不支持授权功能。
 *
 *	@param 	type 	社会化平台类型
 */
+ (void)cancelAuthWithType:(ShareType)type;

/**
 *	创建分享内容对象，根据以下每个字段适用平台说明来填充参数值
 *
 *	@param 	content 	分享内容（新浪、腾讯、网易、搜狐、豆瓣、人人、开心、有道云笔记、facebook、twitter、邮件、打印、短信、微信、QQ、拷贝）
 *	@param 	image 	分享图片（新浪、腾讯、网易、搜狐、豆瓣、人人、开心、facebook、twitter、邮件、打印、微信、QQ、拷贝）
 *	@param 	title 	标题（QQ空间、人人、微信、QQ）
 *	@param 	url 	链接（QQ空间、人人、instapaper、微信、QQ）
 *	@param 	description 	主体内容（人人）
 *  @param 	type 	社会化平台类型
 *	@param 	result 	返回事件
 *
 *	@return	分享内容对象
 */
+ (void)content:(NSString *)content
          image:(UIImage *)image
          title:(NSString *)title
            url:(NSString *)url
    description:(NSString *)description
           type:(ShareType)type
         result:(SSPublishContentEventHandler)resultHandler;

@end
