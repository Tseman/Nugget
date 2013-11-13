//
//  SkillsView.h
//  Nugget
//
//  Created by Alexis Katigbak on 2013-10-30.
//  Copyright (c) 2013 Alexis Katigbak. All rights reserved.
//  customer view controller that allows viewing of skills from a custom contact cell

#import <UIKit/UIKit.h>

@interface SkillsView : UIViewController <UITableViewDataSource, UITableViewDelegate>

{
    NSMutableArray *skills;
    IBOutlet UITableView *skillsTableView;
}
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *email;
@property (weak, nonatomic) IBOutlet UILabel *topbelbin;
@property (nonatomic, copy) NSString *cname;
@property (weak, nonatomic) NSString *memberID;
- (IBAction)Save:(id)sender;

@end


