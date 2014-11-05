//
//  DataBaseQueueManager.h
//  BigPlayersTogether
//
//  Created by robot liu on 8/14/12.
//
//

#import <Foundation/Foundation.h>
#import "FMDatabaseQueue.h"
#import "FMDatabase.h"

@interface DataBaseQueueManager : NSObject

@property (nonatomic,readonly) FMDatabaseQueue *dataBaseQueue;
+ (DataBaseQueueManager *)sharedInstance;

@end
