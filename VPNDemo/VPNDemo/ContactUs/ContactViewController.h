//
//  PurchaseViewController.h
//  VPNDemo
//
//  Created by Chirag@Sunshine on 18/01/13.
//  Copyright (c) 2013 SunshineInfotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contact_Custom_Cell/ContactCustomCell.h"
#import "AppDelegate.h"
#import "FBConnect.h"

@interface ContactViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,
FBRequestDelegate,FBDialogDelegate,FBSessionDelegate
>
{
    
    ContactCustomCell*contact_custom_cell;
    UINib *cellNib;
    IBOutlet UITableView*contact_tableView;
    
    
    NSMutableArray*image_array;
    NSMutableArray*service_array;
    NSMutableArray*sub_service_array;
}

@property (nonatomic, retain) IBOutlet ContactCustomCell*contact_custom_cell;
@property (nonatomic, retain) UINib *cellNib;

-(IBAction)share_button_clicked:(id)sender;
- (void)addTweetContent:(id)tcvc;
@end
