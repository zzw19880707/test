//
//  BMSocketHandler.m
//  BlueMobiProject
//
//  Created by 朱 亮亮 on 14-5-12.
//  Copyright (c) 2014年 朱 亮亮. All rights reserved.
//

#import "BMSocketHandler.h"
#import "BMNetWorkURLs.h"
#import "BMNetworkDefine.h"

@implementation BMSocketHandler

+ (BMSocketHandler *) sharedInstance
{
    static BMSocketHandler * handler = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        handler = [[BMSocketHandler alloc] init];
    });
    
    return handler;
}

- (id)init
{
    self = [super init];
    if (self) 
    {
        self.socket = [[GCDAsyncSocket alloc] initWithDelegate:self delegateQueue:dispatch_get_main_queue()];
    }
    return self;
}

- (BOOL)connect
{
    BOOL result = NO;
    if (![self isConnect]) 
    {
        NSError *error = nil;
        result = [self.socket connectToHost:SOCKET_HOST onPort:SOCKET_PORT error:&error];
        if (error != nil || !result) 
        {
            DEF_DEBUG(@"connect fail!");
        }
        else
        {
            DEF_DEBUG(@"connect success!");
        }
    }
    
    return result;
}

- (void)disConnect
{
    if ([self isConnect]) 
    {
        [self.socket disconnect];
    }
}

- (BOOL)isConnect
{
    return self.socket.isConnected;
}

#pragma mark - GCDAsyncSocketDelegate
- (void)socket:(GCDAsyncSocket *)sock didConnectToHost:(NSString *)host port:(uint16_t)port
{

}

- (void)socket:(GCDAsyncSocket *)sock didWriteDataWithTag:(long)tag
{

}

- (void)socket:(GCDAsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag
{
    
}

@end
