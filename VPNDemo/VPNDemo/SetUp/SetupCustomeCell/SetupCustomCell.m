//
//  SetupCustomCell.m
//  VPNDemo
//
//  Created by LD.Chirag on 1/15/13.
//  Copyright (c) 2013 Andrew John. All rights reserved.
//

#import "SetupCustomCell.h"

@implementation SetupCustomCell
@synthesize sub_service_label,service_label,plan_imageView;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)dealloc
{
    [plan_imageView release];
    [sub_service_label release];
    [service_label release];
    [super dealloc];
}

@end
