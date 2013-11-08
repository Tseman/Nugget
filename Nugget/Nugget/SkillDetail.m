//
//  SkillDetail.m
//  Nugget
//
//  Created by Alexis Katigbak on 2013-11-07.
//  Copyright (c) 2013 Alexis Katigbak. All rights reserved.
//

#import "SkillDetail.h"
#import "ContactCell.h"
#import "AFNetworking.h"
extern int currentUserID;

@interface SkillDetail ()

@end

@implementation SkillDetail
@synthesize skillName = _skillName;
@synthesize score = _score;
@synthesize passedval = _passedval;
@synthesize ratersView = _ratersView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    _ratersView.frame = CGRectMake(0, 134, 320, 390);

    
}

-(void) viewWillAppear:(BOOL)animated
{
    
    _skillName.text = _passedval;
    
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:[NSString stringWithFormat:@"%i", currentUserID],@"currentID", _passedval,@"skillname",nil];
    
    
    //sending request to php layer
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:[NSString stringWithFormat:@"http://localhost:8888/getrating.php?format=json"]
      parameters:parameters
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             NSLog(@"%@", responseObject);
             NSArray *jsonDict = (NSArray *) responseObject;
             //NSLog (@"ARR %@", jsonDict);
             NSDictionary *dictzero = [jsonDict objectAtIndex:0];
             _score.text = [dictzero objectForKey:@"Expertise_Rating"];
         }
         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Error Retrieving JSON" message:[NSString stringWithFormat:@"%@", error] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
             [av show];
         }];
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
