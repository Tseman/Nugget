//
//  ContactCell.h
//  Nugget
//
//  Created by Alexis Katigbak on 2013-10-30.
//  Copyright (c) 2013 Alexis Katigbak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContactCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *skillLabel;
@property (nonatomic, weak) IBOutlet UIImageView *thumbnailImageView;

@end
