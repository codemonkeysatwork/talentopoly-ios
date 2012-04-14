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
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(keyboardShow:)
                                                     name:UIKeyboardWillShowNotification
                                                   object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(keyboardWillHide:)
                                                     name:UIKeyboardWillHideNotification
                                                   object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(keyboardDidHide:)
                                                     name:UIKeyboardDidHideNotification
                                                   object:nil];
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];

    [postURL release];
    [postTitle release];
    [postDescription release];
    [scroller release];
    [scrollerContent release];
    [postDescriptionTitle release];
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
    scroller.contentSize = scrollerContent.bounds.size;
}

- (void)viewDidUnload
{
    [postURL release];
    postURL = nil;
    [postTitle release];
    postTitle = nil;
    [postDescription release];
    postDescription = nil;
    [scroller release];
    scroller = nil;
    [scrollerContent release];
    scrollerContent = nil;
    [postDescriptionTitle release];
    postDescriptionTitle = nil;
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

#pragma mark - TextView Delegate

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    [scroller setContentOffset:CGPointMake(0, postDescriptionTitle.frame.origin.y) animated:YES];
}

#pragma mark - Keyboard notifications

- (void)keyboardShow:(NSNotification *)notification
{
    NSDictionary *info = [notification userInfo];
    
    CGRect kbRectSrc = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];

    CGSize size = scroller.bounds.size;
    size.height += kbRectSrc.size.height;
    scroller.contentSize = size;
}

- (void)keyboardWillHide:(NSNotification *)notification
{
    [scroller setContentOffset:CGPointZero animated:YES];
}

- (void)keyboardDidHide:(NSNotification *)notification
{
    scroller.contentSize = scroller.bounds.size;
}

#pragma mark - Actions

- (IBAction)cancelNewPost:(id)sender {
    [self.parentViewController dismissModalViewControllerAnimated:YES];
}

- (IBAction)sendNewPost:(id)sender {
    NSLog(@"Submit new post");
    [self.view endEditing:NO];
//    [self.parentViewController dismissModalViewControllerAnimated:YES];
}
@end
