//
//  AppDelegate.m
//  Waether2
//
//  Created by Dmitry on 02.01.17.
//  Copyright © 2017 Dmitry. All rights reserved.
//

#import "AppDelegate.h"
#import "Backendless.h"

#define APP_ID @"71CA595C-7C22-8DEF-FF14-6E7C0ECF6400"
#define SECRET_KEY @"095F40BF-8759-BC7C-FFF9-EAACB58B8E00"
#define VERSION_NUM @"v1"

@interface AppDelegate ()

@end

@implementation AppDelegate


/*- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}
*/

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

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [backendless initApp:APP_ID secret:SECRET_KEY version:VERSION_NUM];
    
    // If you plan to use Backendless Media Service, uncomment the following line (iOS ONLY!)
    // backendless.mediaService = [MediaService new];
    return YES;
}





@end
