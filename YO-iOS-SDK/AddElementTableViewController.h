//
//  AddRoommateTableTableViewController.h
//  YO iOS SDK
//
//  Created by Nathan Lam on 11/15/14.
//  Copyright (c) 2014 yiqin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddElementTableViewController : UITableViewController <UITextFieldDelegate>

@property NSMutableArray *roommates;

- (IBAction)unwindToRoommateList:(UIStoryboardSegue *)segue;

@end
