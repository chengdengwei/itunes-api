//
//  ViewController.m
//  itunes-api
//
//  Created by Pavel N on 5/30/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "ViewController.h"
#import "ITunesEntityTableViewCell.h"
#import "ITunesDataSource.h"

@interface ViewController ()

@property (nonatomic,strong) UISearchBar* searchBar;
@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, weak) ITunesDataSource* dataSource;
@end

@implementation ViewController

- (instancetype)initWithDataSource:(ITunesDataSource*)dataSource
{
    self = [super init];
    
    if (self) {
        _searchBar = [[UISearchBar alloc] initWithFrame:CGRectZero];
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero];
        _dataSource = dataSource;
    }
    
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.searchBar];
    [self.view addSubview:self.tableView];
    [self setupLayout];
    [self setTitle:@"first"];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView registerClass:[ITunesEntityTableViewCell class] forCellReuseIdentifier:[ITunesEntityTableViewCell reuseableID]];
    
    self.dataSource.delegate = self;
    
    [self.dataSource loadData];
}

- (void)setupLayout {
    self.searchBar.translatesAutoresizingMaskIntoConstraints = NO;
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [NSLayoutConstraint activateConstraints:@[
        [self.view.safeAreaLayoutGuide.leadingAnchor constraintEqualToAnchor:self.searchBar.leadingAnchor],
        [self.view.safeAreaLayoutGuide.trailingAnchor constraintEqualToAnchor:self.searchBar.trailingAnchor],
        [self.view.safeAreaLayoutGuide.topAnchor constraintEqualToAnchor:self.searchBar.topAnchor],
        [self.view.safeAreaLayoutGuide.leadingAnchor constraintEqualToAnchor:self.tableView.leadingAnchor],
        [self.view.safeAreaLayoutGuide.trailingAnchor constraintEqualToAnchor:self.tableView.trailingAnchor],
        [self.view.safeAreaLayoutGuide.bottomAnchor constraintEqualToAnchor:self.tableView.bottomAnchor],
        [self.searchBar.bottomAnchor constraintEqualToAnchor:self.tableView.topAnchor]] ];
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    ITunesEntityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[ITunesEntityTableViewCell reuseableID]];
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataSource numberOfItems];
}

- (void)dataUpdatet {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}

@end
