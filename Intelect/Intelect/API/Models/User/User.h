//
//  User.h
//  Intelect
//
//  Created by Narek Sedrakyan on 10/30/17.
//  Copyright © 2017 Narek Sedrakyan. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "Protocols.h"

@class Location;
@class Rating;
@class Question;
@class Duel;
@class Victory;

@interface User : JSONModel

@property (nonatomic) NSString *ID;
@property (nonatomic) NSString *userName;
@property (nonatomic) NSString *email;
@property (nonatomic) NSString *displayName;
@property (nonatomic) NSString *password;
@property (nonatomic) NSString *position;
@property (nonatomic) NSString *photoUrl;
@property (nonatomic) NSString *lastActive;
@property (nonatomic) NSInteger totalRating;
@property (nonatomic) NSInteger gold;
@property (nonatomic) Location *location;

@property (nonatomic) NSArray<Question> *questions;
@property (nonatomic) NSArray<Rating> *ratings;
@property (nonatomic) NSArray<Duel> *duels;
@property (nonatomic) NSArray<User> *followers;
@property (nonatomic) NSArray<User> *following;
@property (nonatomic) NSArray<Victory> *victories;

@property (nonatomic, getter = isAdmin) BOOL admin;
@property (nonatomic, getter = isVip) BOOL vip;
@property (nonatomic, getter = isOnline) BOOL online;

@end
