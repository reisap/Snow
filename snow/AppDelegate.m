//
//  AppDelegate.m
//  snow
//
//  Created by reisa prasaptaraya on 5/2/16.
//  Copyright © 2016 reisa prasaptaraya. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "Search.h"
#import "Record.h"
#import "Video.h"
#import "Profile.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [MagicalRecord setupCoreDataStack];
     [NSThread sleepForTimeInterval:3];
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    [self.window makeKeyAndVisible];
    
    NSString * storyboardName = @"Main";
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle: nil];
    ViewController * vc1 = [storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
   
    vc1.view.backgroundColor = [UIColor whiteColor];
    //vc1.tabBarItem.badgeValue = @"99+";
   // vc1.title = @"Home";
    UIImageView* imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 10,30.0, 30.0)];
    imgView.image = [UIImage imageNamed:@"circle-menu.png"];
    [imgView setContentMode:UIViewContentModeScaleAspectFit];
   
    //[vc1.tabBarItem setImage:[imgView.image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    vc1.tabBarItem.image = [self imageWithImage:imgView.image scaledToSize:CGSizeMake(25, 25)];
    //vc1.tabBarItem.selectedImage = imgView.image;
    
    
    Search * vc2 = [storyboard instantiateViewControllerWithIdentifier:@"Search"];
    vc2.view.backgroundColor = [UIColor whiteColor];
    UIImageView* imgView2x = [[UIImageView alloc] initWithFrame:CGRectMake(0, 10,30.0, 30.0)];
    imgView2x.image = [UIImage imageNamed:@"tool.png"];
    [imgView2x setContentMode:UIViewContentModeScaleAspectFit];
    
    //[vc1.tabBarItem setImage:[imgView.image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    vc2.tabBarItem.image = [self imageWithImage:imgView2x.image scaledToSize:CGSizeMake(30, 30)];
   // vc2.tabBarItem.badgeValue = @"99+";
    //vc2.title = @"Search";
    //vc2.tabBarItem.image = [UIImage imageNamed:@"tabbar_profile"];
    //vc2.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_profile_selected"];
    
    Record *vc3 = [storyboard instantiateViewControllerWithIdentifier:@"Record"];
    vc3.view.backgroundColor = [UIColor blackColor];
//    vc3.tabBarItem.badgeValue = @"99+";
//    vc3.title = @"Video";
//    vc3.tabBarItem.image = [UIImage imageNamed:@"tabbar_profile"];
//    vc3.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_profile_selected"];

    UIImageView* imgView3x = [[UIImageView alloc] initWithFrame:CGRectMake(0, 10,30.0, 30.0)];
    imgView3x.image = [UIImage imageNamed:@"video-camera.png"];
    [imgView3x setContentMode:UIViewContentModeScaleAspectFit];
    
    //[vc1.tabBarItem setImage:[imgView.image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    vc3.tabBarItem.image = [self imageWithImage:imgView3x.image scaledToSize:CGSizeMake(30, 30)];
    
    Video *vc4 = [storyboard instantiateViewControllerWithIdentifier:@"Video"];
    vc4.view.backgroundColor = [UIColor orangeColor];
    //vc4.tabBarItem.badgeValue = @"99+";
    //vc4.title = @"Profile";
    //vc4.tabBarItem.image = [UIImage imageNamed:@"tabbar_profile"];
    //vc4.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_profile_selected"];
    UIImageView* imgView4x = [[UIImageView alloc] initWithFrame:CGRectMake(0, 10,30.0, 30.0)];
    imgView4x.image = [UIImage imageNamed:@"play-button.png"];
    [imgView4x setContentMode:UIViewContentModeScaleAspectFit];
     vc4.tabBarItem.image = [self imageWithImage:imgView4x.image scaledToSize:CGSizeMake(30, 30)];
    
    
    Profile *vc5 = [storyboard instantiateViewControllerWithIdentifier:@"Profile"];
    vc5.view.backgroundColor = [UIColor orangeColor];
