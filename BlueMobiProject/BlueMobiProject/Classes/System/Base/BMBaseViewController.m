//
//  BMBaseViewController.m
//  BlueMobiProject
//
//  Created by 朱 亮亮 on 14-4-28.
//  Copyright (c) 2014年 朱 亮亮. All rights reserved.
//

#import "BMBaseViewController.h"

@interface BMBaseViewController ()

@end

@implementation BMBaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {        
        // Do any additional setup after loading the view.
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
   
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_7_0
    // iOS7顶部屏幕适配
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) 
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
#endif
    
    // 导航栏左按钮
    UIButton* leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.frame = CGRectMake(0.,0.,50,24);
    [leftButton setBackgroundImage:[UIImage imageNamed:@"NavigationButtonBG"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(leftNavItemClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem* leftBarButton = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = leftBarButton;
    
    // 内容视图
    self.contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DEF_SCREEN_WIDTH, DEF_HEIGHT(self.view)-DEF_TAB_BAR_HEIGHT)];
    [self.view addSubview:self.contentView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
} 

#pragma mark - Public Methods
- (void)addSubview:(UIView *)view
{
    [self.contentView addSubview:view];
}

#pragma mark - 点击事件
- (void)leftNavItemClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
