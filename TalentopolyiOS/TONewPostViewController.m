//
//  TONewPostViewController.m
//  TalentopolyiOS
//
//  Created by Edward Rudd on 4/13/12.
//  Copyright 2012 OutOfOrder.cc. All rights reserved.
//

#import "TONewPostViewController.h"


@implementation TONewPostViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [postURL release];
    [postTitle release];
    [postDescription release];
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
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [postURL release];
    postURL = nil;
    [postTitle release];
    postTitle = nil;
    [postDescription release];
    postDescription = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - TextField Delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    switch (textField.tag) {
        case 1:
            [postTitle becomeFirstResponder];
            break;
        case 2:
            [postDescription becomeFirstResponder];
            break;
    }
    return NO;
}

#pragma mark - Actions

- (IBAction)cancelNewPost:(id)sender {
    [self.parentViewController dismissModalViewControllerAnimated:YES];
}

- (IBAction)sendNewPost:(id)sender {
    NSLog(@"Submit new post");
    [self.parentViewController dismissModalViewControllerAnimated:YES];
}
@end
