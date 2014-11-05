//
//  JsonHandler.h
//  BlueMobiProject
//
//  Created by 朱 亮亮 on 14-5-12.
//  Copyright (c) 2014年 朱 亮亮. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  Json解析Handler类
 */
@interface JsonHandler : NSObject

/**
 *  json解析
 *
 *  @param string               数据源
 *
 *  @return 解析后的数据
 */
+ (id)JSONValue:(NSString *)string;

@end
