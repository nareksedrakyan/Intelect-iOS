//
//  Settings.h
//  Intelect
//
//  Created by Narek Sedrakyan on 10/31/17.
//  Copyright © 2017 Narek Sedrakyan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface Settings : NSObject

+ (Settings *) sharedInstance;

@property (nonatomic) User *loggedInUser;

@end
