//
//  HomeCustomCell.m
//  VPNDemo
//
//  Created by  on 15/01/13.
//  Copyright (c) 2013 Andrew John. All rights reserved.
//

#import "PurchaseCustomCell.h"

@implementation PurchaseCustomCell
@synthesize service_label_1,service_label_2,service_label_3,service_label_4,service_label_5,service_label_6,plan_imageView;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        // Initialization code
        
       // service_imageView.contentMode = UIViewContentModeScaleAspectFit;
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)layoutSubviews
{
    [super layoutSubviews];
}

-(void)dealloc
{
    
    [service_label_1 release];
    [service_label_2 release];
    [service_label_3 release];
    [service_label_4 release];
    [service_label_5 release];
    [service_label_6 release];
    
    [plan_imageView release];
    [super dealloc];
}
@end
