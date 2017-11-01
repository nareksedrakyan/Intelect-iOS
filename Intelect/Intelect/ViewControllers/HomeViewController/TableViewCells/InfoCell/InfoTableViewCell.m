//
//  InfoTableViewCell.m
//  Intelect
//
//  Created by Narek Sedrakyan on 10/30/17.
//  Copyright © 2017 Narek Sedrakyan. All rights reserved.
//

#import "InfoTableViewCell.h"

@implementation InfoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setup];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)setup {
    self.nameLabel.text = [Settings sharedInstance].loggedInUser.displayName;
    self.positionLabel.text = [Settings sharedInstance].loggedInUser.position;
    self.goldLabel.text = [NSString stringWithFormat:@"Gold %ld ",[Settings sharedInstance].loggedInUser.gold];
}

@end
