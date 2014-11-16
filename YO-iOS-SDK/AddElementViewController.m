//
//  AddElementViewController.m
//  YO iOS SDK
//
//  Created by Nathan Lam on 11/15/14.
//  Copyright (c) 2014 yiqin. All rights reserved.
//

#import "AddElementViewController.h"
#import <Parse/Parse.h>

@interface AddElementViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation AddElementViewController

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"unwindDoneToExit"]) {
        PFUser *currentUser = [PFUser currentUser];
        if (_roommates)
        {
            [currentUser[@"roommates"] addObject:self.textField.text];
        }
        else
        {
            [currentUser[@"couchBuddies"] addObject:self.textField.text];
        }
        [currentUser saveInBackground];
    }
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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self performSegueWithIdentifier:@"unwindDoneToExit" sender:self];
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
