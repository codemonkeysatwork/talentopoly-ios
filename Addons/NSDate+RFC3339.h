//
//  NSDate+RFC3339.h
//  TalentopolyiOS
//
//  Created by Edward Rudd on 4/13/12.
//  Copyright 2012 OutOfOrder.cc. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSDate (RFC3339)

+ (NSDate *)dateFromRFC3339Date:(NSString *)date;

@end
