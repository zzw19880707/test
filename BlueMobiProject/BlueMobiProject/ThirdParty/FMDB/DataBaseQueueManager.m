//
//  DataBaseQueueManager.m
//  BigPlayersTogether
//
//  Created by robot liu on 8/14/12.
//
//

#import "DataBaseQueueManager.h"
#import "GTMObjectSingleton.h"

@implementation DataBaseQueueManager

@synthesize dataBaseQueue=_dataBaseQueue;

GTMOBJECT_SINGLETON_BOILERPLATE(DataBaseQueueManager,sharedInstance)

- (NSString *)documentPath{
	NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory=[paths objectAtIndex:0];
	return documentDirectory;
}

- (NSString *)databaseFilePath{
    return [[self documentPath] stringByAppendingPathComponent:@"BlueMobiProject.db"];
}

- (BOOL)copyDatabaseIfNeed{
    BOOL success=NO;
    NSFileManager *fileManager=[NSFileManager defaultManager];
    NSError *error;
 
    success=[fileManager fileExistsAtPath:[self databaseFilePath]];
    
    if (success) return YES;
    
    NSString *defaultDBPath=[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"BlueMobiProject.db"];
    return [fileManager copyItemAtPath:defaultDBPath toPath:[self databaseFilePath] error:&error];
  
}

- (void)initQueue{
    _dataBaseQueue=[[FMDatabaseQueue alloc] initWithPath:[self databaseFilePath]];
    [_dataBaseQueue inDatabase:^(FMDatabase *db) {
        [db setShouldCacheStatements:YES];
    }];
}

- (id)init{
    self=[super init];
    if (self) {
        if ([self copyDatabaseIfNeed]) {
            [self initQueue];
        }
    }
    return self;
}

- (void)closeQueue{
    [self.dataBaseQueue close];
}

@end
