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
@synthesize name = _name;
@synthesize email = _email;
@synthesize topbelbin = _topbelbin;
extern int currentUserID;


extern int currentUserID;

- (void)viewDidLoad
{
    [super viewDidLoad];


    
    
}

-(void) viewWillAppear:(BOOL)animated
{
    skills = [[NSMutableArray alloc] init];
    NSArray *names = [_cname componentsSeparatedByString: @" "];
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:[names objectAtIndex:0],@"first", [names objectAtIndex:1], @"last", nil];
    
    
    //get contact details
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:[NSString stringWithFormat:@"http://localhost:8888/getcontactprofile.php?format=json"]
      parameters:parameters
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             //NSLog(@"%@", responseObject);
             NSArray *jsonDict = (NSArray *) responseObject;
             //NSLog (@"ARR %@", jsonDict);
             NSDictionary *dictzero = [jsonDict objectAtIndex:0];
             _email.text = [dictzero objectForKey:@"Email_address"];
             _name.text = [NSString stringWithFormat:@"%@ %@",[dictzero objectForKey:@"Given_name"], [dictzero objectForKey:@"Family_name"]];
             _topbelbin.text = [dictzero objectForKey:@"Most_suitable_Brole"];
             _memberID = [dictzero objectForKey:@"Member_ID"];
             
             
             //get  contact skills
             NSDictionary *parameters2 = [NSDictionary dictionaryWithObjectsAndKeys:_memberID, @"currentID", nil];
             AFHTTPRequestOperationManager *manager2 = [AFHTTPRequestOperationManager manager];
             [manager2 GET:[NSString stringWithFormat:@"http://localhost:8888/getskills.php?format=json"]
                parameters:parameters2
                   success:^(AFHTTPRequestOperation *operation, id responseObject) {
                       NSArray *jsonDict = (NSArray *) responseObject;
                       for (int i = 0; i < [jsonDict count]; i++)
                       {
                           NSDictionary *dictzero = [jsonDict objectAtIndex:i];
                           [skills addObject:[NSString stringWithFormat:@"%@",[dictzero objectForKey:@"Expertise_Name"]]];
                       }
                       [skillsTableView reloadData];
                       NSLog(@"%@", skills);
                       
                   }
                   failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                       UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Error Retrieving JSON" message:[NSString stringWithFormat:@"%@", error] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                       [av show];
                   }];
         }
         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Error Retrieving JSON" message:[NSString stringWithFormat:@"%@", error] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
             [av show];
         }];
    
    


    
    

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
    

    
    return cell;
    
    
}

- (IBAction)Save:(id)sender
{
    //saves endorsement here
    //if value = 0 delete from endorsements table
    //if value > 0 and exists then use update
    //if value < 0 and dne then create new entry
    
}



@end
