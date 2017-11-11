//
//  Duel.m
//  Intelect
//
//  Created by Narek Sedrakyan on 11/12/17.
//  Copyright © 2017 Narek Sedrakyan. All rights reserved.
//

#import "Duel.h"

@implementation Duel

+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
                                                                  @"ID": @"id"
                                                                  }];
}

@end
