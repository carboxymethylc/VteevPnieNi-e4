//
//  PurchaseViewController.m
//  VPNDemo
//
//  Created by  on 18/01/13.
//  Copyright (c) 2013 Andrew John. All rights reserved.
//

#import "ContactViewController.h"
#import <Twitter/Twitter.h>
#import "DETweetComposeViewController.h"
@interface ContactViewController ()

@end

@implementation ContactViewController

@synthesize contact_custom_cell,cellNib;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
         self.title = NSLocalizedString(@"Contact", @"Contact");
    }
    return self;
}

-(void)dealloc
{
    [super dealloc];
    [share_ release];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.titleView = navigation_view;
    
       permissions = [[NSArray alloc] initWithObjects:@"offline_access",@"offline_access", nil];
    appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
	// Do any additional setup after loading the view, typically from a nib.
    
    
    self.cellNib = [UINib nibWithNibName:@"ContactCustomCell" bundle:nil];
    
    
    share_ = [[GPPShare alloc] initWithClientID:@"322641601518.apps.googleusercontent.com"];
    share_.delegate = self;
    appDelegate.share = share_;
    
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    ContactCustomCell *cell = (ContactCustomCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    [self.cellNib instantiateWithOwner:self options:nil];
    cell = contact_custom_cell;
    self.contact_custom_cell = nil;
    
    
    
    cell.btn_fb.hidden = TRUE;
    cell.btn_twitter.hidden = TRUE;
    cell.btn_google_plus.hidden = TRUE;
    cell.service_detail_label.hidden = TRUE;

    switch (indexPath.row)
    {
        case 0:
        {
            cell.service_label.text = @"* Recomment to a friend";
            break;
        }
        case 1:
        {
            cell.service_label.hidden = TRUE;
            cell.btn_fb.hidden = FALSE;
            cell.btn_twitter.hidden = FALSE;
            cell.btn_google_plus.hidden = FALSE;
            
            cell.plan_imageView.hidden = TRUE;
            break;
        }
        case 2:
        {
            cell.service_label.text = @"** Rate us on App Store";
            break;
        }
        case 3:
        {
             cell.service_label.text = @"* Email Support Center";
            
            cell.service_detail_label.hidden = FALSE;
             cell.service_detail_label.text = @" If you can't find a solution to your                                       problems in our Setup section, you  can submit a  ticket by selecting the appropriate department";
            break;
        }
            
            
            
        default:
            break;
    }
    
    
   
    
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row==3)
    {
        return 120;
    }
    
    return 73.0;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}




- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"\n purchase view didSelectRowAtIndexPath = %d",indexPath.row);
    switch (indexPath.row)
    {
        case 0:
        {
            UIActionSheet*tell_friend_actionSheet = [[UIActionSheet alloc] initWithTitle:@"Tell a friend" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"E-Mail",@"SMS", nil];
            
            [tell_friend_actionSheet showFromTabBar:appDelegate.tabBarController.tabBar];
            break;
        }
        
            

            
        default:
            break;
    }
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex== 0)
    {
        [self ShowMailFunction];
       
        
        
    }
    else if(buttonIndex ==1)
    {
        MFMessageComposeViewController *controller = [[[MFMessageComposeViewController alloc] init] autorelease];
        if([MFMessageComposeViewController canSendText])
        {

            controller.messageComposeDelegate = self;
            controller.body = @"SMS message here";
            controller.recipients = [NSArray arrayWithObjects:@"", nil];

            [self.navigationController presentModalViewController:controller animated:YES];
        }
     
    }
}

#pragma mark MailOption

-(void)ShowMailFunction
{
    Class mailClass = (NSClassFromString(@"MFMailComposeViewController"));
	if (mailClass != nil)
	{
		// We must always check whether the current device is configured for sending emails
		if ([mailClass canSendMail])
		{
			controllerMail = [[MFMailComposeViewController alloc] init];
            controllerMail.mailComposeDelegate = self;
            [controllerMail setSubject:@"Messanger"];
            [controllerMail setMessageBody:@"Download messanger" isHTML:NO];
            
            
            [self.navigationController presentModalViewController:controllerMail animated:TRUE];
            
            
            [controllerMail release];
		}
		else
		{
			[self launchMailAppOnDevice];
		}
	}
	else
	{
		[self launchMailAppOnDevice];
	}
}

