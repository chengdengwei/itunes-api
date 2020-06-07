//
//  ITunesSearchApi.m
//  itunes-api
//
//  Created by Pavel N on 6/4/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "ITunesSearchApi.h"



@interface ITunesSearchApi()
@property (nonatomic, strong) NSString* baseUrl;
@end

@implementation ITunesSearchApi

+ (instancetype) sharedInstance {
    static ITunesSearchApi *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[self alloc] init];
    });
    return shared;
}

- (instancetype) init {
    if (self = [super init]) {
        [self setupNetwork];
    }
    return self;
}

- (void) dealloc {}

- (void) setupNetwork {
    [self setBaseUrl:@"https://itunes.apple.com/search"];
}

-(void)search:(NSString *)term type:(ITunesSearchType)mediaType complictionHandler:(ITunesSearchApiCompletionHandler)handler {
    NSURLComponents* urlComponents = [NSURLComponents componentsWithString:self.baseUrl];
    NSURLQueryItem* terms = [NSURLQueryItem queryItemWithName:@"term" value:term];
    NSURLQueryItem* media = [NSURLQueryItem queryItemWithName:@"media" value: [self formatTypeToString:mediaType] ];
    urlComponents.queryItems = @[terms,media];
    NSURL* url = [urlComponents URL];
    
    
    NSURLSessionDataTask *downloadTask = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if(error != nil){
            handler(nil,error);
        }
        NSError * jsonError;
        
        NSDictionary * jsonObject = (NSDictionary *)[NSJSONSerialization JSONObjectWithData:data
                                                                                    options:NSJSONReadingAllowFragments
                                                                                      error: &jsonError];
        handler(jsonObject,jsonError);
    }];
    
    [downloadTask resume];
}

- (NSString*)formatTypeToString:(ITunesSearchType)type {
    NSString *result = nil;
    
    switch (type) {
        case ITTypeAll:
            result = @"all";
            break;
        case ITTypeEbook:
            result = @"ebook";
            break;
        case ITTypeSoftware:
            result = @"software";
            break;
        case ITTypeTvShow:
            result = @"tvShow";
            break;
        case ITTypeShortFilm:
            result = @"shortFilm";
            break;
        case ITTypeAudiobook:
            result = @"audiobook";
            break;
        case ITTypeMusicVideo:
            result = @"musicVideo";
            break;
        case ITTypeMusic:
            result = @"music";
            break;
        case ITTypePodcast:
            result = @"podcast";
            break;
        case ITTypeMovie:
            result = @"movie";
            break;
        default:
            [NSException raise:NSGenericException format:@"Unexpected FormatType."];
    }
    
    return result;
}
@end
