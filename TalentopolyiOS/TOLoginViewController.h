//
//  TOLoginViewController.h
//  TalentopolyiOS
//
//  Created by Edward Rudd on 4/14/12.
//  Copyright 2012 OutOfOrder.cc. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TOLoginViewController : UIViewController <UITextFieldDelegate> {
    
    IBOutlet UITextField *_email;
    IBOutlet UITextField *_password;
}
- (IBAction)login:(id)sender;

@end
