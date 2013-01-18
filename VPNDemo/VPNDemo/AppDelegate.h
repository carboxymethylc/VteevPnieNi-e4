//
//  AppDelegate.h
//  VPNDemo
//
//  Created by Chirag@Sunshine on 15/01/13.
//  Copyright (c) 2013 SunshineInfotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FBConnect.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate,UITabBarControllerDelegate>
{
    Facebook *facebook;
}
@property (nonatomic, retain) Facebook *facebook;
@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UINavigationController *navigationController;
@property (strong, nonatomic) UITabBarController *tabBarController;
@end
