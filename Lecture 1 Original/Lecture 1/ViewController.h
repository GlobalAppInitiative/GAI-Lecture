//
//  ViewController.h
//  Lecture 1
//
//  Created by Timothy Chong on 9/20/13.
//  Copyright (c) 2013 Timothy Chong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong,nonatomic) NSTimer * timer;
@property (weak, nonatomic) IBOutlet UITextField *messageTextField;
- (IBAction)send:(id)sender;
@property (weak, nonatomic) IBOutlet UITextView *messageOutputView;
- (IBAction)blueButtonClicked:(id)sender;
- (IBAction)redButtonClicked:(id)sender;
- (IBAction)yellowButtonClicked:(id)sender;
- (IBAction)discoButtonClicked:(id)sender;

@end
