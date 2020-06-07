//
//  ITunesDataSource.m
//  itunes-api
//
//  Created by Pavel N on 6/2/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "ITunesDataSource.h"
#import "ITunesSearchApi.h"

@interface ITunesDataSource ()
@property (atomic,copy) NSArray<ITunesBaseItem*>* items;
@end

@implementation ITunesDataSource
-(void)loadData {
    ITunesSearchApi* api = [ITunesSearchApi sharedInstance];
    __weak ITunesDataSource* weakSelf = self;
    [api search:@"help" type:ITTypeMusic complictionHandler:^(NSDictionary * _Nullable data, NSError * _Nullable error) {
        __strong ITunesDataSource* strongSelf = weakSelf;
        NSMutableArray<ITunesBaseItem*>* items = [[NSMutableArray alloc]init];
        NSArray* result = data[@"results"];
        for (NSDictionary* item in result) {
            ITunesBaseItem* itunesItem = [ITunesItemsFactory createITunesItem:item];
            [items addObject:itunesItem];
        }
        strongSelf.items = items;
        [strongSelf.delegate dataUpdatet];
    }];
}

- (NSUInteger)numberOfItems {
    return [self.items count];
}

- (ITunesBaseItem *)itemAtIndex:(NSUInteger)index {
    return [self.items objectAtIndex:index];
}

@end
