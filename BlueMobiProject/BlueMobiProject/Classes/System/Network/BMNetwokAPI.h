//
//  BMNetwokAPI.h
//  BlueMobiProject
//
//  Created by 朱 亮亮 on 14-5-12.
//  Copyright (c) 2014年 朱 亮亮. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BMNetworkDefine.h"

@interface BMNetwokAPI : NSObject

#pragma mark - 会员登录
/**
 *  会员登录
 *
 *  @param memberName   用户名
 *  @param password     经MD5小写加密的密码
 */
+ (void)loginByMemberName:(NSString *)memberName
                 password:(NSString *)password
             successBlock:(NWSuccessBlock)successBlock
             failureBlock:(NWFailureBlock)failureBlock
                  showHUD:(BOOL)showHUD;

@end
