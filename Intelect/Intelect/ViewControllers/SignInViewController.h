//
//  SignInViewController.h
//  Intelect
//
//  Created by Narek Sedrakyan on 10/28/17.
//  Copyright © 2017 Narek Sedrakyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface SignInViewController : BaseViewController

@property (nonatomic, copy) void(^completion)(id user, NSString *token);

@end
