//
//  BaseDAO.h
//  BigPlayersTogether
//
//  Created by www.toonyoo.com on 11-12-19.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
#import "FMDatabaseAdditions.h"
#import "FMDatabaseQueue.h"

@interface BaseDAO : NSObject

/**
 *  FMDatabaseQueue对象
 */
@property (nonatomic,readonly) FMDatabaseQueue *queue;

/**
 *  获得Cache
 *
 *  @return 相应的cache
 */
+ (id)cache;

/**
 *  创建数据表
 *
 *  @return 操作是否成功（YES：是，NO：不是）
 */
- (BOOL)createTable;

/**
 *  删除数据表
 *
 *  @return 操作是否成功（YES：是，NO：不是）
 */
- (BOOL)dropTable;

/**
 *  更新数据表
 *
 *  @return 操作是否成功（YES：是，NO：不是）
 */
- (BOOL)updateTable;

/**
 *  向数据库中插入model对象
 *
 *  @param model 要插入的model对象
 *
 *  @return 操作是否成功（YES：是，NO：不是）
 */
- (BOOL)insertModel:(id)model;

/**
 *  从数据库中删除model对象
 *
 *  @param model 要删除的model对象
 *
 *  @return 操作是否成功（YES：是，NO：不是）
 */
- (BOOL)deleteModel:(id)model;

/**
 *  通过获取到的FMResultSet对象，初始化相应的Model
 *
 *  @param result FMResultSet对象
 *
 *  @return 初始化后的Model
 */
- (id)modelInit:(FMResultSet *)result;

@end