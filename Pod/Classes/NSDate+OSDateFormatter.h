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



@end
