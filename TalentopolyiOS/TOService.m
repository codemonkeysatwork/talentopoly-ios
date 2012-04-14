//
//  TOService.m
//  TalentopolyiOS
//
//  Created by Edward Rudd on 4/13/12.
//  Copyright 2012 OutOfOrder.cc. All rights reserved.
//

#import "TOService.h"

#import "JSONKit.h"
#import "NSDictionary+URLAddons.h"

static TOService* defaultService;

@interface TOService ()
- (id)RESTMethodGETforPath:(NSString *)path;
- (id)RESTMethodGETforPath:(NSString *)path
                   withGet:(NSDictionary *)get;

- (id)RESTMethod:(NSString *)method
         forPath:(NSString *)path
         withGet:(NSDictionary *)get
         andPost:(NSDictionary *)post;

@end


@implementation TOService

@synthesize managedObjectContext = __managedObjectContext;
@synthesize endPoint = _endPoint;
@synthesize apiKey = _apiKey;

#pragma mark - Properties
- (void)setEndPoint:(NSString *)endPoint
{
    [_endPoint release];
    _endPoint = [endPoint copy];
    
    [_endPointURL release];
    _endPointURL = [[NSURL URLWithString:_endPoint] retain];
}


#pragma mark - Initialization
+ (id)defaultService
{
    if (defaultService == nil) {
        defaultService = [[TOService alloc] init];
    }
    return defaultService;
}

#pragma mark - apiKey
- (NSString *)loginWithEmail:(NSString *)email andPassword:(NSString *)password
{
    NSString *path = @"api/v1/api_key.json";
    NSDictionary *result = [self RESTMethodGETforPath:path
                                    withGet:[NSDictionary dictionaryWithObjectsAndKeys:
                                             email, @"email",
                                             password, @"password",
                                             nil]];
    return [result objectForKey:@"api_key"];
}

- (BOOL)isValid
{
    return _apiKey != nil;
}

- (BOOL)validateApiKey:(NSString *)apiKey
{
    NSString *path = [NSString stringWithFormat:@"api/v1/api_keys/%@/valid.json", apiKey];
    NSDictionary *result = [self RESTMethodGETforPath:path];
    NSNumber *resultValue = [result objectForKey:@"result"];
    return resultValue && [resultValue boolValue] == YES;
}

- (BOOL)validateAndSetApiKey:(NSString *)apiKey
{
    if ([self validateApiKey: apiKey]) {
        self.apiKey = apiKey;
        return YES;
    }
    return NO;
}

#pragma mark - Post handling

- (NSArray *)getAllPosts
{
    NSString *path = @"api/v1/posts/all.json";
    NSDictionary *result = [self RESTMethodGETforPath:path
                                              withGet:[NSDictionary dictionaryWithObjectsAndKeys:
                                                       _apiKey, @"api_key",
                                                       nil]];
    return [result objectForKey:@"posts"];
}

- (NSArray *)getPopularPosts
{
    NSString *path = @"api/v1/posts/popular.json";
    NSDictionary *result = [self RESTMethodGETforPath:path
                                              withGet:[NSDictionary dictionaryWithObjectsAndKeys:
                                                       _apiKey, @"api_key",
                                                       nil]];
    return [result objectForKey:@"posts"];
}

#pragma mark - Private REST Method

- (id)RESTMethodGETforPath:(NSString *)path
{
    return [self RESTMethod:@"GET" forPath:path withGet:nil andPost:nil];
}

- (id)RESTMethodGETforPath:(NSString *)path withGet:(NSDictionary *)get
{
    return [self RESTMethod:@"GET" forPath:path withGet:get andPost:nil];
}

- (id)RESTMethod:(NSString *)method forPath:(NSString *)path withGet:(NSDictionary *)get andPost:(NSDictionary *)post
{
    NSURLResponse *response = nil;
    NSError *error = nil;
    
    NSURL *url;
    if (get != nil) {
        url = [NSURL URLWithString:[NSString stringWithFormat:@"%@?%@", path, [get URLEncodedString]]
                     relativeToURL:_endPointURL];
    } else {
        url = [NSURL URLWithString:path relativeToURL:_endPointURL];
    }
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestReloadIgnoringCacheData
                                                       timeoutInterval:5];
    [request setHTTPMethod:method];

    if (post != nil) {
        [request setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
        [request setHTTPBody:[[post URLEncodedString] dataUsingEncoding:NSUTF8StringEncoding]];
    }

    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    if (error) {
        NSLog(@"Error: %@", [error localizedDescription]);
        if (error.code != NSURLErrorUserCancelledAuthentication) {
            return nil;
        }
    }

    NSDictionary *result = [data objectFromJSONData];
    if (!result) {
        NSLog(@"Bad Result Returned");
    } else if ([result isKindOfClass:[NSDictionary class]] && [result objectForKey:@"error"]) {
        NSLog(@"API Error: %@", [result objectForKey:@"error"]);
        return nil;
    }
    return result;
}


@end