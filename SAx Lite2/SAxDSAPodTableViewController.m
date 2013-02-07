//
//  SAxDSAPodTableViewController.m
//  SAx Lite2
//
//  Created by Fabrice Guillaume on 2/6/13.
//  Copyright (c) 2013 Fabrice Guillaume. All rights reserved.
//

#import "SAxDSAPodTableViewController.h"
#import "SAxDSAViewController.h"

@interface SAxDSAPodTableViewController ()

@end

@implementation SAxDSAPodTableViewController
@synthesize dashboardPods;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Will need to call a Webservice in the future to fill in the table
    self.dashboardPods = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"SAx_DashboardPods" ofType:@"plist"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [self.dashboardPods count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	return [[self.dashboardPods allKeys] objectAtIndex:section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	NSString *continent = [self tableView:tableView titleForHeaderInSection:section];
	return [[self.dashboardPods valueForKey:continent] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"PodCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
	NSString *dashboard = [self tableView:tableView titleForHeaderInSection:indexPath.section];
	NSString *pod = [[self.dashboardPods valueForKey:dashboard] objectAtIndex:indexPath.row];
	
	cell.textLabel.text = pod;
	cell.accessoryType = UITableViewCellAccessoryNone;
;
    
    //UIImageView *imv = [[UIImageView alloc]initWithFrame:CGRectMake(3, 5, 25, 30)];
    cell.imageView.image = [UIImage imageNamed:@"colorful_chart.png" ];

    
    return cell;
}



#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // Call didTap to tell SAxDSA VC that tableView is tapped
    // and dismiss the popover
    UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *cellText = selectedCell.textLabel.text;
    
    dNSLog(@"\t[DSA]Row selected: index=[%d, %d], value=[%@]", indexPath.section, indexPath.row, cellText);
    dNSLog(@"\t[DSA]Calling delegate");
    
    // update the selectedPod variable form the calling Viewcontroller
    [self.delegate dismissPopover:cellText];
    
}

@end
