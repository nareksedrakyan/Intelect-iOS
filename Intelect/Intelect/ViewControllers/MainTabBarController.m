//
//  MainTabBarController.m
//  Intelect
//
//  Created by Narek Sedrakyan on 10/29/17.
//  Copyright © 2017 Narek Sedrakyan. All rights reserved.
//

#import "MainTabBarController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController


- (void)loadView {
    [super loadView];
   
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.selectedIndex = 2;
}

- (void)viewDidAppear:(BOOL)animated {
    [self presentLogin];
}

- (void)presentLogin {
    UINavigationController *navController = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginNavigation"];
    [self presentViewController:navController animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
