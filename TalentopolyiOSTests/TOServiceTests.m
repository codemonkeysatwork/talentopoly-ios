//
//  TOServiceTests.m
//  TalentopolyiOS
//
//  Created by Edward Rudd on 4/13/12.
//  Copyright 2012 OutOfOrder.cc. All rights reserved.
//

#import "TOServiceTests.h"
#import "TalentopolyiOSAppDelegate.h"
#import "RootViewController.h"

@implementation TOServiceTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
    service = [TOService defaultService];
    service.endPoint = @"http://talentopoly-staging.heroku.com/";
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

static NSString *testApiKey = @"oF12VIeY6LYl3RHEF13mA_wZHoxn5BSPJ-BG9xYv-eM";

- (void)testloginWithEmailAndPassword {
    NSString *api_key = [service loginWithEmail:@"test@outoforder.cc" andPassword:@"testtest"];
    STAssertEqualObjects(api_key, testApiKey, @"Failed to Login");
}

- (void)testValidateApiKey {
    STAssertTrue([service validateApiKey:testApiKey],
                 @"Failed to validate api key");
}

- (void)testGetAllPosts {
    service.apiKey = testApiKey;
    NSArray *posts = [service getAllPosts];
    STAssertNotNil(posts, @"Post Query failed");
}

- (void)testGetPopularPosts {
    service.apiKey = testApiKey;
    NSArray *posts = [service getPopularPosts];
    STAssertNotNil(posts, @"Post Query failed");
}

- (void)testRefreshingPosts {
    service.apiKey = testApiKey;
    TalentopolyiOSAppDelegate *app = (TalentopolyiOSAppDelegate *)[[UIApplication sharedApplication] delegate];
    
    RootViewController *rootViewController = (RootViewController *)[app.navigationController topViewController];

    [rootViewController performSelector:@selector(reloadPosts)];
    NSInteger count = [[app.managedObjectContext insertedObjects] count];
    STAssertTrue(count > 0, @"No Posts Feteched");
}

@end
