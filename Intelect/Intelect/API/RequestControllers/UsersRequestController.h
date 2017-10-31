//
//  UsersRequestController.h
//  Intelect
//
//  Created by Narek Sedrakyan on 10/31/17.
//  Copyright © 2017 Narek Sedrakyan. All rights reserved.
//

#import "BaseRequestController.h"
@class User;

@interface UsersRequestController : BaseRequestController

- (void)signUpWithUser:(User *)user success:(SuccessBlock)success fail:(FailBlock)fail;
- (void)signInWithUser:(User *)user success:(SuccessBlock)success fail:(FailBlock)fail;

@end
