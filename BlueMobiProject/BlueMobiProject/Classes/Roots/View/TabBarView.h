//
//  TabBarView.h
//  BlueMobiProject
//
//  Created by 朱 亮亮 on 14-5-9.
//  Copyright (c) 2014年 朱 亮亮. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TabBarView;

/**
 *  TabBarView的委托协议
 */
@protocol TabBarViewDelegate <NSObject>

/**
 *  TabBarView被选中的item
 *
 *  @param tabBarView 当前TabBarView对象
 *  @param index      被选中的item的index
 */
- (void)tabBarView:(TabBarView *)tabBarView didSelectAtIndex:(int)index;

@end

/**
 *  App下导航栏
 */
@interface TabBarView : UIView

/**
 *  TabBarView对象
 */
@property (nonatomic, weak) id<TabBarViewDelegate> delegate;

@end
