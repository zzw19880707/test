//
//  TabBarView.m
//  BlueMobiProject
//
//  Created by 朱 亮亮 on 14-5-9.
//  Copyright (c) 2014年 朱 亮亮. All rights reserved.
//

#import "TabBarView.h"

/**
 *  引导页张数
 */
#define DEF_TAB_ITEM_COUNT 5

@implementation TabBarView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Tab_BG"]];
        
        /// tabBar上每个item的宽度
        float itemWidth = DEF_SCREEN_WIDTH/DEF_TAB_ITEM_COUNT;
        
        /// 创建每个item
        for (int i=0; i<DEF_TAB_ITEM_COUNT; i++) 
        {
            UIButton *itemButton = [[UIButton alloc] initWithFrame:CGRectMake(itemWidth*i, 0, itemWidth, DEF_HEIGHT(self))];
            itemButton.adjustsImageWhenHighlighted = NO;
            [itemButton setImage:[UIImage imageNamed:[NSString stringWithFormat:@"Tab_Item%d", i]] forState:UIControlStateNormal];
            [itemButton setImage:[UIImage imageNamed:[NSString stringWithFormat:@"Tab_Item%d_Select", i]] forState:UIControlStateSelected];
            [itemButton addTarget:self action:@selector(itemClick:) forControlEvents:UIControlEventTouchUpInside];
            itemButton.tag = i;
            [self addSubview:itemButton];
            
            if (i == 0) {
                itemButton.selected = YES;
            }
        }
    }
    return self;
}

- (void)itemClick:(UIButton *)item
{
    for (UIButton *button in self.subviews) 
    {
        button.selected = NO;
    }
    item.selected = YES;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(tabBarView:didSelectAtIndex:)]) {
        [self.delegate tabBarView:self didSelectAtIndex:item.tag];
    }
}

@end
