//
//  HomeViewController.m
//  BlueMobiProject
//
//  Created by lastt on 14/11/4.
//  Copyright (c) 2014年 朱 亮亮. All rights reserved.
//

#import "HomeViewController.h"
#import "RESideMenu.h"
#import "BMNetworkHandler.h"
@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _initNavBtn];

    
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [[BMNetworkHandler sharedInstance]conURL:@"http://api.k780.com:88/?app=weather.today&weaid=1&appkey=10003&sign=b59bc3ef6191eb9f747dd4e83c99f2a4&format=json" networkType:NetWorkGET params:nil delegate:nil showHUD:NO successBlock:^(id returnData) {
        NSLog(@"%@",returnData);
    } failureBlock:^(NSError *error) {
        
    }];
}
//初始化navBtn
-(void)_initNavBtn{
    //按钮
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectZero];
    [btn setImage:[UIImage imageNamed:@"menu.png"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"menu_select.png"] forState:UIControlStateSelected];
    [btn addTarget:self action:@selector(menuClick) forControlEvents:UIControlEventTouchUpInside];
    
    //添加的到nav上
    UIBarButtonItem *leftBtnItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationController.navigationItem.leftBarButtonItem = leftBtnItem;
}

#pragma mark - Click 
-(void)menuClick{
    [self.sideMenuViewController presentLeftMenuViewController];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
