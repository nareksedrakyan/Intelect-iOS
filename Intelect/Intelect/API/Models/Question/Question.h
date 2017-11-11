//
//  Question.h
//  Intelect
//
//  Created by Narek Sedrakyan on 11/11/17.
//  Copyright © 2017 Narek Sedrakyan. All rights reserved.
//

#import <JSONModel/JSONModel.h>
@class Variant;
@class Topic;
@class User;

@interface Question : JSONModel

@property (nonatomic) User *author;
@property (nonatomic) NSString *desc;
@property (nonatomic) NSUInteger *score;
@property (nonatomic) NSArray<Variant> *variants;
@property (nonatomic) Variant *answer;
@property (nonatomic) NSUInteger answeredTotal;
@property (nonatomic) NSUInteger answeredCorrectly;
@property (nonatomic) Topic *topic;

@end
