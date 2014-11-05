//
//  BMBaseViewController.h
//  BlueMobiProject
//
//  Created by 朱 亮亮 on 14-4-28.
//  Copyright (c) 2014年 朱 亮亮. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  自定义ViewController的基类
 */
@interface BMBaseViewController : UIViewController

/**
 *  内容视图，所有的view都加载contentView上，而不再是self.view上
 */
@property (nonatomic, strong) UIView *contentView;

/**
 *  添加子视图，以后所有添加子视图的操作，都使用[self addSubview:...];，而不再用[self.view addSubview:...]
 *
 *  @param view 子视图
 */
- (void)addSubview:(UIView *)view;

@end
