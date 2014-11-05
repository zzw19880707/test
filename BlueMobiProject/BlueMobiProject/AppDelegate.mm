//
//  AppDelegate.m
//  BlueMobiProject
//
//  Created by 朱 亮亮 on 14-4-28.
//  Copyright (c) 2014年 朱 亮亮. All rights reserved.
//

#import "AppDelegate.h"
#import "GuideView.h"
#import <ShareSDK/ShareSDK.h>
#import "WXApi.h"
#import <TencentOpenAPI/QQApiInterface.h>
#import <TencentOpenAPI/TencentOAuth.h>
#import "APNSHandler.h"
//#import "AlipayHandler.h"

//#import "ZbarTestViewController.h"
//#import "AlipayTestViewController.h"
#import "ShareSDKTestViewController.h"
#import "ShareSDKHandler.h"
#import "User.h"
#import "BMSocketHandler.h"

/**
 *  第三方启动分类
 */
@interface AppDelegate (ThirdPartyInit) <WXApiDelegate>

/**
 *  初始化百度地图
 */
- (void)initializeBaiduMap;

/**
 *  初始化ShareSDK
 */
- (void)initializeShareSDK;

/**
 *  监听用户信息变更通知
 *
 *  @param notification 通知对象
 */
- (void)userInfoUpdateHandler:(NSNotification *)notification;

@end

#pragma mark - 

/**
 *  百度地图Manager
 */
//BMKMapManager* _mapManager;

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // 第三方初始化
    [self initializeBaiduMap];
    [self initializeShareSDK];
    
    // 远程推送通知初始化
    [APNSHandler registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert) application:application didFinishLaunchingWithOptions:launchOptions];

//    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    self.window.backgroundColor = [UIColor whiteColor];
//    [self.window makeKeyAndVisible];
    
    // 请根据实际情况替换以下ViewController
//    MapTestViewController *controller1=[[MapTestViewController alloc] init];
//    controller1.view.backgroundColor = [UIColor redColor];
//    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:controller1];

//    BMBaseViewController *controller2=[[BMBaseViewController alloc] init];
//    controller2.view.backgroundColor = [UIColor yellowColor];
//    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:controller2];
//
//    BMBaseViewController *controller3=[[BMBaseViewController alloc] init];
//    controller3.view.backgroundColor = [UIColor greenColor];
//    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:controller3];
//
//    BMBaseViewController *controller4=[[BMBaseViewController alloc] init];
//    controller4.view.backgroundColor = [UIColor blueColor];
//    UINavigationController *nav4 = [[UINavigationController alloc] initWithRootViewController:controller4];
//
//    BMBaseViewController *controller5=[[BMBaseViewController alloc] init];
//    controller5.view.backgroundColor = [UIColor purpleColor];
//    UINavigationController *nav5 = [[UINavigationController alloc] initWithRootViewController:controller5];
//
//    NSArray *controllers=[[NSArray alloc] initWithObjects: nav2, nav3, nav4, nav5, nil];
//    
//    self.tabBarController = [[UITabBarController alloc] init];
//    self.tabBarContr	oller.delegate = self;
//    self.tabBarController.viewControllers=controllers;
//    
//    self.window.rootViewController = self.tabBarController;
//    
//    // 底部导航栏
//    TabBarView *tabBar = [[TabBarView alloc] initWithFrame:CGRectMake(0, DEF_HEIGHT(self.window)-DEF_TAB_BAR_HEIGHT, DEF_SCREEN_WIDTH, DEF_TAB_BAR_HEIGHT)];
//    tabBar.delegate = self;
//    [self.window addSubview:tabBar];
    
    // ************** 测试代码区 **************
//    self.window.rootViewController = [[MapTestViewController alloc] init];
//    [User checkIfLogin:YES];
//    [[BMSocketHandler sharedInstance] connect];
    // ************** 测试代码区 **************

    // 引导页
    if (![DEF_PERSISTENT_GET_OBJECT(@"showGuide") boolValue]) 
    {
        DEF_PERSISTENT_SET_OBJECT([NSNumber numberWithBool:YES], @"showGuide");
        GuideView *guide = [[GuideView alloc] initWithFrame:self.window.bounds];
        [self.window addSubview:guide];
    }
        
    // 是否由远程推送推送进入app
    if ([launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey]) 
    {
        [[APNSHandler shareInstance] handleWithRemoteNotification:[launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey]];
    }
            
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    // 注册成功后，将会生成一个去掉了空格、<>等特殊字符去掉的新deviceToken，并被永久存储，请使用DEF_DEVICE_TOKEN来获取来调用
    [APNSHandler registerDeviceToken:deviceToken];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    [[APNSHandler shareInstance] handleWithRemoteNotification:userInfo];
}

#pragma mark - TabBarViewDelegate
- (void)tabBarView:(TabBarView *)tabBarView didSelectAtIndex:(int)index
{
    if (self.tabBarController.selectedIndex != index) 
    {
        [self.tabBarController.selectedViewController.navigationController popToRootViewControllerAnimated:NO];
        self.tabBarController.selectedIndex = index;
    }
}

@end

#pragma mark - 

@implementation AppDelegate (ThirdPartyInit)

