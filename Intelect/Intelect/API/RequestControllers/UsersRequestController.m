//
//  UsersRequestController.m
//  Intelect
//
//  Created by Narek Sedrakyan on 10/31/17.
//  Copyright © 2017 Narek Sedrakyan. All rights reserved.
//

#import "UsersRequestController.h"
#import "User.h"

#define USERS_BASE_URI @"/users"
#define SIGNUP_URI @"/signup"
#define SIGNIN_URI @"/signin"
#define SIGNOUT_URI @"/signout"

@implementation UsersRequestController

- (void)signUpWithUser:(User *)user success:(SuccessBlock)success fail:(FailBlock)fail {
   NSString *uri = [self absoluteUriFromBaseUri:USERS_BASE_URI uri:SIGNUP_URI];
    [self postForUri:uri object:user success:^(id response) {
        NSError* err;
        User *user = [[User alloc] initWithData:response error:&err];
        success(user);
    } fail:^(NSError *error, NSString *responseErrorMessage, NSUInteger statusCode) {
        fail(error,responseErrorMessage,statusCode);
    }];
}

- (void)signInWithUser:(User *)user success:(SuccessBlock)success fail:(FailBlock)fail {
    NSString *uri = [self absoluteUriFromBaseUri:USERS_BASE_URI uri:SIGNIN_URI];
    [self postForUri:uri object:user success:^(id response) {
        NSError* err;
        User *user = [[User alloc] initWithData:response error:&err];
        success(user);
    } fail:^(NSError *error, NSString *responseErrorMessage, NSUInteger statusCode) {
        fail(error,responseErrorMessage,statusCode);
    }];
}

@end
