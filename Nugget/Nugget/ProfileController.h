//
//  Profile.h
//  Nugget
//
//  Created by Alexis Katigbak on 2013-11-03.
//  Copyright (c) 2013 Alexis Katigbak. All rights reserved.
//  profile page

#import <UIKit/UIKit.h>

@interface ProfileController : UIViewController <UITextFieldDelegate>
{}
@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *emailLabel;
@property (nonatomic, weak) IBOutlet UILabel *skill1RatingLabel;
@property (nonatomic, weak) IBOutlet UILabel *topBelbinLabel;
@end

