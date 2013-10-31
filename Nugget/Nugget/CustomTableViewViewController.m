//
//  CustomTableViewViewController.m
//  Nugget
//
//  Created by Alexis Katigbak on 2013-10-30.
//  Copyright (c) 2013 Alexis Katigbak. All rights reserved.
//

#import "CustomTableViewViewController.h"
#import "ContactCell.h"

@interface CustomTableViewViewController ()

@end

@implementation CustomTableViewViewController

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

    //query contact here
    
    contact = [[NSMutableArray alloc] init];
    [contact addObject:@"Shruti Kapoor"];
    [contact addObject:@"Alexis Katigbak"];
    [contact addObject:@"Allan Tse"];
    [contact addObject:@"Han Shi"];
    
    contactTableView.dataSource = self;
    contactTableView.delegate = self; 
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return [contact count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{


    static NSString *ccIdentifier = @"Cell";
    
    ContactCell *cell = [tableView dequeueReusableCellWithIdentifier:ccIdentifier];
    if (cell == nil)
    {
         cell = [[ContactCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ccIdentifier];

    }
    
    cell.nameLabel.text = [contact objectAtIndex:indexPath.row];
    cell.thumbnailImageView.image = [UIImage imageNamed:@"Potato.jpg"]; //change later to object at index
    cell.skillLabel.text = @"Skill1 (1), Skill2 (2), Skill3 (3), Skill4 (4), Skill (5)"; //change later from new mutable array
    
    return cell;
    
    
}


@end
