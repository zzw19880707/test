//
//  BMPersistentDefine.h
//  BlueMobiProject
//
//  Created by 朱 亮亮 on 14-5-8.
//  Copyright (c) 2014年 朱 亮亮. All rights reserved.
//

#ifndef BlueMobiProject_BMPersistentDefine_h
#define BlueMobiProject_BMPersistentDefine_h

/**
 *	永久存储对象
 *
 *	@param	object    需存储的对象
 *	@param	key    对应的key
 */
#define DEF_PERSISTENT_SET_OBJECT(object, key)                                                                                                 \
({                                                                                                                                             \
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];                                                                         \
    [defaults setObject:object forKey:key];                                                                                                    \
    [defaults synchronize];                                                                                                                    \
}) 

/**
 *	取出永久存储的对象
 *
 *	@param	key    所需对象对应的key
 *	@return	key所对应的对象
 */
#define DEF_PERSISTENT_GET_OBJECT(key) [[NSUserDefaults standardUserDefaults] objectForKey:key] 

#endif
