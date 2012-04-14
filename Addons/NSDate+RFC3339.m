//
//  NSDate+RFC3339.m
//  TalentopolyiOS
//
//  Created by Edward Rudd on 4/13/12.
//  Copyright 2012 OutOfOrder.cc. All rights reserved.
//

#import "NSDate+RFC3339.h"

static NSDateFormatter *sRFC3339DateFormatter;

@implementation NSDate (RFC3339)

+(NSDate *)dateFromRFC3339Date:(NSString *)date
{
    if (sRFC3339DateFormatter == nil) {
        sRFC3339DateFormatter = [[NSDateFormatter alloc] init];
        NSAssert(sRFC3339DateFormatter != nil, @"Could not allocate NSDateFormatter");
        [sRFC3339DateFormatter setDateFormat:@"yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'"];
        [sRFC3339DateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    }
    return [sRFC3339DateFormatter dateFromString:date];
}

@end
