//
//  PurchaseViewController.m
//  VPNDemo
//
//  Created by Chirag@Sunshine on 18/01/13.
//  Copyright (c) 2013 SunshineInfotech. All rights reserved.
//

#import "ContactViewController.h"

@interface ContactViewController ()

@end

@implementation ContactViewController

@synthesize contact_custom_cell,cellNib;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
         self.title = NSLocalizedString(@"Contact", @"Contact");
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    image_array = [[NSMutableArray alloc] initWithObjects:
                   @"setup_vpn.png",
                   @"manual_setup_guide.png",
                   @"",
                   @"server_localization.png",
                   nil];
    
    service_array = [[NSMutableArray alloc] initWithObjects:
                     @"Auto Setup VPN",
                     @"Manual Setup Guide",
                     @"List of VPN Errors",
                     @"Server Locations", nil];
    
    
    sub_service_array = [[NSMutableArray alloc] initWithObjects:
                         @"One-Click Setup",
                         @"Android-Mac-Win-Linux-iOS",
                         @"PPTP-SSTP-L2TP-HTTPS-Socks",
                         @"List of available servers",
                         nil];
    
    
    
	// Do any additional setup after loading the view, typically from a nib.
    
    
    self.cellNib = [UINib nibWithNibName:@"ContactCustomCell" bundle:nil];
    
    
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [service_array count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    ContactCustomCell *cell = (ContactCustomCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    [self.cellNib instantiateWithOwner:self options:nil];
    cell = contact_custom_cell;
    self.contact_custom_cell = nil;
    
    cell.plan_imageView.image = [UIImage imageNamed:[image_array objectAtIndex:indexPath.row]];
    cell.plan_imageView.contentMode = UIViewContentModeScaleAspectFill;
    cell.service_label.text = [service_array objectAtIndex:indexPath.row];
    cell.sub_service_label.text = [sub_service_array objectAtIndex:indexPath.row];
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 73.0;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}




- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"\n purchase view didSelectRowAtIndexPath = %d",indexPath.row);
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
