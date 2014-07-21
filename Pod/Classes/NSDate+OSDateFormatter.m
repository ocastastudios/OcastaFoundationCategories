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


@end
