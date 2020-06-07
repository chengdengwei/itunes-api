//
//  ITunesItemsFactory.m
//  itunes-api
//
//  Created by Pavel N on 6/7/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "ITunesItemsFactory.h"

@implementation ITunesItemsFactory
- (instancetype)init
{
    //Only statics
    return nil;
}

+ (id)createITunesItem:(NSDictionary *)item {
    NSString *value = item[@"kind"];
    
    if (value == nil) {
        return nil;
    }
    
    if([value isEqualToString:@"book"]){
        return [[ITunesEbookItem alloc]init];
    }
    if([value isEqualToString:@"music-video"] ||
       [value isEqualToString:@"album"] ||
       [value isEqualToString:@"feature-movie"] ||
       [value isEqualToString:@"podcast"] ||
       [value isEqualToString:@"podcast-episode"] ||
       [value isEqualToString:@"song"]){
        return [[ITunesMediaItem alloc]init];
    }
    
    return nil;
}
@end
