//
//  AppDelegate.m
//  happypy
//
//  Created by nnandzc on 15/10/26.
//  Copyright (c) 2015年 nnandzc. All rights reserved.
//

#import "AppDelegate.h"
#import <ShareSDK/ShareSDK.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [ShareSDK registerApp:@"happypy"
          activePlatforms:@[@(SSDKPlatformTypeSinaWeibo)]
                 onImport:nil
          onConfiguration:^(SSDKPlatformType platformType, NSMutableDictionary *appInfo) {
              
              switch (platformType)
              {
                  case SSDKPlatformTypeSinaWeibo:
                      //设置新浪微博应用信息,其中authType设置为使用SSO＋Web形式授权，回调地址暂随意添一个
                      [appInfo SSDKSetupSinaWeiboByAppKey:@"2017096360"
                                                appSecret:@"53c864b2b9a02a13c2eec81bfa78fcd1"
                                              redirectUri:@"http://www.mobiletrain.org"
                                                 authType:SSDKAuthTypeWeb];
                      break;
                  default:
                      break;
              }
          }];
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
}

@end
