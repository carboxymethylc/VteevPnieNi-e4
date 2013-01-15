//
//  MasterViewController.h
//  VPNDemo
//
//  Created by Chirag@Sunshine on 15/01/13.
//  Copyright (c) 2013 SunshineInfotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Home_Custom_Cell/HomeCustomCell.h"
@class DetailViewController;

@interface MasterViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    HomeCustomCell*home_custom_cell;
    UINib *cellNib;
    IBOutlet UITableView*service_type_tableView;
    

       NSMutableArray*image_array;
    NSMutableArray*service_array;
    NSMutableArray*sub_service_array;
    
}

@property (strong, nonatomic) DetailViewController *detailViewController;
@property (nonatomic, retain) IBOutlet HomeCustomCell*home_custom_cell;
@property (nonatomic, retain) UINib *cellNib;

@end
