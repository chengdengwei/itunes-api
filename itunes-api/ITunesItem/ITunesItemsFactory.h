//
//  ITunesItemsFactory.h
//  itunes-api
//
//  Created by Pavel N on 6/7/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ITunesMediaItem.h"
#import "ITunesEbookItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface ITunesItemsFactory : NSObject
+(id)createITunesItem:(NSDictionary*)item;
@end

NS_ASSUME_NONNULL_END
