//
//  Topic.h
//  Intelect
//
//  Created by Narek Sedrakyan on 10/31/17.
//  Copyright © 2017 Narek Sedrakyan. All rights reserved.
//

#import <JSONModel/JSONModel.h>
@class User;

@interface Topic : JSONModel

@property (nonatomic) User *author;
@property (nonatomic) NSString *type;
@property (nonatomic) NSString *categoryType;
@property (nonatomic) NSString *iconUrl;

@end
