//
//  BelbinTableViewViewController.h
//  Nugget
//
//  Created by Alexis Katigbak on 2013-10-22.
//  Copyright (c) 2013 Alexis Katigbak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BelbinTableViewViewController : UITableViewController {
    NSMutableArray *belbinroles;
    IBOutlet UITableView *tblSimpleTable;

}
- (IBAction) EditTable:(id)sender;

@end
