//
//  BMDefine.h
//  BlueMobiProject
//
//  Created by 朱 亮亮 on 14-4-28.
//  Copyright (c) 2014年 朱 亮亮. All rights reserved.
//

#import "BMLogDefine.h"
#import "BMViewDefine.h"
#import "BMPersistentDefine.h"
#import "BMNotificationDefine.h"
#import "BMLabelDefine.h"

#ifndef BlueMobiProject_BMDefine_h
#define BlueMobiProject_BMDefine_h

/// 存放此项目所有的新建宏定义   

/**
 *  设备的deveiceToken，只有在支持推送下有值
 */
#define DEF_DEVICE_TOKEN   DEF_PERSISTENT_GET_OBJECT(@"deviceToken")  

/**
 *  设备的deveiceToken，只有在支持推送下有值
 */
#define DEF_TAB_BAR_HEIGHT 50  

#endif
