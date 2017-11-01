//
//  SignInViewController.m
//  Intelect
//
//  Created by Narek Sedrakyan on 10/28/17.
//  Copyright © 2017 Narek Sedrakyan. All rights reserved.
//
#import "SignUpViewController.h"
#import "SignInViewController.h"
#import "UsersRequestController.h"
#import "User.h"
#import "Settings.h"

#define BASE_URL  @"https://intelect-184208.appspot.com/api/"
@interface SignInViewController () <SignUpDelegate,NSURLSessionDelegate>
@property (weak, nonatomic) IBOutlet UIStackView *stackView;
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;

@end

@implementation SignInViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)signInAction:(UIButton *)sender {
    UsersRequestController *urc = [[UsersRequestController alloc] init];
    User *user = [[User alloc] init];
    user.userName = [self.usernameTextField.text lowercaseString];
    user.password = self.passwordTextField.text;
    @weakify(self)
    [urc signInWithUser:user success:^(id response) {
        @strongify(self)
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
        self.completion(response);
    } fail:^(NSError *error, NSString *responseErrorMessage, NSUInteger statusCode) {
        NSLog(@"%@",responseErrorMessage);
    }];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    ((SignUpViewController *)[segue destinationViewController]).signUpDelegate = self;
}

- (void)signUpViewController:(SignUpViewController *)signUpViewController didreceiveUser:(User *)user {
    self.usernameTextField.text = user.userName;
    self.passwordTextField.text = user.password;
}

- (void)keyboardWillShow:(NSNotification *)notification {
    CGRect keyboardRect = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGRect rect1 = [self.view convertRect:keyboardRect fromView:nil];
    CGRect rect2 = [self.view convertRect:self.stackView.frame fromView:self.scrollview];
    CGRect intersectionRect = CGRectIntersection(rect1,rect2);
    UIEdgeInsets contentInset = UIEdgeInsetsMake(0, 0, intersectionRect.size.height, 0);
  
    self.scrollview.contentInset = contentInset;
}


- (void)keyboardWillHide:(NSNotification *)notification {
    self.scrollview.contentInset = UIEdgeInsetsZero;
}

@end
