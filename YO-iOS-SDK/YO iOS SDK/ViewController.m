//
//  ViewController.m
//  YO iOS SDK
//
//  Created by yiqin on 7/26/14.
//  Copyright (c) 2014 yiqin. All rights reserved.
//

#import "ViewController.h"
#import "YO.h"
#import <Parse/Parse.h>

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextField *receiver;
@property PFUser *currentUser;
@end

@implementation ViewController



- (BOOL)userLoggedIn
{
    PFUser *currentUser = [PFUser currentUser];
    if (currentUser) {
        return YES;
    }
    return NO;
}

- (void)userLogOut
{
    [PFUser logOut];
    [self performSegueWithIdentifier:@"toUserLogin" sender:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [_woButton setTitle:@"Wo." forState: UIControlStateNormal];
    [_topLabel setText:@"Let your roommate(s) know."];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Logout" style:UIBarButtonItemStylePlain target:self action:@selector(userLogOut)];
    if (!self.userLoggedIn) {
        [self performSegueWithIdentifier:@"toUserLogin" sender:self];
    }
    
//    [self.view setBackgroundColor: [self colorWithHexString:@"9B59B6"]];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)sendYOAction:(id)sender
{
    PFUser *currentUser = [PFUser currentUser];
    NSMutableArray *roommates = currentUser[@"roommates"];
    for (NSString *roommate in roommates)
    {
        [YO sendYOToIndividualUser:roommate toWebApp:@"http://104.236.56.103/"];
    }
    
    /*****************************/
    // Send A Yo To All Subscribers (We don't send Yo to all here.)
    // [YO sendYO];
    
    // Count Total Subscribers
    [YO countTotalSubscribers];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
