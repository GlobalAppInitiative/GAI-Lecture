//
//  Animal.h
//  Lecture 1
//
//  Created by Timothy Chong on 9/27/13.
//  Copyright (c) 2013 Timothy Chong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Animal : NSObject


@property (nonatomic) NSString * name;
@property (nonatomic) UIColor * bodyColor;
@property (nonatomic) double weight;
@property (nonatomic) int yearLifeSpan;
@property (nonatomic) BOOL cute;
@property (nonatomic) UIImage * image;
@property (nonatomic,weak) Animal * parents;

-(void) die;
-(void) move;
-(int) reduceLifeSpan:(int) year;

@end
