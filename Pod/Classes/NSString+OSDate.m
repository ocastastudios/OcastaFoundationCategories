//
//  NSString+OSDate.m
//  EasyCarClub
//
//  Created by Chris Birch on 30/01/2014.
//  Copyright (c) 2014 OcastaStudios. All rights reserved.
//

#import "NSString+OSDate.h"


#define OS_SHORT_DATE_STRING @"dd-MM-yy HH:mm"
#define OS_SLID_DATE_STRING @"d MMM yy - HH:mm"
#define OS_SLID2_DATE_STRING @"d MMMM yyyy"

#define OS_EASY_DATE @"yyyy-MM-dd"


@implementation NSString (OSDate)
static NSDateFormatter* dateFormatter=nil;




-(NSDate *)dateFromString:(NSString *)str withFormatString:(NSString*)formatStr
{
    if (!dateFormatter)
        dateFormatter = [[NSDateFormatter alloc] init];
    
    dateFormatter.dateFormat = formatStr;
    
    return [dateFormatter dateFromString:str];
}

-(NSDate *)dateFromddMMyyHHmm
{
    return [self dateFromString:self withFormatString:OS_SHORT_DATE_STRING];
}

-(NSDate *)dateFromddMMyy
{
    return [self dateFromString:self withFormatString:OS_EASY_DATE];
}

-(NSDate *)dateFromSlidDateTimeString
{
    return [self dateFromString:self withFormatString:OS_SLID_DATE_STRING];
}
@end
