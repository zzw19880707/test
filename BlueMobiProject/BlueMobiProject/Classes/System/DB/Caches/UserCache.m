//
//  UserCache.m
//  BlueMobiProject
//
//  Created by 朱 亮亮 on 14-5-2.
//  Copyright (c) 2014年 朱 亮亮. All rights reserved.
//

#import "UserCache.h"
#import "User.h"

@implementation UserCache

#pragma mark - Override Methods
+ (id)cache
{
    UserCache *userCache = [[UserCache alloc] init];
    return userCache;
}

- (BOOL)createTable
{
    __block BOOL success = NO;
    
    /**
     *  @param ID 主键
     *  @param isLogin 是否登录
     */
    
    [self.queue inDatabase:^(FMDatabase *db) {
        NSString *shopTable = @"create table if not exists user(ID integer primary key autoincrement, isLogin integer)";
        success = [db executeUpdate:shopTable];
    }];
    return success;
}

- (BOOL)insertModel:(id)model
{
    __block BOOL success = NO;

    User *user = (User *)model;
    [self.queue inDatabase:^(FMDatabase *db) {
        success = [db executeUpdate:@"insert or replace into user(isLogin) values(?)", [NSNumber numberWithBool:user.isLogin], nil];
    }];
    return success;
}

- (BOOL)deleteModel:(id)model
{
    __block BOOL success = NO;
    
//    User *user = (User *)model;
    [self.queue inDatabase:^(FMDatabase *db) {
//        success = [db executeUpdate:@"delete from user where userID = ?", user.userID];
    }];
    return success;
}

- (id)modelInit:(FMResultSet *)result
{
    User *user = [[User alloc] init];
    user.isLogin = [result intForColumn:@"isLogin"];
    
    return user;
}

- (User *)loadUser
{
    __block User *user = nil;
    
    [self.queue inDatabase:^(FMDatabase *db) {
        FMResultSet *rs=[db executeQuery:@"select * from user"];
        while ([rs next]) {
            user = [self modelInit:rs];
        }
        [rs close];
    }];
    
    return user;
}

@end
