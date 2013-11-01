//
//  BelbinTableViewViewController.m
//  Nugget
//
//  Created by Alexis Katigbak on 2013-10-22.
//  Copyright (c) 2013 Alexis Katigbak. All rights reserved.
// custom table view controller allows reordering of belbin skills

#import "BelbinTableViewViewController.h"

@interface BelbinTableViewViewController ()

@end

@implementation BelbinTableViewViewController

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
    //static names for belbin roles
    belbinroles = [[NSMutableArray alloc] init];
    [belbinroles addObject:@"Plant"];
    [belbinroles addObject:@"Resource Investigator"];
    [belbinroles addObject:@"Coordinator"];
    [belbinroles addObject:@"Shaper"];
    [belbinroles addObject:@"Monitor"];
    [belbinroles addObject:@"Team Worker"];
    [belbinroles addObject:@"Implementor"];
    
    //create edit button in navigation bar
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithTitle:@"Edit" style:UIBarButtonItemStyleBordered target:self action:@selector(EditTable:)];
	[self.navigationItem setRightBarButtonItem:addButton];
    [super viewDidLoad];
}

- (IBAction) EditTable:(id)sender{
    //allow editing table
	if(self.editing)
	{
		[super setEditing:NO animated:NO];
		[tblSimpleTable setEditing:NO animated:NO];
		[tblSimpleTable reloadData];
		[self.navigationItem.leftBarButtonItem setTitle:@"Edit"];
		[self.navigationItem.leftBarButtonItem setStyle:UIBarButtonItemStylePlain];
	}
	else
	{
		[super setEditing:YES animated:YES];
		[tblSimpleTable setEditing:YES animated:YES];
		[tblSimpleTable reloadData];
		[self.navigationItem.leftBarButtonItem setTitle:@"Done"];
		[self.navigationItem.leftBarButtonItem setStyle:UIBarButtonItemStyleDone];
	}
}

- (BOOL)tableView:(UITableView *)tableview shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
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
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"BCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    if (cell ==nil){
        cell = [[UITableViewCell alloc ]  initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }

    
	cell.textLabel.text = [belbinroles objectAtIndex:indexPath.row];
    return cell;
    
    
   
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleNone;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{

    //rearrange belbin roles in the UI. currently doesnt save the result in the belbin array
    NSObject *item = [belbinroles objectAtIndex:fromIndexPath.row];
	[belbinroles removeObject:item];
	[belbinroles insertObject:item atIndex:toIndexPath.row];



}


- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}


@end
