//
//  SetupCustomCell.h
//  VPNDemo
//
//  Created by LD.Chirag on 1/15/13.
//  Copyright (c) 2013 Andrew John. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SetupCustomCell : UITableViewCell
{

    IBOutlet UILabel*service_label;
    IBOutlet UILabel*sub_service_label;
    IBOutlet UIImageView*plan_imageView;
 
}
@property(nonatomic,retain)   IBOutlet UILabel*service_label;
@property(nonatomic,retain)   IBOutlet UILabel*sub_service_label;
@property(nonatomic,retain)   IBOutlet UIImageView*plan_imageView; 

@end
