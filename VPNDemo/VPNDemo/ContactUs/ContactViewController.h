//
//  PurchaseViewController.h
//  VPNDemo
//
//  Created by Chirag@Sunshine on 18/01/13.
//  Copyright (c) 2013 SunshineInfotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contact_Custom_Cell/ContactCustomCell.h"
@interface ContactViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
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

@end
