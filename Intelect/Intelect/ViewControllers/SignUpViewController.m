//
//  SignUpViewController.m
//  Intelect
//
//  Created by Narek Sedrakyan on 10/28/17.
//  Copyright © 2017 Narek Sedrakyan. All rights reserved.
//

#import "SignUpViewController.h"
#import "UsersRequestController.h"
#import "User.h"
#import "Location.h"
#import <CoreLocation/CoreLocation.h>
#define BASE_URL  @"https://intelect-184208.appspot.com/api/"

@interface SignUpViewController () <NSURLSessionDelegate,CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *userNameTexField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *displayNameTextField;
@property (weak, nonatomic) IBOutlet UIStackView *stackView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
//@property (nonatomic) CLLocationManager *locationManager;
@property (nonatomic) CLLocation *currentLocation;
@end

@implementation SignUpViewController

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self startUpdatingLocation];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)startUpdatingLocation {
    CLLocationManager *locationManager = [[CLLocationManager alloc] init];
  
//    self.locationManager.delegate = self;
//    self.locationManager.distanceFilter = kCLDistanceFilterNone;
//    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
//    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
//        [self.locationManager requestWhenInUseAuthorization];
//
    [locationManager startUpdatingLocation];
    self.currentLocation = [locationManager location];

}

//- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
//    self.currentLocation = [locations lastObject];
//    [self.locationManager stopUpdatingLocation];
//    self.locationManager.delegate = nil;
//    self.locationManager = nil;
//}

- (IBAction)signUpAction:(UIButton *)sender {
    User *user = [[User alloc] init];
    user.userName = [self.userNameTexField.text lowercaseString];
    user.displayName = self.displayNameTextField.text;
    user.email = [self.emailTextField.text lowercaseString];
    user.password = self.passwordTextField.text;
    
    Location *location = [[Location alloc] init];
    location.latitude = self.currentLocation.coordinate.latitude;
    location.longitude = self.currentLocation.coordinate.longitude;

    user.location = location;
    UsersRequestController *urc = [[UsersRequestController alloc] init];
    @weakify(self)
    [urc signUpWithUser:user success:^(id response) {
        @strongify(self)
        [self.signUpDelegate signUpViewController:self didreceiveUser:response];
        [self.navigationController popViewControllerAnimated:YES];
    } fail:^(NSError *error, NSString *responseErrorMessage, NSUInteger statusCode) {
        NSLog(@"%@",responseErrorMessage);
    }];
}

- (void)keyboardWillShow:(NSNotification *)notification {
    CGRect keyboardRect = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGRect rect1 = [self.view convertRect:keyboardRect fromView:nil];
    CGRect rect2 = [self.view convertRect:self.stackView.frame fromView:self.scrollView];
    CGRect intersectionRect = CGRectIntersection(rect1,rect2);
    UIEdgeInsets contentInset = UIEdgeInsetsMake(0, 0, intersectionRect.size.height, 0);
    
    self.scrollView.contentInset = contentInset;
}


- (void)keyboardWillHide:(NSNotification *)notification {
    self.scrollView.contentInset = UIEdgeInsetsZero;
}

@end
