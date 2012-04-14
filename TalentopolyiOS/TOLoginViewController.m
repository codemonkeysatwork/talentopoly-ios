//
//  TOLoginViewController.m
//  TalentopolyiOS
//
//  Created by Edward Rudd on 4/14/12.
//  Copyright 2012 OutOfOrder.cc. All rights reserved.
//

#import "TOLoginViewController.h"
#import "TOService.h"

@implementation TOLoginViewController

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
    [_email release];
    [_password release];
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
    [_email release];
    _email = nil;
    [_password release];
    _password = nil;
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
            [_password becomeFirstResponder];
            break;
        case 2:
            [self login:textField];
            break;
    }
    return NO;
}

#pragma mark - Actions

- (IBAction)login:(id)sender {
    TOService *service = [TOService defaultService];
    NSString *apiKey = [service loginWithEmail:_email.text andPassword:_password.text];
    if (apiKey) {
        service.apiKey = apiKey;
        NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
        [def setValue:apiKey forKey:@"apiKey"];
        [def synchronize];
        [self.parentViewController dismissModalViewControllerAnimated:YES];
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:@"Incorrect Username or Password"
                                                       delegate:nil
                                              cancelButtonTitle:@"Dismiss"
                                              otherButtonTitles:nil];
        [alert show];
        [alert release];
    }
}
@end