//    vc5.tabBarItem.badgeValue = @"99+";
//    vc5.title = @"Profile";
//    vc5.tabBarItem.image = [UIImage imageNamed:@"tabbar_profile"];
//    vc5.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_profile_selected"];
    UIImageView* imgView5x = [[UIImageView alloc] initWithFrame:CGRectMake(0, 10,30.0, 30.0)];
    imgView5x.image = [UIImage imageNamed:@"tourist.png"];
    [imgView5x setContentMode:UIViewContentModeScaleAspectFit];
    vc5.tabBarItem.image = [self imageWithImage:imgView5x.image scaledToSize:CGSizeMake(30, 30)];
    
    
    UINavigationController *navC1 = [[UINavigationController alloc] initWithRootViewController:vc1];
    UINavigationController *navC2 = [[UINavigationController alloc] initWithRootViewController:vc2];
    UINavigationController *navC3 = [[UINavigationController alloc] initWithRootViewController:vc3];
    UINavigationController *navC4 = [[UINavigationController alloc] initWithRootViewController:vc4];
    UINavigationController *navC5 = [[UINavigationController alloc] initWithRootViewController:vc5];
    
    
    navC1.navigationBar.barTintColor = [UIColor colorWithRed:133/255.0 green:61/255.0 blue:174/255.0 alpha:1.0];
    navC1.navigationBar.translucent = NO;
    UIImageView* imgView2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 64, 64)];
    imgView2.image = [UIImage imageNamed:@"silhouette.png"];
    [imgView2 setContentMode:UIViewContentModeScaleAspectFit];
    
    navC1.navigationItem.titleView = imgView;
    
    
    navC2.navigationBar.barTintColor = [UIColor colorWithRed:133/255.0 green:61/255.0 blue:174/255.0 alpha:1.0];
    navC2.navigationBar.translucent = NO;
    UIImageView* imgView3 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 64, 64)];
    imgView3.image = [UIImage imageNamed:@"tool.png"];
    [imgView3 setContentMode:UIViewContentModeScaleAspectFit];
    
    navC2.navigationItem.titleView = imgView;
//    navC1.navigationController.navigationBar.topItem.title = @"Tagihan";
//    navC1.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:119.0/255.0 green:179.0/255.0 blue:212.0/255.0 alpha:1];
//    navC1.navigationController.navigationBar.tintColor = [UIColor whiteColor];
//    [navC1.navigationController.navigationBar
//     setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
//    navC1.navigationController.navigationBar.translucent = NO;
    
    
    LCTabBarController *tabBarC = [[LCTabBarController alloc] init];
    tabBarC.view.backgroundColor = [UIColor colorWithRed:133/255.0 green:61/255.0 blue:174/255.0 alpha:1.0];
    [[UITabBar appearance] setTintColor:[UIColor colorWithRed:133/255.0 green:61/255.0 blue:174/255.0 alpha:1.0]];
    [[UITabBar appearance] setBarTintColor:[UIColor colorWithRed:133/255.0 green:61/255.0 blue:174/255.0 alpha:1.0]];
    int offset = 7;
    UIEdgeInsets imageInset = UIEdgeInsetsMake(offset, 0, -offset, 0);
    tabBarC.tabBarItem.imageInsets = imageInset;
  
    //tabBarC.itemTitleFont          = [UIFont boldSystemFontOfSize:11.0f];
    //tabBarC.itemTitleColor         = [UIColor greenColor];
    //tabBarC.selectedItemTitleColor = [UIColor redColor];
    //tabBarC.itemImageRatio         = 0.5f;
    //tabBarC.badgeTitleFont         = [UIFont boldSystemFontOfSize:12.0f];
   
    
    
    tabBarC.viewControllers = @[navC1, navC2, navC3, navC4,navC5];
    
    self.window.rootViewController = tabBarC;
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
