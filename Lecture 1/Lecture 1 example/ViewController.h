//
//  ViewController.h
//  Lecture 1 example
//
//  Created by Timothy Chong on 9/28/13.
//  Copyright (c) 2013 Timothy Chong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


@property (weak, nonatomic) IBOutlet UITextField *textField;

@property (weak, nonatomic) IBOutlet UILabel *label;

- (IBAction)buttonPressed:(id)sender;

@end
