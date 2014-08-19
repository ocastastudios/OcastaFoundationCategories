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
#define OS_DATE_MONTH @"yyyy-MM"
#define OS_MONTH_YEAR @"MMMM YYYY"
#define OS_DAY_MONTH_YEAR @"EEE dd MMM yy"
@implementation NSDate (OSDateFormatter)

static NSDateFormatter* dateFormatter=nil;



-(NSString*)stringFromDateWithFormatString:(NSString*)formatString
{
    if (!dateFormatter)
        dateFormatter = [[NSDateFormatter alloc] init];
    
    dateFormatter.dateFormat = formatString;
    return [dateFormatter stringFromDate:self];
    
}
-(NSString *)dateDayMonYear
{
    return [self stringFromDateWithFormatString:OS_DAY_MONTH_YEAR];
    
}

-(NSString *)dateyyyy_MM
{
    return [self stringFromDateWithFormatString:OS_DATE_MONTH];
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

-(NSString *)dateMonthYYYY
{
    return [self stringFromDateWithFormatString:OS_MONTH_YEAR];
}

/**
 * Returns the date relative to week. Pass 1 for the 1st day of the week, 7 for the last day
 */
-(NSDate*)dateRelativeToDayOfWeek:(NSUInteger)day
{
    NSCalendar *calendar = self.calendar;
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
    return [self dateRelativeToDayOfWeek: 2];
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
    NSCalendar *calendar = self.calendar;
    NSDateComponents *components = [calendar components:(NSMonthCalendarUnit | NSYearCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit) fromDate:self];
    
    [components setHour:0];
    [components setMinute:0];
    
    return [calendar dateFromComponents:components];
}

-(NSDate *)lastTimeOfDay
{
    NSCalendar *calendar = self.calendar;
    NSDateComponents *components = [calendar components:(NSMonthCalendarUnit | NSYearCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit) fromDate:self];
    
    [components setHour:23];
    [components setMinute:59];
    [components setSecond:59];
    
    return [calendar dateFromComponents:components];
}

//Need to copy from here into category cocoapod

-(BOOL)isSameDay:(NSDate *)day
{
    NSCalendar *calendar = self.calendar;
    NSDateComponents *components = [calendar components:(NSMonthCalendarUnit | NSYearCalendarUnit | NSDayCalendarUnit) fromDate:self];
    
    NSDate* date = [calendar dateFromComponents:components];
    
    components = [calendar components:(NSMonthCalendarUnit | NSYearCalendarUnit | NSDayCalendarUnit) fromDate:day];
    
    NSDate* otherDay = [calendar dateFromComponents:components];
    
    
    BOOL result =date.timeIntervalSince1970 == otherDay.timeIntervalSince1970;
    
    return result;
}


-(NSDate *)tomorrow
{
    NSCalendar *calendar = self.calendar;
    NSDateComponents *components = [[NSDateComponents alloc] init];
    
    components.day = 1;
    
    return [calendar dateByAddingComponents:components toDate:self options:0];
    
}

-(NSDate *)yesterday
{
    NSCalendar *calendar = self.calendar;
    NSDateComponents *components = [[NSDateComponents alloc] init];
    
    components.day = -1;
    
    return [calendar dateByAddingComponents:components toDate:self options:0];
    
}
-(NSCalendar *)calendar
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    //first weekday should be monday!
    calendar.firstWeekday = 2;
    
    return calendar;
    
}

-(NSDate *)nextMonth
{
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    
    components.month = 1;
    
    return [self.calendar dateByAddingComponents:components toDate:self options:0];
    
}

-(NSDate *)previousMonth
{
    NSCalendar *calendar = self.calendar;
    NSDateComponents *components = [[NSDateComponents alloc] init];
    
    components.month = -1;
    
    return [calendar dateByAddingComponents:components toDate:self options:0];
    
}

-(BOOL)isDateThisMonth:(NSDate *)date
{
    NSCalendar *calendar = self.calendar;
    NSDateComponents *t = [calendar components:(NSMonthCalendarUnit | NSYearCalendarUnit) fromDate:self];
    
    NSDateComponents* o = [calendar components:(NSMonthCalendarUnit | NSYearCalendarUnit) fromDate:date];
    
    return (t.year == o.year && t.month == o.month);
    
}


-(NSDate *)firstDayOfMonth
{
    NSCalendar * c = self.calendar;
    
    NSDateComponents * components = [c components: NSYearCalendarUnit | NSMonthCalendarUnit fromDate: self];
    NSDate * startOfMonth = [c dateFromComponents: components];
    
    return startOfMonth;
}

-(NSDate *)lastDayOfMonth
{
    NSCalendar * c = self.calendar;
    NSDateComponents *components = [c components: NSYearCalendarUnit | NSMonthCalendarUnit fromDate:self];
    
    NSRange range = [c rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:self];
    components.day = range.length;
    
    return [c dateFromComponents:components];
}


-(NSDate *)addDays:(NSInteger)days
{
    NSCalendar *calendar = self.calendar;
    
    
    NSDateComponents* o = [[NSDateComponents alloc] init];
    o.day = days;
    
    return [calendar dateByAddingComponents:o toDate:self options:0];
    
}


-(NSDate *)addMonths:(NSInteger)months
{
    NSCalendar *calendar = self.calendar;
    
    
    NSDateComponents* o = [[NSDateComponents alloc] init];
    o.month = months;
    
    return [calendar dateByAddingComponents:o toDate:self options:0];
    
}

-(NSInteger)weekDay
{
    NSCalendar * calendar = self.calendar;
    
    NSDateComponents * components = [calendar components: NSWeekdayCalendarUnit  fromDate: self];
    
    return components.weekday;
}

-(NSDate *)dateByReplacingHours:(NSUInteger)hours andMinutes:(NSUInteger)minutes andSeconds:(NSUInteger)seconds
{
    NSCalendar *calendar = self.calendar;
    NSDateComponents *comp = [calendar components:(NSMonthCalendarUnit | NSYearCalendarUnit | NSDayCalendarUnit) fromDate:self];
    
    comp.hour = hours;
    comp.minute = minutes;
    comp.second = seconds;
    
    NSDate* outputDate = [calendar dateFromComponents:comp];
    return outputDate;
    
}



-(NSInteger)month
{
    NSCalendar *calendar = self.calendar;
    NSDateComponents *comp = [calendar components:(NSMonthCalendarUnit) fromDate:self];
    
    return comp.month;
}

-(NSInteger)day
{
    NSCalendar *calendar = self.calendar;
    NSDateComponents *comp = [calendar components:(NSDayCalendarUnit) fromDate:self];
    
    return comp.day;
}
@end
