//
//  SkillsEditController.m
//  Nugget
//
//  Created by Alexis Katigbak on 2013-10-30.
//  Copyright (c) 2013 Alexis Katigbak. All rights reserved.
//custom table view controller allows add and delete for skills

#import "SkillsEditController.h"

@interface SkillsEditController ()

@end

@implementation SkillsEditController

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

   //pull out skills data here. temporarily set to array of static values
    
    skillset = [[NSMutableArray alloc] init];
    [skillset addObject:@"Skill1"];
    [skillset addObject:@"Skill2"];
    [skillset addObject:@"Skill3"];
    [skillset addObject:@"Skill4"];
    [skillset addObject:@"Skill5"];
    
    self.title = @"Skills";
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertSkill)];

    self.navigationItem.rightBarButtonItem = addButton;
}

- (void) setEditing:(BOOL)editing animated:(BOOL)animated
{
    [super setEditing:editing animated:animated];
    [tblSkillstable setEditing:editing animated:animated];
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
    return [skillset count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"SCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    // Configure the cell...
    if (cell ==nil){
        cell = [[UITableViewCell alloc ]  initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
	cell.textLabel.text = [skillset objectAtIndex:indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (BOOL) tableView:(UITableView*) tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(editingStyle == UITableViewCellEditingStyleDelete)
    {
        //remove from array
        [skillset removeObjectAtIndex:indexPath.row];
        //remove from table view
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    }
}

- (void) insertSkill
{
    //insert skill by creating an alert view for user input
    UIAlertView *addAlert = [[UIAlertView alloc] initWithTitle:@"Enter new skill" message:@""delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    addAlert.alertViewStyle = UIAlertViewStylePlainTextInput;
    addAlert.show;
    
    
}

- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex == 0)
    {
        
    }
    else if (buttonIndex == 1)
    {
        //add to array and table view once the okay has been cleared in the alert
        NSString *temp = [alertView textFieldAtIndex:0].text;
        if(!skillset)
        {
            skillset = [[NSMutableArray alloc] init];
        }
        [skillset insertObject:temp atIndex:0];
        NSIndexPath *i = [NSIndexPath indexPathForRow:0 inSection:0];
        [self.tableView insertRowsAtIndexPaths:@[i] withRowAnimation:UITableViewRowAnimationAutomatic];
        
        
    }
}


@end
