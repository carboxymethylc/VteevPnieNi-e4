//
//  DetailViewController.m
//  VPNDemo
//
//  Created by  on 15/01/13.
//  Copyright (c) 2013 Andrew John. All rights reserved.
//

#import "DetailViewController.h"


@implementation DetailViewController

- (void)dealloc
{
    [super dealloc];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        self.title = NSLocalizedString(@"Detail", @"Detail");
    }
    return self;
}
							
@end
