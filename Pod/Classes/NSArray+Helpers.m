//
//  NSArray+Helpers.m
//  Ocasta Studios
//
//  Created by Chris Birch on 06/05/2014.
//  Copyright (c) 2014 OcastaStudios. All rights reserved.
//

#import "NSArray+Helpers.h"

#define PERSISTED_ARRAY_FILE_PATH(FILE_NAME) [[NSString alloc] initWithFormat:[@"~/Documents/%@" stringByExpandingTildeInPath] ,FILE_NAME]


@implementation NSArray (Helpers)


-(BOOL)persistToFileOnDisk:(NSString*)filename
{
    NSString*localFile = PERSISTED_ARRAY_FILE_PATH(filename);
    
    return [self writeToFile:localFile atomically:YES];
}


+(NSArray *)loadFromDiskFile:(NSString*)filename
{
    NSString*localFile = PERSISTED_ARRAY_FILE_PATH(filename);
    
    return [NSArray arrayWithContentsOfFile:localFile];
    
}

@end
