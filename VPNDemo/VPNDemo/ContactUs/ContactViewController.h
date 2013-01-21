//
//  PurchaseViewController.h
//  VPNDemo
//
//  Created by  on 18/01/13.
//  Copyright (c) 2013 Andrew John. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contact_Custom_Cell/ContactCustomCell.h"
#import "AppDelegate.h"
#import "FBConnect.h"
#import <MessageUI/MFMailComposeViewController.h>
#import <MessageUI/MFMessageComposeViewController.h>

@interface ContactViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,
FBRequestDelegate,FBDialogDelegate,FBSessionDelegate,UIActionSheetDelegate,MFMailComposeViewControllerDelegate,MFMessageComposeViewControllerDelegate
>
{
    
    ContactCustomCell*contact_custom_cell;
    UINib *cellNib;
    IBOutlet UITableView*contact_tableView;
    
    
   
    
    IBOutlet UIView*navigation_view;
    
    NSArray *permissions;
    AppDelegate * appDelegate;

    MFMailComposeViewController *controllerMail;
}

@property (nonatomic, retain) IBOutlet ContactCustomCell*contact_custom_cell;
@property (nonatomic, retain) UINib *cellNib;






-(IBAction)share_button_clicked:(id)sender;
- (void)addTweetContent:(id)tcvc;
-(void)postPictureToFB;


@end
