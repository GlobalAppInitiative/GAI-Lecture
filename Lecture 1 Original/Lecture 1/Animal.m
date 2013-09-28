//
//  Animal.m
//  Lecture 1
//
//  Created by Timothy Chong on 9/27/13.
//  Copyright (c) 2013 Timothy Chong. All rights reserved.
//


#import "Animal.h"

@implementation Animal

-(void) die
{
    
}

-(void)move
{
    NSLog(@"I MOVED!");
}

-(int) reduceLifeSpan : (int)year
{
    self.yearLifeSpan = self.yearLifeSpan - year;
    return self.yearLifeSpan;
}
@end
