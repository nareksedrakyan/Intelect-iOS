//
//  Rating.h
//  Intelect
//
//  Created by Narek Sedrakyan on 10/31/17.
//  Copyright © 2017 Narek Sedrakyan. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "Topic.h"

@protocol Rating @end

@interface Rating : JSONModel

@property (nonatomic) Topic *topic;
@property (nonatomic) NSUInteger rating;

@end
