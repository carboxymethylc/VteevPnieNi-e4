//
//  WebviewDisplayViewController.m
//  VPNDemo
//
//  Created by Chirag@Sunshine on 21/01/13.
//  Copyright (c) 2013 SunshineInfotech. All rights reserved.
//

#import "WebviewDisplayViewController.h"

@interface WebviewDisplayViewController ()

@end

@implementation WebviewDisplayViewController
@synthesize load_url;
@synthesize navigation_title;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
        load_url = [[NSString alloc] init];
        navigation_title = [[NSString alloc] init];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
     // Do any additional setup after loading the view from its nib.

    NSString *urlAddress = load_url;

    NSURL *url = [NSURL URLWithString:urlAddress];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [webView loadRequest:requestObj];
    
    
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    return TRUE;
}
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    
}


-(void)dealloc
{
    [load_url release];
    [navigation_title release];
}
@end
