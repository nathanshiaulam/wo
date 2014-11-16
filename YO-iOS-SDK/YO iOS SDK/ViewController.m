//
//  ViewController.m
//  YO iOS SDK
//
//  Created by yiqin on 7/26/14.
//  Copyright (c) 2014 yiqin. All rights reserved.
//

#import "ViewController.h"
#import "YO.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextField *receiver;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [_woButton setTitle:@"Wo." forState: nil];
    [_topLabel setText:@"Let your roommate(s) know."];
    
    
//    [self.view setBackgroundColor: [self colorWithHexString:@"9B59B6"]];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)sendYOAction:(id)sender
{
    [YO sendYOToIndividualUser:@"NLAM" toWebApp:@"http://104.236.56.103/"];
    
    
    /*****************************/
    // Send A Yo To All Subscribers (We don't send Yo to all here.)
//    [YO sendYO];
    
    // Count Total Subscribers
    [YO countTotalSubscribers];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
