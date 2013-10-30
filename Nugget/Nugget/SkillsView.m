//
//  SkillsView.m
//  Nugget
//
//  Created by Alexis Katigbak on 2013-10-30.
//  Copyright (c) 2013 Alexis Katigbak. All rights reserved.
//

#import "SkillsView.h"
#import "SkillCell.h"

@implementation SkillsView

- (void)viewDidLoad
{
    [super viewDidLoad];
    skills = [[NSMutableArray alloc] init];
    [skills addObject:@"Skill1"];
    [skills addObject:@"Skill2"];
    [skills addObject:@"Skill3"];
    [skills addObject:@"Skill4"];
    [skills addObject:@"Skill5"];
    

    
    
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
