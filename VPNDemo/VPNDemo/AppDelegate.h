//
//  AppDelegate.h
//  VPNDemo
//
//  Created by  on 15/01/13.
//  Copyright (c) 2013 Andrew John. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FBConnect.h"
@class GPPShare;
@interface AppDelegate : UIResponder <UIApplicationDelegate,UITabBarControllerDelegate>
{
    Facebook *facebook;
}
@property (nonatomic, retain) Facebook *facebook;
@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UINavigationController *navigationController;
@property (strong, nonatomic) UITabBarController *tabBarController;

// The Google+ share object to handle the URL redirect.
@property (retain, nonatomic) GPPShare *share;


@end
