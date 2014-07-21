//
//  NSString+OSDate.h
//  EasyCarClub
//
//  Created by Chris Birch on 30/01/2014.
//  Copyright (c) 2014 OcastaStudios. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (OSDate)

@property(nonatomic,readonly)NSDate* dateFromddMMyyHHmm;
@property(nonatomic,readonly)NSDate* dateFromSlidDateTimeString;
@property(nonatomic,readonly)NSDate* dateFromddMMyy;

@end
