//
//  main.m
//  Nugget
//
//  Created by Alexis Katigbak on 2013-10-09.
//  Copyright (c) 2013 Alexis Katigbak. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"
int currentUserID;

int main(int argc, char * argv[])
{
    currentUserID = 10001;
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
