//
//  BMNetWorkURLs.h
//  BlueMobiProject
//
//  Created by 朱 亮亮 on 14-5-12.
//  Copyright (c) 2014年 朱 亮亮. All rights reserved.
//

#ifndef BlueMobiProject_BMNetWorkURLs_h
#define BlueMobiProject_BMNetWorkURLs_h

/**
 *  API的HOST
 */
#define API_HOST @"http://58.83.147.106:8012/DayiWebService.asmx/"

/**
 *  Socket的HOST
 */
#define SOCKET_HOST @"58.83.147.106"

/**
 *  Socket的PORT
 */
#define SOCKET_PORT 10000


/// 请在此定义请求URL
#define HOME_PAGE_IMAGE_SCROLL        [NSString stringWithFormat:@"%@home/ADList.aspx", API_HOST]                   // 01. 首页轮换图片
#define ORDER_LIST                    [NSString stringWithFormat:@"%@order/GetOrderList.aspx", API_HOST]            // 02. 订单列表
#define CATE_LIST                     [NSString stringWithFormat:@"%@product/catelist.aspx", API_HOST]              // 03. 商品分类列表
#define PRODUCT_LIST                  [NSString stringWithFormat:@"%@product/prodlist.aspx", API_HOST]              // 04. 商品列表
#define BRAND_LIST                    [NSString stringWithFormat:@"%@product/GetBrandList.aspx", API_HOST]          // 05. 品牌列表
#define LOGIN                         [NSString stringWithFormat:@"%@member/login.aspx", API_HOST]                  // 06. 会员登录
#define REGISTER                      [NSString stringWithFormat:@"%@member/register.aspx", API_HOST]               // 07. 会员注册
#define FORGET_PASSWORD               [NSString stringWithFormat:@"%@member/FindPwdSendEmail.aspx", API_HOST]       // 08. 忘记密码
#define UPDATE_PASSWORD               [NSString stringWithFormat:@"%@member/ChangePassword.aspx", API_HOST]         // 09. 修改密码


#endif
