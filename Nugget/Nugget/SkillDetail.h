//
//  SkillDetail.h
//  Nugget
//
//  Created by Alexis Katigbak on 2013-11-07.
//  Copyright (c) 2013 Alexis Katigbak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface SkillDetail : UIViewController 
{
    
}
@property (nonatomic, weak) IBOutlet UILabel *skillName;
@property (nonatomic, weak) IBOutlet UILabel *score;
@property (nonatomic, weak) IBOutlet NSString *passedval;
@property (strong, nonatomic) IBOutlet UITableView *ratersView;
@end
