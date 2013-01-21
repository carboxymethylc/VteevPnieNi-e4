//
//  MasterViewController.m
//  VPNDemo
//
//  Created by  on 15/01/13.
//  Copyright (c) 2013 Andrew John. All rights reserved.
//

#import "MasterViewController.h"





@implementation MasterViewController
@synthesize home_custom_cell,cellNib;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        self.title = NSLocalizedString(@"Main", @"Main");
    }
    return self;
}
							
- (void)dealloc
{
   

    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    image_array = [[NSMutableArray alloc] initWithObjects:
                     @"register.png",
                     @"select_vpn_plan.png",
                     @"list_of_protocols.png",
                     @"setup_on_iphone.png",
                     @"my_invoices.png",
                     @"my_detail.png", nil];
    
    service_array = [[NSMutableArray alloc] initWithObjects:
                     @"Register a New Account",
                     @"Select a VPN Plan",
                     @"List of Protocols",
                     @"Setup VPN on iPhone",
                     @"My Invoices",
                     @"My Details", nil];
    
   
    sub_service_array = [[NSMutableArray alloc] initWithObjects:
                         @"Get a FREE trial now!",
                         @"Unlimited usage multi servers!",
                         @"PPTP-SSTP-L2TP-HTTPS-Socks",
                         @"Automatic installation",
                         @"View your invoices",
                         @"Change your account details", nil];
    
    
    
	// Do any additional setup after loading the view, typically from a nib.
    
    
    self.cellNib = [UINib nibWithNibName:@"HomeCustomCell" bundle:nil];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    
     HomeCustomCell *cell = (HomeCustomCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    [self.cellNib instantiateWithOwner:self options:nil];
    cell = home_custom_cell;
    self.home_custom_cell = nil;
    
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
    NSLog(@"\n didSelectRowAtIndexPath = %d",indexPath.row);
}

@end
