//
//  Variant.m
//  Intelect
//
//  Created by Narek Sedrakyan on 11/11/17.
//  Copyright © 2017 Narek Sedrakyan. All rights reserved.
//

#import "Variant.h"

@implementation Variant

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
                                                                    @"desc": @"description"
                                                                  }];
}

+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}

@end
