//
//  Profile.m
//  Nugget
//
//  Created by Alexis Katigbak on 2013-11-03.
//  Copyright (c) 2013 Alexis Katigbak. All rights reserved.
//

#import "ProfileController.h"
#import "AFNetworking.h"
extern int currentUserID;


@implementation ProfileController

@synthesize emailLabel = _emailLabel;
@synthesize nameLabel = _nameLabel;
@synthesize topBelbinLabel = _topBelbinLabel;
@synthesize skill1RatingLabel = _skill1RatingLabel;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

-(IBAction)Returnkey:(id)sender
{
    [sender becomeFirstResponder];
    [sender resignFirstResponder];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:[NSString stringWithFormat:@"%i", currentUserID],@"currentID", nil];
    //sending request to php layer
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:[NSString stringWithFormat:@"http://localhost:8888/getprofile.php?format=json"]
      parameters:parameters
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             NSLog(@"%@", responseObject);
             //cast into NSdictionary and use the key 
         }
         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Error Retrieving JSON" message:[NSString stringWithFormat:@"%@", error] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
             [av show];
         }];
   
    _nameLabel.text = @"Name";
    _topBelbinLabel.text = @"Coordinator";
    _skill1RatingLabel.text = @"skill 1: rating";
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}



@end


