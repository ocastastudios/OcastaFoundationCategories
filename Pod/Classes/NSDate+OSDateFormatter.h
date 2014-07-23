//
//  NSDate+OSDateFormatter.h
//  Ocasta Studios
//
//  Created by Chris Birch on 27/01/2014.
//  Copyright (c) 2014 OcastaStudios. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (OSDateFormatter)

@property (nonatomic,readonly) NSString* timeHH_MM_SS;
@property (nonatomic,readonly) NSString* dateyyyy_MM_dd;
@property (nonatomic,readonly) NSString* dateTimeDD_MM_YY_HH_MM_SS;
@property (nonatomic,readonly) NSString* dateTimeDD_MM_YY_HH_MM;


<<<<<<< HEAD
/**
 * Returns the date relative to week. Pass 1 for the 1st day of the week, 7 for the last day
 */
-(NSDate*)dateRelativeToWeek:(NSDate*)dateInWeek day:(NSUInteger)day;

/**
 * Returns the first day of the week for the week specified.
 */
-(NSDate*)firstDayOfWeek:(NSDate*)dateInWeek;
=======

>>>>>>> 9951211e6f013a94506a82a4bb5f0969acfa5964
@end
