//
//  LoginViewController.m
//  GAI Parse
//
//  Created by Timothy Chong on 2/28/14.
//  Copyright (c) 2014 Timothy Chong. All rights reserved.
//

#import "LoginViewController.h"
#import "MainViewController.h"
#import <Parse/Parse.h>

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userNameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;

@end

@implementation LoginViewController

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
    self.passwordField.secureTextEntry = YES;
}

-(void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    //Check if current user exists
    PFUser * currentUser = [PFUser currentUser];
    if (currentUser) {
        [self goToLoggedInViewController];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) goToLoggedInViewController
{
    MainViewController * mvc = [self.storyboard instantiateViewControllerWithIdentifier:@"MainViewController"];
    NSLog(@"%@", mvc);
    [self.navigationController pushViewController:mvc animated:YES];
}
- (IBAction)logIn:(id)sender {
    [PFUser logInWithUsernameInBackground:self.userNameField.text password:self.passwordField.text block:^(PFUser *user, NSError *error) {
       
        if (user) {
            [self goToLoggedInViewController];
        }else
        {
            UIAlertView * view = [[UIAlertView alloc]initWithTitle:@"Log In Erorr" message:@"Unable to Log in'" delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil];
            [view show];
        }
    }];
    
    
}

@end