// Launches the Mail application on the device.
-(void)launchMailAppOnDevice
{
	NSString *recipients = @"mailto:?&subject=messanger";
	NSString *body = @"&body=Download messanger";
	
	NSString *email = [NSString stringWithFormat:@"%@%@", recipients, body];
	email = [email stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:email]];
}

- (void)mailComposeController:(MFMailComposeViewController*)mailController didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
    
    [self.navigationController dismissModalViewControllerAnimated:TRUE];
}


- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
    [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(dismissMessageController) userInfo:nil repeats:NO];
     
}

-(void)dismissMessageController
{
    [self dismissModalViewControllerAnimated:TRUE];
}

-(IBAction)share_button_clicked:(id)sender
{
    
    UIButton*temp_button = (UIButton*)sender;
    
    switch (temp_button.tag)
    {
        case 1001:
        {
            
            AppDelegate *delegateFB = (AppDelegate *)[[UIApplication sharedApplication] delegate];
            [delegateFB facebook].sessionDelegate = self;
            
            if (![[delegateFB facebook] isSessionValid])
            {
                [[delegateFB facebook] authorize:permissions];
            }
            else
            {
                
                [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(postPictureToFB) userInfo:nil repeats:NO];
                //[self postPictureToFB];
            }

            
            break;
        }
            
        case 1002:
        {
            
            DETweetComposeViewControllerCompletionHandler completionHandler = ^(DETweetComposeViewControllerResult result) {
                switch (result)
                {
                    case DETweetComposeViewControllerResultCancelled:
                        NSLog(@"Twitter Result: Cancelled");
                        break;
                    case DETweetComposeViewControllerResultDone:
                        NSLog(@"Twitter Result: Sent");
                        break;
                }
                [self dismissModalViewControllerAnimated:YES];
            };
            
            DETweetComposeViewController *tcvc = [[[DETweetComposeViewController alloc] init] autorelease];
            self.modalPresentationStyle = UIModalPresentationCurrentContext;
            [self addTweetContent:tcvc];
            tcvc.completionHandler = completionHandler;
            
            // Optionally, set alwaysUseDETwitterCredentials to YES to prevent using
            //  iOS5 Twitter credentials.
            //    tcvc.alwaysUseDETwitterCredentials = YES;
            [self presentModalViewController:tcvc animated:YES];
            
            break;
        }
        case 1003:
        {
            
            id<GPPShareBuilder> shareBuilder = [share_ shareDialog];
            
            NSString *inputText = @"Messanger";
            NSString *text = [inputText length] ? inputText : nil;
            if (text)
            {
                shareBuilder = [shareBuilder setPrefillText:text];
            }
            
            if (![shareBuilder open])
            {
               NSLog(@"Status: Error (see console).");
            }

            
            break;
            
        }
            
        default:
            break;
    }
    
   

}


#pragma mark - GPPShareDelegate

- (void)finishedSharing:(BOOL)shared
{
    NSString *text = shared ? @"Success" : @"Canceled";
    NSLog(@"\n text = %@",text);
}

-(void)postPictureToFB
{
    
    
    NSString*stringShare = @"Download messanger.Its super fast";
    
    AppDelegate* appDelegateFB=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                   stringShare, @"message",
                                   nil];
    //[imgae release];
    appDelegateFB=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    [[appDelegateFB facebook] requestWithGraphPath:@"me/feed"
                                         andParams:params
                                     andHttpMethod:@"POST"
                                       andDelegate:self];
    
}


/*Facebook Methods*/

- (void)login
{
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    if (![[delegate facebook] isSessionValid])
    {
        [[delegate facebook] authorize:permissions];
    }
    else
    {
        //[self showLoggedIn];
        
    }
}

//apiFQLIMe
- (void)apiFQLIMe
{
    
    NSLog(@"\n comes in apiFQLIMe");
    // Using the "pic" picture since this currently has a maximum width of 100 pixels
    // and since the minimum profile picture size is 180 pixels wide we should be able
    // to get a 100 pixel wide version of the profile picture
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                   @"SELECT uid, name, pic FROM user WHERE uid=me()", @"query",
                                   nil];
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [[delegate facebook] requestWithMethodName:@"fql.query"
                                     andParams:params
                                 andHttpMethod:@"POST"
                                   andDelegate:self];
    
    
}


