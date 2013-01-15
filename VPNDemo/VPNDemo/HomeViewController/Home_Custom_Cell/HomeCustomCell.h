//
//  HomeCustomCell.h
//  VPNDemo
//
//  Created by Chirag@Sunshine on 15/01/13.
//  Copyright (c) 2013 SunshineInfotech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeCustomCell : UITableViewCell
{
   IBOutlet UILabel*service_label;
   IBOutlet UIImageView*service_imageView;
}
@property(nonatomic,retain)   IBOutlet UILabel*service_label;
@property(nonatomic,retain)   IBOutlet UIImageView*service_imageView;

@end
