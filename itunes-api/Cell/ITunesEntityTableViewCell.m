//
//  ITunesEntityTableViewCell.m
//  itunes-api
//
//  Created by Pavel N on 5/31/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "ITunesEntityTableViewCell.h"

@interface ITunesEntityTableViewCell()
@property (strong, nonatomic) IBOutlet UILabel *itemTitle;
@property (strong, nonatomic) IBOutlet UILabel *itemInfo;
@property (strong, nonatomic) IBOutlet UIImageView *itemImage;


@end

@implementation ITunesEntityTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (NSString*) reuseableID {
    return @"ITunesEntityTableViewCell";
}
@end
