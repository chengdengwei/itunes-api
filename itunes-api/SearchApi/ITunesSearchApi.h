//
//  ITunesSearchApi.h
//  itunes-api
//
//  Created by Pavel N on 6/4/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^ITunesSearchApiCompletionHandler)(NSDictionary* _Nullable data, NSError* _Nullable error);


NS_ASSUME_NONNULL_BEGIN

@interface ITunesSearchApi : NSObject

typedef NS_ENUM(NSUInteger, ITunesSearchType) {
    ITTypeAll,
    ITTypeEbook,
    ITTypeSoftware,
    ITTypeTvShow,
    ITTypeShortFilm,
    ITTypeAudiobook,
    ITTypeMusicVideo,
    ITTypeMusic,
    ITTypePodcast,
    ITTypeMovie
};

+ (instancetype) sharedInstance;
-(void) search:(NSString *)term type:(ITunesSearchType)mediaType complictionHandler:(ITunesSearchApiCompletionHandler)handler;

@end

NS_ASSUME_NONNULL_END
