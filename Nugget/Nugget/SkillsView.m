//
//  SkillsView.m
//  Nugget
//
//  Created by Alexis Katigbak on 2013-10-30.
//  Copyright (c) 2013 Alexis Katigbak. All rights reserved.
//
//  customer view controller that allows viewing of skills from a custom contact cell

#import "SkillsView.h"
#import "SkillCell.h"
#import "AFNetworking.h"

@implementation SkillsView


extern int currentUserID;

- (void)viewDidLoad
{
    [super viewDidLoad];
    skills = [[NSMutableArray alloc] init];
    [skills addObject:@"Skill1"];

    
    
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section.
    return [skills count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //view custom skillcell
    static NSString *ccIdentifier = @"Cell";
    
    SkillCell *cell = [tableView dequeueReusableCellWithIdentifier:ccIdentifier];
    if (cell == nil)
    {
        cell = [[SkillCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ccIdentifier];
        
    }
    
    cell.skillLabel.text = [skills objectAtIndex:indexPath.row];
    cell.resultLabel.text = @"Result";
    cell.rating.value = 3;
    
    return cell;
    
    
}

@end