- (void)initializeBaiduMap
{
	// 要使用百度地图，请先启动BaiduMapManager
//	_mapManager = [[BMKMapManager alloc]init];
//	BOOL ret = [_mapManager start:@"YNTYzUtC0Q04PF0XTiwR9ifH" generalDelegate:nil];
//	if (!ret)
//    {
//		NSLog(@"manager start failed!");
//	}
}

- (void)initializeShareSDK
{
    [ShareSDK registerApp:@"126a941aaa0"];
    
    // 添加新浪微博应用
    [ShareSDK connectSinaWeiboWithAppKey:@"1196882570"
                               appSecret:@"ce35eb721d2feaa43f15fce74d717d07"
                             redirectUri:@"http://www.huatuoyf.com"];
    
    // 添加腾讯微博应用
    [ShareSDK connectTencentWeiboWithAppKey:@"801490396"
                                  appSecret:@"f0cca22cf3b377bf05267c6b8478008d"
                                redirectUri:@"http://www.huatuoyf.com/"];
    
    // 添加QQ空间应用
    [ShareSDK connectQZoneWithAppKey:@"101051947"
                           appSecret:@"43ee5d3258e0cfe3fdfb20de8d3c9e33"
                   qqApiInterfaceCls:[QQApiInterface class]
                     tencentOAuthCls:[TencentOAuth class]];
    
    [ShareSDK connectQQWithQZoneAppKey:@"101051947"
                     qqApiInterfaceCls:[QQApiInterface class]
                       tencentOAuthCls:[TencentOAuth class]];
    
    // 添加微信应用
    [ShareSDK connectWeChatWithAppId:@"wx3d2f83dee4fbb977"        //此参数为申请的微信AppID
                           wechatCls:[WXApi class]];
    
    //监听用户信息变更
    [ShareSDK addNotificationWithName:SSN_USER_INFO_UPDATE
                               target:self
                               action:@selector(userInfoUpdateHandler:)];
}

#pragma mark - 通知
- (void)userInfoUpdateHandler:(NSNotification *)notification
{
    NSMutableArray *authList = [NSMutableArray arrayWithContentsOfFile:[NSString stringWithFormat:@"%@/authListCache.plist",NSTemporaryDirectory()]];
    if (authList == nil)
    {
        authList = [NSMutableArray array];
    }
    
    NSString *platName = nil;
    NSInteger plat = [[[notification userInfo] objectForKey:SSK_PLAT] integerValue];
    switch (plat)
    {
        case ShareTypeSinaWeibo:
            platName = @"新浪微博";
            break;
        case ShareType163Weibo:
            platName = @"网易微博";
            break;
        case ShareTypeDouBan:
            platName = @"豆瓣";
            break;
        case ShareTypeFacebook:
            platName = @"Facebook";
            break;
        case ShareTypeKaixin:
            platName = @"开心网";
            break;
        case ShareTypeQQSpace:
            platName = @"QQ空间";
            break;
        case ShareTypeRenren:
            platName = @"人人网";
            break;
        case ShareTypeSohuWeibo:
            platName = @"搜狐微博";
            break;
        case ShareTypeTencentWeibo:
            platName = @"腾讯微博";
            break;
        case ShareTypeTwitter:
            platName = @"Twitter";
            break;
        case ShareTypeInstapaper:
            platName = @"Instapaper";
            break;
        case ShareTypeYouDaoNote:
            platName = @"有道云笔记";
            break;
        case ShareTypeLinkedIn:
            platName = @"LinkedIn";
            break;
        default:
            platName = @"未知";
    }
    
    id<ISSPlatformUser> userInfo = [[notification userInfo] objectForKey:SSK_USER_INFO];

    BOOL hasExists = NO;
    for (int i = 0; i < [authList count]; i++)
    {
        NSMutableDictionary *item = [authList objectAtIndex:i];
        ShareType type = (ShareType)[[item objectForKey:@"type"] integerValue];
        if (type == plat)
        {
            [item setObject:[userInfo nickname] forKey:@"username"];
            hasExists = YES;
            break;
        }
    }
    
    if (!hasExists)
    {
        NSDictionary *newItem = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                 platName,
                                 @"title",
                                 [NSNumber numberWithInteger:plat],
                                 @"type",
                                 [userInfo nickname],
                                 @"username",
                                 nil];
        [authList addObject:newItem];
    }
    
    [authList writeToFile:[NSString stringWithFormat:@"%@/authListCache.plist",NSTemporaryDirectory()] atomically:YES];
}

#pragma mark - WXApiDelegate
-(void)onReq:(BaseReq*)req
{
    
}

-(void)onResp:(BaseResp*)resp
{
    
}

#pragma mark - UIApplicationDelegate
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
//    if([[url scheme] caseInsensitiveCompare:AlipaySchemeType] == NSOrderedSame)
//    {
//        DEF_DEBUG(@"支付宝外部调用回调成功");
//        [[AlipayHandler shareInstance] parse:url application:application];
//        return YES;
//    } 
//    else 
//    {
        return  [ShareSDK handleOpenURL: url wxDelegate: self];
//    }
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
//    if([[url scheme] caseInsensitiveCompare:AlipaySchemeType] == NSOrderedSame) 
//    {
//        DEF_DEBUG(@"支付宝外部调用回调成功");
//        [[AlipayHandler shareInstance] parse:url application:application];
//        return YES;
//    } 
//    else 
//    {
        return [ShareSDK handleOpenURL:url
                     sourceApplication:sourceApplication
                            annotation:annotation
                            wxDelegate:self];
//    }
}

@end
