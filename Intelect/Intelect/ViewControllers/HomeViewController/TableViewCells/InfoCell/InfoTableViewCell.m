//
//  InfoTableViewCell.m
//  Intelect
//
//  Created by Narek Sedrakyan on 10/30/17.
//  Copyright © 2017 Narek Sedrakyan. All rights reserved.
//

#import "InfoTableViewCell.h"
#import <UIImageView+AFNetworking.h>

@interface InfoTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *positionLabel;
@property (weak, nonatomic) IBOutlet UILabel *goldLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@end

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
    
    [self.imgView setImageWithURL:[NSURL URLWithString:[Settings sharedInstance].loggedInUser.photoUrl]];
    self.imgView.clipsToBounds = YES;
    self.imgView.layer.cornerRadius = CGRectGetWidth(self.imgView.frame)/2.f;
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageTapped:)];
}

- (void)imageTapped:(id)sender {
    [self.delegate infoTableViewCell:self didSelectImage:self.imgView.image];
}

@end
