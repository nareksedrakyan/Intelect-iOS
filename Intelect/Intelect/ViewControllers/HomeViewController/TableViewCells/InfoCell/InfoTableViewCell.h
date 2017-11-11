//
//  InfoTableViewCell.h
//  Intelect
//
//  Created by Narek Sedrakyan on 10/30/17.
//  Copyright © 2017 Narek Sedrakyan. All rights reserved.
//

#import <UIKit/UIKit.h>
@class InfoTableViewCell;

@protocol InfoTableViewCellDelegate <NSObject>

- (void)infoTableViewCell:(InfoTableViewCell *)cell didSelectImage:(UIImage *)image;

@end


@interface InfoTableViewCell : UITableViewCell


@property (weak, nonatomic) id <InfoTableViewCellDelegate> delegate;

@end
