//
//  UserCache.h
//  BlueMobiProject
//
//  Created by 朱 亮亮 on 14-5-2.
//  Copyright (c) 2014年 朱 亮亮. All rights reserved.
//

#import "BaseDAO.h"

@class User;
@interface UserCache : BaseDAO

/**
 *  查找User对象
 *
 *  @return User对象
 */
- (User *)loadUser;

@end
