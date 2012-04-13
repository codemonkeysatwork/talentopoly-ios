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
}

- (void)loadURL:(NSString *)url;

@end
