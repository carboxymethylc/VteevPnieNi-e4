//
//  AppDelegate.m
//  VPNDemo
//
//  Created by  on 15/01/13.
//  Copyright (c) 2013 Andrew John. All rights reserved.
//

#import "AppDelegate.h"

#import "MasterViewController.h"
#import "SetUpViewConroller.h"
#import "PurchaseViewController.h"
#import "ContactViewController.h"


@implementation AppDelegate

static NSString* kAppId = @"401301426565681";
@synthesize facebook;

@synthesize share = share_;

static NSString * const kClientID =
@"322641601518.apps.googleusercontent.com";

+ (NSString *)clientID
{
    return kClientID;
}


@synthesize tabBarController;
- (void)dealloc
{
    [_window release];
    [_navigationController release];
    [tabBarController release];
     [share_ release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.

    MasterViewController *masterViewController = [[[MasterViewController alloc] initWithNibName:@"MasterViewController" bundle:nil] autorelease];
    
    
    SetUpViewConroller *setUpViewConroller = [[[SetUpViewConroller alloc] initWithNibName:@"SetUpViewConroller" bundle:nil] autorelease];

    
    
    
    UINavigationController*setUpNavigationController = [[[UINavigationController alloc] initWithRootViewController:setUpViewConroller] autorelease];
    
    PurchaseViewController*purchaseViewConroller = [[[PurchaseViewController alloc] initWithNibName:@"PurchaseViewController" bundle:nil] autorelease];
    
    UINavigationController*purchaseNavigationController = [[[UINavigationController alloc] initWithRootViewController:purchaseViewConroller] autorelease];
    
    
    ContactViewController*contactViewConroller = [[[ContactViewController alloc] initWithNibName:@"ContactViewController" bundle:nil] autorelease];

    UINavigationController*contactNavigationController = [[[UINavigationController alloc] initWithRootViewController:contactViewConroller] autorelease];
    
    self.tabBarController = [[[UITabBarController alloc] init] autorelease];
    
    self.navigationController = [[[UINavigationController alloc] initWithRootViewController:masterViewController] autorelease];
   
    self.tabBarController.viewControllers = [NSArray arrayWithObjects:self.navigationController,setUpNavigationController,purchaseNavigationController,contactNavigationController,nil];

    
    
    //Facebook
    // Initialize Facebook
    
    facebook = [[Facebook alloc] initWithAppId:kAppId andDelegate:contactViewConroller];
    
    // Check and retrieve authorization information
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([defaults objectForKey:@"FBAccessTokenKey"] && [defaults objectForKey:@"FBExpirationDateKey"])
    {
        facebook.accessToken = [defaults objectForKey:@"FBAccessTokenKey"];
        facebook.expirationDate = [defaults objectForKey:@"FBExpirationDateKey"];
    }
    
    
    if (!kAppId)
    {
        UIAlertView *alertView = [[UIAlertView alloc]
                                  initWithTitle:@"Setup Error"
                                  message:@"Missing app ID. You cannot run the app until you provide this in the code."
                                  delegate:self
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles:nil,
                                  nil];
        [alertView show];
        [alertView release];
    } else
    {
        // Now check that the URL scheme fb[app_id]://authorize is in the .plist and can
        // be opened, doing a simple check without local app id factored in here
        NSString *url = [NSString stringWithFormat:@"fb%@://authorize",kAppId];
        BOOL bSchemeInPlist = NO; // find out if the sceme is in the plist file.
        NSArray* aBundleURLTypes = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleURLTypes"];
        if ([aBundleURLTypes isKindOfClass:[NSArray class]] &&
            ([aBundleURLTypes count] > 0))
        {
            NSDictionary* aBundleURLTypes0 = [aBundleURLTypes objectAtIndex:0];
            if ([aBundleURLTypes0 isKindOfClass:[NSDictionary class]])
            {
                NSArray* aBundleURLSchemes = [aBundleURLTypes0 objectForKey:@"CFBundleURLSchemes"];
                if ([aBundleURLSchemes isKindOfClass:[NSArray class]] &&
                    ([aBundleURLSchemes count] > 0))
                {
                    NSString *scheme = [aBundleURLSchemes objectAtIndex:0];
                    if ([scheme isKindOfClass:[NSString class]] &&
                        [url hasPrefix:scheme])
                    {
                        bSchemeInPlist = YES;
                    }
                }
            }
        }
        // Check if the authorization callback will work
        BOOL bCanOpenUrl = [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString: url]];
        if (!bSchemeInPlist || !bCanOpenUrl) {
            UIAlertView *alertView = [[UIAlertView alloc]
                                      initWithTitle:@"Setup Error"
                                      message:@"Invalid or missing URL scheme. You cannot run the app until you set up a valid URL scheme in your .plist."
                                      delegate:self
                                      cancelButtonTitle:@"OK"
                                      otherButtonTitles:nil,
                                      nil];
            [alertView show];
            [alertView release];
        }
    }
    

    
    
    //self.window.rootViewController = self.navigationController;
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation
{
    // Handle Google+ share dialog URL.
    if ([share_ handleURL:url
        sourceApplication:sourceApplication
               annotation:annotation])
    {
        return YES;
    }
    return NO;
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

@end
