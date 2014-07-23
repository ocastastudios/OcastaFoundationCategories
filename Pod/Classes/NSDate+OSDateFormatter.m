//
//  NSDate+OSDateFormatter.m
//  Ocasta Studios
//
//  Created by Chris Birch on 27/01/2014.
//  Copyright (c) 2014 OcastaStudios. All rights reserved.
//

#import "NSDate+OSDateFormatter.h"

#define OS_SHORT_TIME_STRING @"HH:mm:ss"

#define OS_SHORT_DATE_STRING2 @"dd-MM-yy HH:mm:ss"
#define OS_SHORT_DATE_STRING @"dd-MM-yy HH:mm"


#define OS_DATE @"yyyy-MM-dd"

@implementation NSDate (OSDateFormatter)

static NSDateFormatter* dateFormatter=nil;


-(NSString*)stringFromDateWithFormatString:(NSString*)formatString
{
    if (!dateFormatter)
        dateFormatter = [[NSDateFormatter alloc] init];
    
    dateFormatter.dateFormat = formatString;
    return [dateFormatter stringFromDate:self];
    
}

-(NSString *)dateyyyy_MM_dd
{
    return [self stringFromDateWithFormatString:OS_DATE];
}

-(NSString *)timeHH_MM_SS
{
    return [self stringFromDateWithFormatString:OS_SHORT_TIME_STRING];
}

-(NSString *)dateTimeDD_MM_YY_HH_MM_SS
{
    return [self stringFromDateWithFormatString:OS_SHORT_DATE_STRING2];
}
-(NSString *)dateTimeDD_MM_YY_HH_MM
{
    return [self stringFromDateWithFormatString:OS_SHORT_DATE_STRING];
}



/**
 * Returns the date relative to week. Pass 1 for the 1st day of the week, 7 for the last day
 */
-(NSDate*)dateRelativeToDayOfWeek:(NSUInteger)day
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSInteger weekNumber =  [[calendar components: NSWeekCalendarUnit fromDate:self] week];
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSDateComponents *comp = [gregorian components:NSYearCalendarUnit fromDate:self];
    [comp setWeek:weekNumber];  //Week number.
    [comp setWeekday:day]; //First day of the week. Change it to 7 to get the last date of the week
    
    NSDate *resultDate = [gregorian dateFromComponents:comp];
    
    return resultDate;
}

-(NSDate*)firstDayOfWeek
{
    return [self dateRelativeToDayOfWeek: 1];
}



-(BOOL)isBetweenDate1:(NSDate*)date1 andDate2:(NSDate*)date2
{
    NSDate* date = self;
    
    NSTimeInterval dateSeconds = date.timeIntervalSince1970;
    NSTimeInterval date1Seconds = date1.timeIntervalSince1970;
    NSTimeInterval date2Seconds = date2.timeIntervalSince1970;
    
    
    NSTimeInterval startDateSeconds = MIN(date1Seconds, date2Seconds);
    NSTimeInterval endDateSeconds = MAX(date1Seconds, date2Seconds);
    
    return dateSeconds >= startDateSeconds && dateSeconds <= endDateSeconds;
}

-(NSDate *)firstTimeOfDay
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSMonthCalendarUnit | NSYearCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit) fromDate:self];
    
    [components setHour:0];
    [components setMinute:0];
    
    return [calendar dateFromComponents:components];
}

-(NSDate *)lastTimeOfDay
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSMonthCalendarUnit | NSYearCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit) fromDate:self];
    
    [components setHour:23];
    [components setMinute:59];
    [components setSecond:59];
    
    return [calendar dateFromComponents:components];
}

-(BOOL)isSameDay:(NSDate *)day
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSMonthCalendarUnit | NSYearCalendarUnit | NSDayCalendarUnit) fromDate:self];
    
    NSDate* date = [calendar dateFromComponents:components];
    
    return date.timeIntervalSince1970 == self.timeIntervalSince1970;
    
    
}


@end
