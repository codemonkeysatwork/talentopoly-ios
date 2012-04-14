//
//  TONewPostViewController.h
//  TalentopolyiOS
//
//  Created by Edward Rudd on 4/13/12.
//  Copyright 2012 OutOfOrder.cc. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TONewPostViewController : UIViewController <UITextFieldDelegate, UITextViewDelegate> {
    
    IBOutlet UIScrollView *scroller;
    IBOutlet UIView *scrollerContent;

    IBOutlet UITextField *postURL;
    IBOutlet UITextField *postTitle;
    IBOutlet UILabel *postDescriptionTitle;
    IBOutlet UITextView *postDescription;
}
- (IBAction)cancelNewPost:(id)sender;
- (IBAction)sendNewPost:(id)sender;

@end
