//
//  BMBaseTableViewCell.h
//  BlueMobiProject
//
//  Created by 朱 亮亮 on 14-4-28.
//  Copyright (c) 2014年 朱 亮亮. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  自定义TableViewCell的基类
 */
@interface BMBaseTableViewCell : UITableViewCell

/**
 *  初始化TableViewCell的数据
 */
@property (nonatomic, strong) id data;

/**
 *  初始化TableViewCell
 *
 *  @param data 赋给TableViewCell的初始化数据
 */
- (void)initWithData:(id)data;

/**
 *  获取TableViewCell的高（固定高）
 *
 *  @return 高度值（像素）
 */
+ (CGFloat)height;

/**
 *  获取TableViewCell的高（动态高）
 *
 *  @param data 获取动态高所需要的数据
 *
 *  @return 高度值（像素）
 */
+ (CGFloat)heightWithData:(id)data;

@end
