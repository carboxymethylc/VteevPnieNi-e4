//
//  SetUpViewConroller.h
//  VPNDemo
//
//  Created by LD.Chirag on 1/15/13.
//  Copyright (c) 2013 SunshineInfotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SetupCustomeCell/SetupCustomCell.h"

@interface SetUpViewConroller : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    IBOutlet  UITableView*setup_tableView;
    IBOutlet SetupCustomCell*setup_custom_cell;
    UINib *cellNib;
    
    NSMutableArray*image_array;
    NSMutableArray*service_array;
    NSMutableArray*sub_service_array;

    

}

@property (nonatomic, retain) IBOutlet SetupCustomCell*setup_custom_cell;
@property (nonatomic, retain) UINib *cellNib;

@end
