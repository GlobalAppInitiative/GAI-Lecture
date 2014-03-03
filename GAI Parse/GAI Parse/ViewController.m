//
//  ViewController.m
//  GAI Parse
//
//  Created by Timothy Chong on 2/27/14.
//  Copyright (c) 2014 Timothy Chong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userNameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)registerUser:(id)sender {
    
    
    PFUser * user = [PFUser user];
    user.password = self.passwordField.text;
    user.username = self.userNameField.text;
    user.email = self.emailField.text;
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if(succeeded)
        {
            self.statusLabel.text = @"Succeeded";
        }else
        {
            self.statusLabel.text = @"Failed";
        }
    }];
    
}
@end
