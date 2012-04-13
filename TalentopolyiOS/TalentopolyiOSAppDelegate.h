//
//  TalentopolyiOSAppDelegate.h
//  TalentopolyiOS
//
//  Created by Edward Rudd on 4/12/12.
//  Copyright 2012 OutOfOrder.cc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TalentopolyiOSAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end
