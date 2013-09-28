//
//  ViewController.m
//  Lecture 1 example
//
//  Created by Timothy Chong on 9/28/13.
//  Copyright (c) 2013 Timothy Chong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

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

- (IBAction)buttonPressed:(id)sender {
    
    NSString * text = self.textField.text;
    self.label.text = text;
    self.textField.text = @"";
    [self.textField resignFirstResponder];
    
}
@end
