//
//  NSDictionary+URLAddons.m
//  TalentopolyiOS
//
//  Created by Edward Rudd on 4/13/12.
//  Copyright 2012 OutOfOrder.cc. All rights reserved.
//

#import "NSDictionary+URLAddons.h"


@implementation NSDictionary (URLAddons)

#define URLEncode(s) [s stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]

- (NSString *)URLEncodedString
{
    NSMutableArray *body = [NSMutableArray array];
    for (NSString *key in self) {
        id value = [self objectForKey:key];
        [body addObject:[NSString stringWithFormat:@"%@=%@",
                         URLEncode(key),
                         URLEncode(value)]];
    }
    return [body componentsJoinedByString:@"&"];
}

@end
