//
//  PurchaseViewController.m
//  VPNDemo
//
//  Created by  on 18/01/13.
//  Copyright (c) 2013 Andrew John. All rights reserved.
//

#import "PurchaseViewController.h"

@interface PurchaseViewController ()

@end

@implementation PurchaseViewController

@synthesize purchase_custom_cell,cellNib;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
         self.title = NSLocalizedString(@"Purchase", @"Purchase");
        

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.titleView = navigation_view;
    image_array = [[NSMutableArray alloc] initWithObjects:
                   @"1month.png",
                   @"3month.png",
                   @"6month.png",
                   @"12month.png",
                   @"36month.png",
                   nil];
    
    service_array = [[NSMutableArray alloc] init];
    
    NSMutableDictionary*temp_service_dic = [[NSMutableDictionary alloc] init];
    [temp_service_dic setObject:@"PPTP / L2TP / SSTP" forKey:@"line_1"];
    [temp_service_dic setObject:@"24 protocols" forKey:@"line_2"];
    [temp_service_dic setObject:@"Unlimited Bandwidth" forKey:@"line_3"];
    [temp_service_dic setObject:@"128-256 bit Encryption" forKey:@"line_4"];
    [temp_service_dic setObject:@"Instant Activation" forKey:@"line_5"];
    [temp_service_dic setObject:@"Save 0%" forKey:@"line_6"];
    
    [service_array addObject:temp_service_dic];
    [temp_service_dic release];
    
    //2nd
    
    temp_service_dic = [[NSMutableDictionary alloc] init];
    [temp_service_dic setObject:@"PPTP / L2TP / SSTP / Squid / Socks" forKey:@"line_1"];
    [temp_service_dic setObject:@"35 protocols" forKey:@"line_2"];
    [temp_service_dic setObject:@"Unlimited Bandwidth" forKey:@"line_3"];
    [temp_service_dic setObject:@"128-256 bit Encryption" forKey:@"line_4"];
    [temp_service_dic setObject:@"Instant Activation" forKey:@"line_5"];
    [temp_service_dic setObject:@"Save 37%" forKey:@"line_6"];
    [service_array addObject:temp_service_dic];
    [temp_service_dic release];
    
   //3rd
    
    temp_service_dic = [[NSMutableDictionary alloc] init];
    [temp_service_dic setObject:@"PPTP / L2TP / SSTP / Squid / Socks / HTTPS Proxy" forKey:@"line_1"];
    [temp_service_dic setObject:@"42 protocols" forKey:@"line_2"];
    [temp_service_dic setObject:@"Unlimited Bandwidth" forKey:@"line_3"];
    [temp_service_dic setObject:@"128-256 bit Encryption" forKey:@"line_4"];
    [temp_service_dic setObject:@"Instant Activation" forKey:@"line_5"];
    [temp_service_dic setObject:@"Save 42%" forKey:@"line_6"];
    [service_array addObject:temp_service_dic];
    [temp_service_dic release];
    
    //4th
    
    temp_service_dic = [[NSMutableDictionary alloc] init];
    [temp_service_dic setObject:@"PPTP / L2TP / SSTP / Squid / Socks / HTTPS Proxy" forKey:@"line_1"];
    [temp_service_dic setObject:@"42 protocols" forKey:@"line_2"];
    [temp_service_dic setObject:@"Unlimited Bandwidth" forKey:@"line_3"];
    [temp_service_dic setObject:@"128-256 bit Encryption" forKey:@"line_4"];
    [temp_service_dic setObject:@"Instant Activation" forKey:@"line_5"];
    [temp_service_dic setObject:@"Save 57%" forKey:@"line_6"];
    [service_array addObject:temp_service_dic];
    [temp_service_dic release];
    
    //5th
    
    temp_service_dic = [[NSMutableDictionary alloc] init];
    [temp_service_dic setObject:@"PPTP / L2TP / SSTP / Squid / Socks / HTTPS Proxy" forKey:@"line_1"];
    [temp_service_dic setObject:@"42 protocols" forKey:@"line_2"];
    [temp_service_dic setObject:@"Unlimited Bandwidth" forKey:@"line_3"];
    [temp_service_dic setObject:@"128-256 bit Encryption" forKey:@"line_4"];
    [temp_service_dic setObject:@"Instant Activation" forKey:@"line_5"];
    [temp_service_dic setObject:@"Save 72%" forKey:@"line_6"];
    [service_array addObject:temp_service_dic];
    [temp_service_dic release];
    
        
    
	// Do any additional setup after loading the view, typically from a nib.
    
    
    self.cellNib = [UINib nibWithNibName:@"PurchaseCustomCell" bundle:nil];
    
    
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
    
    PurchaseCustomCell *cell = (PurchaseCustomCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    [self.cellNib instantiateWithOwner:self options:nil];
    cell = purchase_custom_cell;
    self.purchase_custom_cell = nil;
    
    cell.plan_imageView.image = [UIImage imageNamed:[image_array objectAtIndex:indexPath.row]];
    cell.plan_imageView.contentMode = UIViewContentModeScaleAspectFill;
    cell.service_label_1.text = [[service_array objectAtIndex:indexPath.row] objectForKey:@"line_1"];
    cell.service_label_2.text = [[service_array objectAtIndex:indexPath.row] objectForKey:@"line_2"];
    cell.service_label_3.text = [[service_array objectAtIndex:indexPath.row] objectForKey:@"line_3"];
    cell.service_label_4.text = [[service_array objectAtIndex:indexPath.row] objectForKey:@"line_4"];
    cell.service_label_5.text = [[service_array objectAtIndex:indexPath.row] objectForKey:@"line_5"];
    cell.service_label_6.text = [[service_array objectAtIndex:indexPath.row] objectForKey:@"line_6"];
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 300.0;
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
