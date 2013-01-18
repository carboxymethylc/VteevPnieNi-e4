//
//  PurchaseViewController.h
//  VPNDemo
//
//  Created by Chirag@Sunshine on 18/01/13.
//  Copyright (c) 2013 SunshineInfotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Purchase_Custom_Cell/PurchaseCustomCell.h"
@interface PurchaseViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    PurchaseCustomCell*purchase_custom_cell;
    UINib *cellNib;
    IBOutlet UITableView*purchase_type_tableView;
    
    
    NSMutableArray*image_array;
    NSMutableArray*service_array;
    NSMutableArray*sub_service_array;
}

@property (nonatomic, retain) IBOutlet PurchaseCustomCell*purchase_custom_cell;
@property (nonatomic, retain) UINib *cellNib;

@end