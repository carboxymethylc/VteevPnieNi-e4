//
//  HomeCustomCell.h
//  VPNDemo
//
//  Created by  on 15/01/13.
//  Copyright (c) 2013 Andrew John. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeCustomCell : UITableViewCell
{
    IBOutlet UILabel*service_label;
    IBOutlet UILabel*sub_service_label;
    IBOutlet UIImageView*plan_imageView;
    
   
}
@property(nonatomic,retain)   IBOutlet UILabel*service_label;
@property(nonatomic,retain)   IBOutlet UILabel*sub_service_label;
@property(nonatomic,retain)   IBOutlet UIImageView*plan_imageView;


@end
