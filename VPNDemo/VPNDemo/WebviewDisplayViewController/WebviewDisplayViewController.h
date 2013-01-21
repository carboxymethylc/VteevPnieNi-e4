//
//  WebviewDisplayViewController.h
//  VPNDemo
//
//  Created by Chirag@Sunshine on 21/01/13.
//  Copyright (c) 2013 SunshineInfotech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebviewDisplayViewController : UIViewController<UIWebViewDelegate>
{
    NSString*load_url;
    NSString*navigation_title;
    
    IBOutlet UIWebView*webView;
    
}
@property(nonatomic,retain)NSString*load_url;
@property(nonatomic,retain) NSString*navigation_title;


@end
