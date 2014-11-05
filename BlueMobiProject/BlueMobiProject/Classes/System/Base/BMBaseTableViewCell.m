//
//  BMBaseTableViewCell.m
//  BlueMobiProject
//
//  Created by 朱 亮亮 on 14-4-28.
//  Copyright (c) 2014年 朱 亮亮. All rights reserved.
//

#import "BMBaseTableViewCell.h"

@implementation BMBaseTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - 请重写以下方法
- (void)initWithData:(id)data
{

}

+ (CGFloat)height
{
    return 0;
}

+ (CGFloat)heightWithData:(id)data
{
    return 0;
}

@end
