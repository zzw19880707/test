//
//  BMTableViewController.h
//  BlueMobiProject
//
//  Created by 朱 亮亮 on 14-5-5.
//  Copyright (c) 2014年 朱 亮亮. All rights reserved.
//

#import "BMBaseViewController.h"

@interface BMTableViewController : BMBaseViewController

/**
 *  第几页
 */
@property (nonatomic, assign) int pageNo;

/**
 *  每页几条
 */
@property (nonatomic, assign) int pageSize;      

/**
 *  刷新数据
 */
- (void)reloadData;

/**
 *  加载更多数据
 */
- (void)loadMoreData;

@end
