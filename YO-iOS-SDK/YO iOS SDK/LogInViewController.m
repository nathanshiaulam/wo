//
//  LogInViewController.m
//  YO iOS SDK
//
//  Created by Nathan Lam on 11/16/14.
//  Copyright (c) 2014 yiqin. All rights reserved.
//

#import "LogInViewController.h"
#import <Parse/Parse.h>
#import "YO.h"

@interface LogInViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;

@end

@implementation LogInViewController
- (IBAction)submitButtonClick:(id)sender {
    [self userLogIn:_usernameField.text withPassword:_passwordField.text];
}

- (void)userLogIn:(NSString *)username withPassword:(NSString *)password {
    
    if (username.length == 0 || password.length == 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Submission Failure" message:@"Invalid username or password." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        return;
    }
    
    [PFUser logInWithUsernameInBackground:username password:password
      block:^(PFUser *user, NSError *error) {
          if (user) {
              [self dismissViewControllerAnimated:YES completion:nil];
          } else {
              UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Log-In Fail" message:@"Username or password is incorrect." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
              [alert show];
          }
      }];

}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _passwordField.secureTextEntry = YES;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == _usernameField)
    {
        [_passwordField becomeFirstResponder];
    }
    else
    {
        [self userLogIn:_usernameField.text withPassword:_passwordField.text];
        [textField resignFirstResponder];
    }
    return YES;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
