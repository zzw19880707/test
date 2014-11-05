//
//  User.h
//  BlueMobiProject
//
//  Created by 朱 亮亮 on 14-5-1.
//  Copyright (c) 2014年 朱 亮亮. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDK/ShareSDK.h>

/**
 *  用户Model类
 */
@interface User : NSObject

/**
 *  是否已登录
 */
@property (nonatomic, assign) BOOL isLogin;

/**
 *  返回当前用户
 *
 *  @return 当前用户
 */
+ (User *)user;

/**
 *  检测是否登录
 *
 *  @param showLoginViewController 是否弹出登录Viewcontroller（只在检测结果为NO时起作用）
 *
 *  @return 检测结果（YES：已登录，NO：未登录）
 */
+ (BOOL)checkIfLogin:(BOOL)showLoginViewController;

/**
 *  注销登录
 */
+ (void)logout;

/**
 *  保存
 *
 *  @return 操作是否成功（YES：是，NO：不是）
 */
- (BOOL)toSave;

/**
 *  删除
 *
 *  @return 操作是否成功（YES：是，NO：不是）
 */
- (BOOL)toDelete;

@end
