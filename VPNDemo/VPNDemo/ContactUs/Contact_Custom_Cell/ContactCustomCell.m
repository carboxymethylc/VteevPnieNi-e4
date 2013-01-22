//
//  HomeCustomCell.m
//  VPNDemo
//
//  Created by  on 15/01/13.
//  Copyright (c) 2013 Andrew John. All rights reserved.
//

#import "ContactCustomCell.h"





@implementation ContactCustomCell
@synthesize service_label;
@synthesize btn_google_plus,btn_fb,btn_twitter,service_detail_label,plan_imageView;
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
    [btn_google_plus release];
    [btn_fb release];
    [btn_twitter release];
    
    [service_label release];

    [super dealloc];
}



@end
