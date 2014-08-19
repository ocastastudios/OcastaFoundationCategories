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
@property (nonatomic,readonly) NSString* dateyyyy_MM;
@property (nonatomic,readonly) NSString* dateTimeDD_MM_YY_HH_MM_SS;
@property (nonatomic,readonly) NSString* dateTimeDD_MM_YY_HH_MM;
@property (nonatomic,readonly) NSString* dateDayMonYear;

@property (nonatomic,readonly) NSString* dateMonthYYYY;

/**
 * Returns the date relative to week. Pass 1 for the 1st day of the week, 7 for the last day
 */
-(NSDate*)dateRelativeToDayOfWeek:(NSUInteger)day;

/**
 * Returns the first day of the week for the week specified.
 */
@property(nonatomic,readonly) NSDate*firstDayOfWeek;

@property (nonatomic,readonly) NSCalendar* calendar;
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

/**
 * Returns the day of the week. i.e 0 == saturday
 */
@property (nonatomic,readonly) NSInteger weekDay;
/**
 * Returns the day of the week
 */
@property (nonatomic,readonly) NSInteger day;

/**
 * Returns the month of the year
 */
@property (nonatomic,readonly) NSInteger month;

/**
 * The day after the current date
 */
@property (nonatomic,readonly) NSDate* tomorrow;

/**
 * The day before the current date
 */
@property (nonatomic,readonly) NSDate* yesterday;


/**
 * The month after the current date
 */
@property (nonatomic,readonly) NSDate* nextMonth;

/**
 * The month before the current date
 */
@property (nonatomic,readonly) NSDate* previousMonth;

/**
 * Adds (or removes) the specified number of days from the current date
 */
-(NSDate*)addDays:(NSInteger)days;

/**
 * Adds (or removes) the specified number of months from the current date
 */
-(NSDate*)addMonths:(NSInteger)months;

/**
 * Returns YES if the specified date is part of the month that this instance represents
 */
-(BOOL)isDateThisMonth:(NSDate*)date;


/**
 * Returns the first day of the month specified by the date this instance represents
 */
@property (nonatomic,readonly) NSDate* firstDayOfMonth;

/**
 * Returns the last day of the month specified by the date this instance represents
 */
@property (nonatomic,readonly) NSDate* lastDayOfMonth;


/**
 * Returns the date by replacing its time components
 */
-(NSDate*)dateByReplacingHours:(NSUInteger)hours andMinutes:(NSUInteger)minutes andSeconds:(NSUInteger)seconds;




@end
