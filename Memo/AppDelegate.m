//
//  AppDelegate.m
//  Memo
//
//  Created by jasonwu on 4/22/16.
//  Copyright © 2016 jasonwu. All rights reserved.
//

#import "AppDelegate.h"
#import "JWHomeViewContronller.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //设置rootViewController为NavigationViewController,
    //同时，NavigationViewController的rootViewController是homeViewController.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.homeViewController = [[JWHomeViewContronller alloc] init];
    self.navViewController = [[UINavigationController alloc] initWithRootViewController:self.homeViewController];
    self.window.rootViewController = self.navViewController;
    
    //获取持久化文件的绝对路径，读取和存储都用这个路径
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *plistPath = [paths objectAtIndex:0];
    self.homeViewController.dataFileName = [plistPath stringByAppendingPathComponent:@"MemoInfo.plist"];
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  //  NSLog(@"app will terminate");
    [self.homeViewController storeDataToFile];
    
}

@end
