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

#define BASE_URL  @"https://intelect-184208.appspot.com/api/"

@interface SignUpViewController () <NSURLSessionDelegate>

@property (weak, nonatomic) IBOutlet UITextField *userNameTexField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *displayNameTextField;
@property (weak, nonatomic) IBOutlet UIStackView *stackView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)signUpAction:(UIButton *)sender {
    User *user = [[User alloc] init];
    user.userName = self.userNameTexField.text;
    user.displayName = self.displayNameTextField.text;
    user.email = self.emailTextField.text;
    user.password = self.passwordTextField.text;
    UsersRequestController *urc = [[UsersRequestController alloc] init];
    __weak typeof(self) weakSelf = self;
    [urc signUpWithUser:user success:^(id response) {
        typeof(self) strongSelf = weakSelf;
        [strongSelf.signUpDelegate signUpViewController:self didreceiveUser:response];
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
