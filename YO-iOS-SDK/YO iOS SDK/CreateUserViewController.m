//
//  CreateUserViewController.m
//  YO iOS SDK
//
//  Created by Nathan Lam on 11/15/14.
//  Copyright (c) 2014 yiqin. All rights reserved.
//

#import "CreateUserViewController.h"
#import <Parse/Parse.h>
#import "YO.h"
@interface CreateUserViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;

@end

@implementation CreateUserViewController
- (IBAction)enterButtonClicked:(id)sender {
    [self createUser:_usernameField.text withPassword:_passwordField.text];
}

- (void)createUser:(NSString *)username withPassword:(NSString *)password {
    PFUser *user = [PFUser user];
    
    if (username.length == 0 || password.length == 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Submission Failure" message:@"Invalid username or password." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        return;
    }
    user.username = username;
    user.password = password;
    
    _roommates = [[NSMutableArray alloc] init];
    _couchBuddies = [[NSMutableArray alloc] init];
    
    user[@"roommates"] = _roommates;
    user[@"couchBuddies"] = _couchBuddies;
    
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            [self dismissViewControllerAnimated:YES completion:nil];
        } else {
            NSString *errorString = [error userInfo][@"error"];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Submission Fail" message:errorString delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
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

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == _usernameField)
    {
        [_passwordField becomeFirstResponder];
    }
    else
    {
        [self createUser:_usernameField.text withPassword:_passwordField.text];
        [textField resignFirstResponder];
    }
    return YES;
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
