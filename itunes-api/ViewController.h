//
//  ViewController.h
//  itunes-api
//
//  Created by Pavel N on 5/30/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ITunesDataSource.h"

@interface ViewController : UIViewController <UITableViewDelegate, UISearchBarDelegate, UITableViewDataSource, ITunesDataSourceDelegate>
- (instancetype)initWithDataSource:(ITunesDataSource*)dataSource;
@end

