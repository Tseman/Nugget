//
//  RatersView.m
//  Nugget
//
//  Created by Alexis Katigbak on 2013-11-07.
//  Copyright (c) 2013 Alexis Katigbak. All rights reserved.
//

#import "RatersView.h"
#import "ContactCell.h"
#import "AFNetworking.h"

@implementation RatersView
extern int currentUserID;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    
    
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:[NSString stringWithFormat:@"%i", currentUserID],@"currentID", @"HR Management",@"skillname",nil];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:[NSString stringWithFormat:@"http://localhost:8888/getraters.php?format=json"]
      parameters:parameters
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             NSLog(@"%@", responseObject);
             NSArray *jsonDict = (NSArray *) responseObject;
             for (int i = 0; i < [jsonDict count]; i++)
             {
                 NSDictionary *dictzero = [jsonDict objectAtIndex:i];
                 [contact addObject:[NSString stringWithFormat:@"%@ %@",[dictzero objectForKey:@"Given_name"], [dictzero objectForKey:@"Family_name"]]];
                 NSLog(@"%@", contact);
             }
             
             
         }
         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Error Retrieving JSON" message:[NSString stringWithFormat:@"%@", error] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
             [av show];
         }];
    }
    return self;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //create contact cell here
    
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
