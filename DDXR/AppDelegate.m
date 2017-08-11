/*********************************************************************
 *           Copyright © 2017年 NightElf. All rights reserved.
 *                  Date                Name
 *                 17/2/4             Ruancanghui
 **********************************************************************
 * @文件名称: AppDelegate.m
 * @文件描述: 启动页
 * @补充说明: 无
 *********************************************************************/

#import "AppDelegate.h"
#import "DDHomePageViewController.h"
#import "DDSearchViewController.h"
#import "DDNoticeViewController.h"
#import "DDLoginViewController.h"
#import "YTKNetworkConfig.h"

#import "DDLoginRXViewController.h"

#if DEBUG
#import "FBMemoryProfiler.h"
#import "FBRetainCycleDetector.h"
#import "CacheCleanerPlugin.h"
#import "RetainCycleLoggerPlugin.h"
#endif

@interface AppDelegate ()
{
#if DEBUG
    FBMemoryProfiler *memoryProfiler;
#endif
}
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
#if DEBUG
    NSArray *filters = @[FBFilterBlockWithObjectIvarRelation([UIView class], @"_subviewCache"),
                         FBFilterBlockWithObjectIvarRelation([UIPanGestureRecognizer class], @"_internalActiveTouches")];
    
    FBObjectGraphConfiguration *configuration =
    [[FBObjectGraphConfiguration alloc] initWithFilterBlocks:filters
                                         shouldInspectTimers:NO];
    
    memoryProfiler = [[FBMemoryProfiler alloc] initWithPlugins:@[[CacheCleanerPlugin new],
                                                                 [RetainCycleLoggerPlugin new]]
                              retainCycleDetectorConfiguration:configuration];
    [memoryProfiler enable];
#endif
 
    
    
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    UIColor *navColor = [UIColor colorWithRed:1 / 255.0 green:128 / 255.0 blue:72/255.0 alpha:1.0f];
    [[UINavigationBar appearance] setBarTintColor:navColor];
    
    
    //测试网络方案一
    //DDHomePageViewController *vc = [[DDHomePageViewController alloc] init];
    //测试网络方案二(ytk网络)
    //网络方案二使用方式
    //设置统一的服务器接口，可通过如下的baseUrl 进行设置（也可不同过详见下文）如不需要，可忽略
    YTKNetworkConfig *config = [YTKNetworkConfig sharedConfig];
    config.baseUrl = @"http://apis.juhe.cn";
    
    //DDSearchViewController *vc = [[DDSearchViewController alloc] init];
    //DDNoticeViewController *vc = [[DDNoticeViewController alloc] init];
    DDLoginRXViewController *vc = [[DDLoginRXViewController alloc] init];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
