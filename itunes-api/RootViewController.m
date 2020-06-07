//
//  RootViewController.m
//  itunes-api
//
//  Created by Pavel N on 5/31/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "RootViewController.h"
#import "ViewController.h"
#import "ITunesDataSource.h"

@interface RootViewController ()
@property (nonatomic,strong) ViewController* firstVC;
@property (nonatomic,strong) ITunesDataSource* itunesDataSource;
@end

@implementation RootViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.itunesDataSource = [[ITunesDataSource alloc] init];
    self.firstVC = [[ViewController alloc] initWithDataSource:self.itunesDataSource];
    UINavigationController* firstNav = [[UINavigationController alloc] initWithRootViewController:self.firstVC];
    [self addChildViewController: firstNav];
}


@end
