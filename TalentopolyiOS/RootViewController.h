//
//  RootViewController.h
//  TalentopolyiOS
//
//  Created by Edward Rudd on 4/12/12.
//  Copyright 2012 OutOfOrder.cc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <CoreData/CoreData.h>

@interface RootViewController : UITableViewController <NSFetchedResultsControllerDelegate> {

}

@property (nonatomic, retain) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;

@end
