//
//  ITunesBaseItem.h
//  itunes-api
//
//  Created by Pavel N on 6/7/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ITunesBaseItem : NSObject
@property (nonatomic, strong) NSString* artworkUrl100;
@property (nonatomic, strong) NSString* kind;
@property (nonatomic, strong) NSString* previewUrl;
@property (nonatomic, strong) NSString* artistName;
@end

NS_ASSUME_NONNULL_END
