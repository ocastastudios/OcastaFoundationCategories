//
//  NSDictionary+Helpers.m
//  Ocasta Studios
//
//  Created by Chris Birch on 06/05/2014.
//  Copyright (c) 2014 OcastaStudios. All rights reserved.
//

#import "NSDictionary+Helpers.h"

#define PERSISTED_DICT_FILE_PATH(FILE_NAME) [[NSString alloc] initWithFormat:[@"~/Documents/%@" stringByExpandingTildeInPath] ,FILE_NAME]

@implementation NSDictionary (Helpers)



-(BOOL)persistToFileOnDisk:(NSString*)filename
{
    NSString*localFile = PERSISTED_DICT_FILE_PATH(filename);
    
    return [self writeToFile:localFile atomically:YES];
}


+(NSDictionary *)loadFromDiskFile:(NSString*)filename
{
    NSString*localFile = PERSISTED_DICT_FILE_PATH(filename);
    
    return [NSDictionary dictionaryWithContentsOfFile:localFile];
    
}


@end
