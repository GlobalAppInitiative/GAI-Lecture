//
//  NewBookViewController.m
//  GAI Parse
//
//  Created by Timothy Chong on 2/28/14.
//  Copyright (c) 2014 Timothy Chong. All rights reserved.
//

#import "NewBookViewController.h"

@interface NewBookViewController ()

@property (nonatomic) NSArray * books;
@end

@implementation NewBookViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    PFRelation * relation = [[PFUser currentUser]relationForKey:@"books"];
    
    [relation.query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
       
        NSMutableArray * ids = [[NSMutableArray alloc]initWithCapacity:objects.count];
        for (PFObject * object in objects) {
            [ids addObject:[object objectId]];
        }
        PFQuery * query = [PFQuery queryWithClassName:@"Book"];
        [query whereKey:@"objectId" notContainedIn:ids];
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            self.books = objects;
            [self.tableView reloadData];
        }];
    }];
    
}

- (void)didReceiveMemoryWarning

{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.books.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    PFObject * book = self.books[indexPath.row];
    cell.textLabel.text = [book objectForKey:@"name"];
    // Configure the cell...
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    PFObject * onewBook = self.books[indexPath.row];
    
    PFRelation * relation = [[PFUser currentUser] relationForKey:@"books"];
    [relation addObject:onewBook];
    
    [[PFUser currentUser] saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        [self.navigationController popViewControllerAnimated:YES];
    }];
}

@end
