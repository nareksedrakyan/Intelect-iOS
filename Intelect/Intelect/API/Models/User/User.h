//
//  User.h
//  Intelect
//
//  Created by Narek Sedrakyan on 10/30/17.
//  Copyright © 2017 Narek Sedrakyan. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "Location.h"
#import "Rating.h"

@interface User : JSONModel

@property (nonatomic) NSString *userName;
@property (nonatomic) NSString *email;
@property (nonatomic) NSString *displayName;
@property (nonatomic) NSString *password;
@property (nonatomic) NSString *position;
@property (nonatomic) NSString *photoUrl;
@property (nonatomic) NSString *lastActive;
@property (nonatomic) NSString *accessToken;
@property (nonatomic) NSInteger totalRating;
@property (nonatomic) Location *location;
@property (nonatomic) NSArray<NSString *> *questionIds;
@property (nonatomic) NSArray<Rating> *ratings;
@property (nonatomic, getter = isAdmin) BOOL admin;
@property (nonatomic, getter = isVip) BOOL vip;
@property (nonatomic, getter = isOnline) BOOL online;

@end
