//
//  TOWebViewController.h
//  TalentopolyiOS
//
//  Created by Edward Rudd on 4/13/12.
//  Copyright 2012 OutOfOrder.cc. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TOWebViewController : UIViewController <UIWebViewDelegate> {
    
    IBOutlet UIWebView *_webView;
    IBOutlet UIBarButtonItem *stopBtn;
    IBOutlet UIBarButtonItem *refreshBtn;
    IBOutlet UIBarButtonItem *rewindBtn;
    IBOutlet UIBarButtonItem *forwardBtn;
}

- (void)loadURL:(NSString *)url;

@end
