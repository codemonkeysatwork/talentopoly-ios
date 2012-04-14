//
//  TOService.h
//  TalentopolyiOS
//
//  Created by Edward Rudd on 4/13/12.
//  Copyright 2012 OutOfOrder.cc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TOService : NSObject {
    NSURL *_endPointURL;
}

@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, copy) NSString *apiKey;
@property (nonatomic, copy) NSString *endPoint;

+ (id)defaultService;

- (NSString *)loginWithEmail:(NSString *)email andPassword:(NSString *)password;
- (BOOL)isValid;
- (BOOL)validateApiKey:(NSString *)apiKey;
- (BOOL)validateAndSetApiKey:(NSString *)apiKey;

- (NSArray *)getAllPosts;
- (NSArray *)getPopularPosts;

@end
