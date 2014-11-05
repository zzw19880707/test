//
//  BMLogDefine.h
//  BlueMobiProject
//
//  Created by 朱 亮亮 on 14-4-28.
//  Copyright (c) 2014年 朱 亮亮. All rights reserved.
//

#ifndef BlueMobiProject_BMLogDefine_h
#define BlueMobiProject_BMLogDefine_h

#ifdef DEBUG

/// DEBUG模式下进行调试打印

#define DEF_DEBUG(...)   NSLog(__VA_ARGS__)

#else

#define DEF_DEBUG(...)   {}

#endif

#endif
