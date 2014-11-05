//
//  User.m
//  BlueMobiProject
//
//  Created by 朱 亮亮 on 14-5-1.
//  Copyright (c) 2014年 朱 亮亮. All rights reserved.
//

#import "User.h"
#import "UserCache.h"
//#import "LoginViewController.h"

/**
 *  当前用户
 */
static User * userObj = nil;

@implementation User

+ (User *)user
{
    if (!userObj)
    {
//        userObj = [User loadUserIsLogin];
        if (!userObj) {
            userObj = [[User alloc] init];
        }
    }
    
    return userObj;
}

+ (BOOL)checkIfLogin:(BOOL)showLoginViewController
{
    if (![User user].isLogin) 
    {
//        LoginViewController *viewController = [[LoginViewController alloc] init];
//        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
//        [[[[[UIApplication sharedApplication] delegate] window] rootViewController] presentModalViewController:navigationController animated:YES];
        
        return NO;
    }
    else
    {
        return YES;
    }
}

+ (void)logout
{
    [[User user] toDelete];
    userObj = nil;
    
    //取消授权
    [ShareSDK cancelAuthWithType:ShareTypeSinaWeibo];
    [ShareSDK cancelAuthWithType:ShareTypeTencentWeibo];
    [ShareSDK cancelAuthWithType:ShareTypeQQSpace];
}

- (BOOL)toSave
{
    return [[UserCache cache] insertModel:self];
}

- (BOOL)toDelete
{
    return [[UserCache cache] deleteModel:self];
}

@end
