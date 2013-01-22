//
//  HomeCustomCell.h
//  VPNDemo
//
//  Created by  on 15/01/13.
//  Copyright (c) 2013 Andrew John. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContactCustomCell : UITableViewCell
{
    IBOutlet UILabel*service_label;
    IBOutlet UILabel*service_detail_label;

    
    IBOutlet UIButton*btn_fb;
    IBOutlet UIButton*btn_twitter;
    IBOutlet UIButton*btn_google_plus;
    
    IBOutlet UIImageView*plan_imageView;
    
   
}
@property(nonatomic,retain)   IBOutlet UILabel*service_label;



@property (nonatomic, retain) IBOutlet  UIButton*btn_fb;
@property (nonatomic, retain) IBOutlet UIButton*btn_twitter;
@property (nonatomic, retain) IBOutlet UIButton*btn_google_plus;

@property (nonatomic, retain) IBOutlet UILabel*service_detail_label;


@property(nonatomic,retain) IBOutlet UIImageView*plan_imageView;

@end
