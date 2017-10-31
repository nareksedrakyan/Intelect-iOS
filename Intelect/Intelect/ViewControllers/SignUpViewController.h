//
//  SignUpViewController.h
//  Intelect
//
//  Created by Narek Sedrakyan on 10/28/17.
//  Copyright © 2017 Narek Sedrakyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
@class SignUpViewController;
@class User;
@protocol SignUpDelegate <NSObject>

- (void)signUpViewController:(SignUpViewController *)signUpViewController didreceiveUser:(User *)user;

@end

@interface SignUpViewController : BaseViewController

@property (nonatomic, weak) id<SignUpDelegate>signUpDelegate;

@end
