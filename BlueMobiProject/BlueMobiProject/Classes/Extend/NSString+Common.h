//
//  NSString+Common.h
//  BlueMobiProject
//
//  Created by 朱 亮亮 on 14-5-12.
//  Copyright (c) 2014年 朱 亮亮. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Common)

/**
 *  过滤html特殊字符
 *
 *  @return 过滤后的string
 */
- (NSString *)ignoreHTMLSpecialString;

/**
 *  过滤.net接口返回值的xml外包装，例如：
 *  <?xml version="1.0" encoding="utf-8"?>
 *  <string xmlns="http://tempuri.org/">{"result":"1","data":[{"User_Id":"32","User_Name":"nanq@bluemobi.cn"}]}</string>
 *  服务器返回的数据格式是xml中包JSON，所以要过滤掉外层的xml，直接返回json字符串
 *
 *  @return 过滤后的string
 */
- (NSString *)ignoreDotNetSpecialString;

@end
