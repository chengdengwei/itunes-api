//
//  ITunesDataSource.h
//  itunes-api
//
//  Created by Pavel N on 6/2/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ITunesItemsFactory.h"

@protocol ITunesDataSourceDelegate <NSObject>
@required
-(void) dataUpdatet;
@end

NS_ASSUME_NONNULL_BEGIN

@interface ITunesDataSource : NSObject

@property (nonatomic, weak, nullable) id <ITunesDataSourceDelegate> delegate;
-(void) loadData;
-(NSUInteger) numberOfItems;
-(ITunesBaseItem*) itemAtIndex:(NSUInteger)index;
@end

NS_ASSUME_NONNULL_END
