//
//  TOWebViewController.m
//  TalentopolyiOS
//
//  Created by Edward Rudd on 4/13/12.
//  Copyright 2012 OutOfOrder.cc. All rights reserved.
//

#import "TOWebViewController.h"


@implementation TOWebViewController

- (void)loadURL:(NSString *)url
{
    NSURLRequest* request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [_webView loadRequest:request];
    self.navigationItem.title = url;
}

#pragma mark - Init and Dealloc

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
    [_webView release];
    [stopBtn release];
    [refreshBtn release];
    [rewindBtn release];
    [forwardBtn release];
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
    self.toolbarItems = [NSArray arrayWithObjects:rewindBtn,forwardBtn,refreshBtn, stopBtn, nil];
}

- (void)viewDidUnload
{
    [_webView release];
    _webView = nil;
    [stopBtn release];
    stopBtn = nil;
    [refreshBtn release];
    refreshBtn = nil;
    [rewindBtn release];
    rewindBtn = nil;
    [forwardBtn release];
    forwardBtn = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewDidAppear:(BOOL)animated
{
    [self.navigationController setToolbarHidden:NO animated:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [self.navigationController setToolbarHidden:YES animated:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Web View delegate

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"WebView: Error loading URL: %@", [error localizedDescription]);
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                    message:@"Could not load page"
                                                   delegate:nil
                                          cancelButtonTitle:@"Dismiss"
                                          otherButtonTitles:nil];
    [alert show];
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    NSLog(@"WebView: Start loading");
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"WebView: Finish loading");
}
@end
