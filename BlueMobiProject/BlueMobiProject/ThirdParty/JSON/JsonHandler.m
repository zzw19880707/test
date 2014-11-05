//
//  JsonHandler.m
//  BlueMobiProject
//
//  Created by 朱 亮亮 on 14-5-12.
//  Copyright (c) 2014年 朱 亮亮. All rights reserved.
//

#import "JsonHandler.h"
#import "JSON.h"
#import "NSString+Common.h"

@implementation JsonHandler

+ (id)JSONValue:(NSString *)string
{
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_5_0
    return [NSJSONSerialization JSONObjectWithData:[string dataUsingEncoding:NSUTF8StringEncoding]
                                           options:NSJSONReadingMutableContainers
                                             error:nil];
#else
    return [string JSONValue];
#endif
}

@end
