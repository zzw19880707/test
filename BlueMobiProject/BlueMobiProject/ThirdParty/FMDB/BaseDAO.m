//
//  BaseDAO.m
//  BigPlayersTogether
//
//  Created by www.toonyoo.com on 11-12-19.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "BaseDAO.h"
#import "DataBaseQueueManager.h"

@implementation BaseDAO

@synthesize queue=_queue;

- (FMDatabaseQueue *)queue{
    return [DataBaseQueueManager sharedInstance].dataBaseQueue;
}

- (id)init
{
    self = [super init];
    if (self) {
        [self createTable];
    }
    return self;
}

#pragma mark - Public Methods
+ (id)cache
{
    return nil;
}

- (BOOL)createTable{
	return NO;
}
- (BOOL)dropTable{
	return NO;
}

- (BOOL)updateTable{
    return NO;
}

- (BOOL)insertModel:(id)model
{
    return NO;
}

- (BOOL)deleteModel:(id)model
{
    return NO;
}

- (id)modelInit:(FMResultSet *)result
{
    return nil;
}

@end
