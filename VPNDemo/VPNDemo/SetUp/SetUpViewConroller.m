//
//  SetUpViewConroller.m
//  VPNDemo
//
//  Created by LD.Chirag on 1/15/13.
//  Copyright (c) 2013 Andrew John. All rights reserved.
//

#import "SetUpViewConroller.h"
#import "WebviewDisplayViewController.h"
@interface SetUpViewConroller ()

@end

@implementation SetUpViewConroller
@synthesize setup_custom_cell,cellNib;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
        self.title = NSLocalizedString(@"Setup", @"Setup");
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
     self.navigationItem.titleView = navigation_view;
    
    
    url_array = [[NSMutableArray alloc] initWithObjects:
                 @"http://billing.secure-vpn.com/clientarea.php",
                 @"http://billing.secure-vpn.com/faq.htm",
                 @"http://billing.secure-vpn.com/errors.htm",
                 @"http://billing.secure-vpn.com/servers.htm", nil];
    
    
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
    
    
    self.cellNib = [UINib nibWithNibName:@"SetupCustomCell" bundle:nil];
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
    
    SetupCustomCell *cell = (SetupCustomCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    [self.cellNib instantiateWithOwner:self options:nil];
    cell = setup_custom_cell;
    self.setup_custom_cell = nil;
    
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
    
    WebviewDisplayViewController *viewController = [[WebviewDisplayViewController alloc] init];
    viewController.navigation_title = @"Setup";
    viewController.load_url =[url_array objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:viewController animated:TRUE];
    [viewController release];
    
    NSLog(@"\n didSelectRowAtIndexPath = %d",indexPath.row);
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
