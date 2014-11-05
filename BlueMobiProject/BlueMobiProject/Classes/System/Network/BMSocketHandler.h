//
//  BMSocketHandler.h
//  BlueMobiProject
//
//  Created by 朱 亮亮 on 14-5-12.
//  Copyright (c) 2014年 朱 亮亮. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GCDAsyncSocket.h"

/**
 *  Socket通讯Handler类
 */
@interface BMSocketHandler : NSObject <GCDAsyncSocketDelegate>

/**
 *  socket对象
 */
@property (nonatomic, strong) GCDAsyncSocket *socket;

/**
 *  单例
 *
 *  @return BMSocketHandler的单例对象
 */
+ (BMSocketHandler *) sharedInstance;

/**
 *  连接socket
 *
 *  @return 是否连接成功
 */
- (BOOL)connect;

/**
 *  断开socket
 */
- (void)disConnect;

/**
 *  判断socket是否已连接
 *
 *  @return 判断结果
 */
- (BOOL)isConnect;

@end
