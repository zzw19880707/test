//
//  BMNetwokAPI.m
//  BlueMobiProject
//
//  Created by 朱 亮亮 on 14-5-12.
//  Copyright (c) 2014年 朱 亮亮. All rights reserved.
//

#import "BMNetwokAPI.h"
#import "BMNetworkHandler.h"
#import "BMNetWorkURLs.h"

@implementation BMNetwokAPI

+ (void)loginByMemberName:(NSString *)memberName
                 password:(NSString *)password
             successBlock:(NWSuccessBlock)successBlock
             failureBlock:(NWFailureBlock)failureBlock
                  showHUD:(BOOL)showHUD
{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setValue:memberName forKey:@"memberName"];
    [params setValue:password forKey:@"password"];
    
    [[BMNetworkHandler sharedInstance] conURL:LOGIN
                                  networkType:NetWorkPOST
                                       params:params
                                     delegate:nil 
                                      showHUD:showHUD 
                                 successBlock:successBlock
                                 failureBlock:failureBlock];
}

@end
