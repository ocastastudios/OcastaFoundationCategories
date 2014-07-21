//
//  NSDictionary+Helpers.h
//  EasyCarClub
//
//  Created by Chris Birch on 06/05/2014.
//  Copyright (c) 2014 OcastaStudios. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Helpers)


-(BOOL)persistToFileOnDisk:(NSString*)filename;

+(NSDictionary *)loadFromDiskFile:(NSString*)filename;
@end
