//
//  ShareSDKHandler.m
//  BlueMobiProject
//
//  Created by 朱 亮亮 on 14-5-4.
//  Copyright (c) 2014年 朱 亮亮. All rights reserved.
//

#import "ShareSDKHandler.h"
#import "WXApi.h"
#import <ShareSDK/ShareSDK.h>
//#import "AppDelegate.h"

@implementation ShareSDKHandler

+ (BOOL)hasAuthorizedWithType:(ShareType)type
{
    return [ShareSDK hasAuthorizedWithType:type];
}

+ (void)authWithType:(ShareType)type                       
              result:(SSGetUserInfoEventHandler)resultHandler
{
    //用户用户信息
    id<ISSAuthOptions> authOptions = [ShareSDK authOptionsWithAutoAuth:YES
                                                         allowCallback:YES
                                                         authViewStyle:SSAuthViewStyleFullScreenPopup
                                                          viewDelegate:nil
                                               authManagerViewDelegate:nil];
    
    [ShareSDK getUserInfoWithType:type
                      authOptions:authOptions
                           result:^(BOOL result, id<ISSPlatformUser> userInfo, id<ICMErrorInfo> error) {
                               resultHandler(result, userInfo, error);
                           }];
}

+ (void)cancelAuthWithType:(ShareType)type
{
    [ShareSDK cancelAuthWithType:type];
}

+ (void)content:(NSString *)content
          image:(UIImage *)image
          title:(NSString *)title
            url:(NSString *)url
    description:(NSString *)description
           type:(ShareType)type
         result:(SSPublishContentEventHandler)resultHandler
{
    id<ISSContent> isscontent = [ShareSDK content:content
                                defaultContent:nil
                                         image:[ShareSDK jpegImageWithImage:image quality:1]
                                         title:title
                                           url:url
                                   description:description
                                     mediaType:SSPublishContentMediaTypeApp];
    
    id<ISSAuthOptions> authOptions = [ShareSDK authOptionsWithAutoAuth:YES
                                                         allowCallback:YES
                                                         authViewStyle:SSAuthViewStyleFullScreenPopup
                                                          viewDelegate:nil
                                               authManagerViewDelegate:nil];
    
    [ShareSDK shareContent:isscontent
                      type:type
               authOptions:authOptions
             statusBarTips:YES
                    result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                        resultHandler(type, state, statusInfo, error, end);
                    }];
}

@end
