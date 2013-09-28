//
//  ViewController.m
//  Lecture 1
//
//  Created by Timothy Chong on 9/20/13.
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

- (IBAction)send:(id)sender {
    
    // Getting text from textfield.
    NSString * str = self.messageTextField.text;
    
    //
    self.messageOutputView.text = str;
    
    [self.messageTextField resignFirstResponder];
    
    self.messageTextField.text = @"";
    
}
- (IBAction)blueButtonClicked:(id)sender {
    if(self.timer)
       [self.timer invalidate];
    self.view.backgroundColor = [UIColor blueColor];
}

- (IBAction)redButtonClicked:(id)sender {
    if(self.timer)
        [self.timer invalidate];
    self.view.backgroundColor = [UIColor redColor];
}

- (IBAction)yellowButtonClicked:(id)sender {
    if(self.timer)
        [self.timer invalidate];
    self.view.backgroundColor = [UIColor yellowColor];
} 


- (IBAction)discoButtonClicked:(id)sender {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(changeColor) userInfo:nil repeats:YES];
}

-(void)changeColor
{
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    self.view.backgroundColor = color;
}

@end
