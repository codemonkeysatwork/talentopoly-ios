//
//  TOPostDetailViewController.m
//  TalentopolyiOS
//
//  Created by Edward Rudd on 4/12/12.
//  Copyright 2012 OutOfOrder.cc. All rights reserved.
//

#import "TOPostDetailViewController.h"
#import "TOPost.h"

@implementation TOPostDetailViewController

@synthesize post = _post;

- (void)setPost:(TOPost *)post {
    [_post release];
    _post = [post retain];
    [self.tableView reloadData];
}

#pragma mark - Initialization and Destruction

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"Post";

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
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
    return 3;
}

const NSInteger sections[] = {2, 1, 3};

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return sections[section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    if (_post == nil) return cell;

    NSInteger cellID = indexPath.section << 8 | indexPath.row;
    switch (cellID) {
        case 0x0000:
            cell.textLabel.text = _post.title;
            break;
        case 0x0001:
            cell.textLabel.text = _post.post_description;
            break;
        case 0x0100:
            cell.textLabel.text = _post.link;
            break;
        case 0x0200:
            cell.textLabel.text = [NSString stringWithFormat:@"%@ likes", _post.total_likes];
            break;
        case 0x0201:
            cell.textLabel.text = [NSString stringWithFormat:@"%@ comments", _post.total_comments];
            break;
        case 0x0202:
            cell.textLabel.text = [NSString stringWithFormat:@"Posted at %@", [_post.posted_at description]];
            break;
        default:
            NSLog(@"Unexpected Cell");
            abort();
            break;
    }
    if (cellID != 0x0100) {
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }

    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}

@end
