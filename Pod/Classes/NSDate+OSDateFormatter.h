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


/**
 * Returns the date relative to week. Pass 1 for the 1st day of the week, 7 for the last day
 */
-(NSDate*)dateRelativeToDayOfWeek:(NSUInteger)day;

/**
 * Returns the first day of the week for the week specified.
 */
@property(nonatomic,readonly) NSDate*firstDayOfWeek;


/**
 * Returns YES if the current date falls between the two specified dates.
 * Dates do not have to be in the correct order.
 */
-(BOOL)isBetweenDate1:(NSDate*)date1 andDate2:(NSDate*)date2;

/**
 * Date representing the last hour of the day i.e 23:59:59
 */
@property (nonatomic,readonly) NSDate* lastTimeOfDay;

/**
 * Date representing the first hour of the day i.e 00:00:00
 */
@property (nonatomic,readonly) NSDate* firstTimeOfDay;

/**
 * Returns YES if the specified day is the same day as the current instance
 */
-(BOOL)isSameDay:(NSDate*)day;


@end
