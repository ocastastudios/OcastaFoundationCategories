//
//  NSDate+OSDateFormatter.m
//  EasyCarClub
//
//  Created by Chris Birch on 27/01/2014.
//  Copyright (c) 2014 OcastaStudios. All rights reserved.
//

#import "NSDate+OSDateFormatter.h"
//#import "SORelativeDateTransformer.h"

#define OS_SHORT_TIME_STRING @"HH:mm:ss"

#define OS_SHORT_DATE_STRING2 @"dd-MM-yy HH:mm:ss"
#define OS_SHORT_DATE_STRING @"dd-MM-yy HH:mm"
#define OS_SLID_DATE_STRING @"d MMM yy - HH:mm"
#define OS_SLID2_DATE_STRING @"d MMMM yyyy"

#define OS_EASY_DATE @"yyyy-MM-dd"

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
    return [self stringFromDateWithFormatString:OS_EASY_DATE];
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

-(NSString *)slidDateAndTimeString
{
    return [self stringFromDateWithFormatString:OS_SLID_DATE_STRING];
}

-(NSString *)slid2DateString
{
    return [self stringFromDateWithFormatString:OS_SLID2_DATE_STRING];
}

//-(NSString*)relativeDateString
//{
//    NSString *relativeDate = [[SORelativeDateTransformer registeredTransformer] transformedValue:self];
//    
//    return relativeDate;
//
//}
@end
