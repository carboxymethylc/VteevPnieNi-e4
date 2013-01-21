//
//  HomeCustomCell.h
//  VPNDemo
//
//  Created by  on 15/01/13.
//  Copyright (c) 2013 Andrew John. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PurchaseCustomCell : UITableViewCell
{
    IBOutlet UILabel*service_label_1;
    IBOutlet UILabel*service_label_2;
    IBOutlet UILabel*service_label_3;
    IBOutlet UILabel*service_label_4;
    IBOutlet UILabel*service_label_5;
    IBOutlet UILabel*service_label_6;
    
    IBOutlet UIImageView*plan_imageView;
    
   
}
@property(nonatomic,retain) IBOutlet UILabel*service_label_1;
@property(nonatomic,retain)IBOutlet UILabel*service_label_2;
@property(nonatomic,retain)IBOutlet UILabel*service_label_3;
@property(nonatomic,retain)IBOutlet UILabel*service_label_4;
@property(nonatomic,retain)IBOutlet UILabel*service_label_5;
@property(nonatomic,retain) IBOutlet UILabel*service_label_6;


@property(nonatomic,retain)   IBOutlet UIImageView*plan_imageView;


@end
