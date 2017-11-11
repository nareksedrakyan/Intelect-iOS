//
//  Question.m
//  Intelect
//
//  Created by Narek Sedrakyan on 11/11/17.
//  Copyright © 2017 Narek Sedrakyan. All rights reserved.
//

#import "Question.h"

@implementation Question

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
                                                                      @"desc": @"description",
                                                                      @"answeredTotal": @"answered.total",
                                                                      @"answeredCorrectly": @"answered.correctly"
                                                                  }];
}

+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}

@end