#pragma mark - FBRequestDelegate Methods
/**
 * Called when the Facebook API request has returned a response.
 *
 * This callback gives you access to the raw response. It's called before
 * (void)request:(FBRequest *)request didLoad:(id)result,
 * which is passed the parsed response object.
 */
- (void)request:(FBRequest *)request didReceiveResponse:(NSURLResponse *)response
{
    //NSLog(@"received response");
}

/**
 * Called when a request returns and its response has been parsed into
 * an object.
 *
 * The resulting object may be a dictionary, an array or a string, depending
 * on the format of the API response. If you need access to the raw response,
 * use:
 *
 * (void)request:(FBRequest *)request
 *      didReceiveResponse:(NSURLResponse *)response
 */
- (void)request:(FBRequest *)request didLoad:(id)result
{
    
    NSLog(@"esutl = %@",result);
    

      UIAlertView*FBAlertView = [[UIAlertView alloc] initWithTitle:@"Success" message:@"Message shared successfully" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [FBAlertView show];
        [FBAlertView release];

    
}

/**
 * Called when an error prevents the Facebook API request from completing
 * successfully.
 */
- (void)request:(FBRequest *)request didFailWithError:(NSError *)error1
{
    
    [self.view setUserInteractionEnabled:TRUE];
    
    
    NSLog(@"Err message: comes here.. %@", [[error1 userInfo] objectForKey:@"error_msg"]);
    NSLog(@"Err code: comes here.. %d", [error1 code]);
}

#pragma mark - FBSessionDelegate Methods
/**
 * Called when the user has logged in successfully.
 */
- (void)fbDidLogin
{
    //[self showLoggedIn];
    
    //loging..show request friend.
    
    
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [self storeAuthData:[[delegate facebook] accessToken] expiresAt:[[delegate facebook] expirationDate]];
    [self.view setUserInteractionEnabled:FALSE];
    
    [self postPictureToFB];
    
    /*
    [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(apiFQLIMe) userInfo:nil repeats:FALSE];
     */
    
}

-(void)fbDidExtendToken:(NSString *)accessToken expiresAt:(NSDate *)expiresAt
{
    NSLog(@"token extended");
    [self storeAuthData:accessToken expiresAt:expiresAt];
}

/**
 * Called when the user canceled the authorization dialog.
 */
-(void)fbDidNotLogin:(BOOL)cancelled
{
    
}

/**
 * Called when the request logout has succeeded.
 */
- (void)fbDidLogout
{
    // Remove saved authorization information if it exists and it is
    // ok to clear it (logout, session invalid, app unauthorized)
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:@"FBAccessTokenKey"];
    [defaults removeObjectForKey:@"FBExpirationDateKey"];
    [defaults synchronize];
}

/**
 * Called when the session has expired.
 */
- (void)fbSessionInvalidated {
    UIAlertView *alertView = [[UIAlertView alloc]
                              initWithTitle:@"Auth Exception"
                              message:@"Your session has expired."
                              delegate:nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil,
                              nil];
    [alertView show];
    [alertView release];
    [self fbDidLogout];
}



#pragma mark - storeAuthData Methods
- (void)storeAuthData:(NSString *)accessToken expiresAt:(NSDate *)expiresAt
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:accessToken forKey:@"FBAccessTokenKey"];
    [defaults setObject:expiresAt forKey:@"FBExpirationDateKey"];
    [defaults synchronize];
}




- (void)addTweetContent:(id)tcvc
{
    
    /*
     [tcvc addImage:[UIImage imageNamed:@"YawkeyBusinessDog.jpg"]];
     [tcvc addImage:[UIImage imageNamed:@"YawkeyCleanTeeth.jpg"]];  // This one won't actually work. Only one image per tweet allowed currently by Twitter.
     [tcvc addURL:[NSURL URLWithString:@"http://www.DoubleEncore.com/"]];
     [tcvc addURL:[NSURL URLWithString:@"http://www.apple.com/ios/features.html#twitter"]];
     [tcvc addURL:[NSURL URLWithString:@"http://www.twitter.com/"]];  // This won't work either. Only three URLs allowed, just like Apple's implementation.
     
     */
    NSString *tweetText = @"test";
    [tcvc setInitialText:tweetText];
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
