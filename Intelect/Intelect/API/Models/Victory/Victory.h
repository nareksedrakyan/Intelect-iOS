//
//  Victory.h
//  Intelect
//
//  Created by Narek Sedrakyan on 11/12/17.
//  Copyright © 2017 Narek Sedrakyan. All rights reserved.
//

#import <JSONModel/JSONModel.h>
@class Topic;

@interface Victory : JSONModel

@property (nonatomic) Topic *topic;
@property (nonatomic) NSUInteger place;
@property (nonatomic) NSString *region;
@property (nonatomic) NSUInteger mounth;

@end
