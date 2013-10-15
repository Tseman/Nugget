//
//  PickerVIew.h
//  PickerView
//
//  Adapted from Nick Barrowclough on 05/01/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#define BELBIN 0

@interface PickerVIew : UIViewController

<UIPickerViewDataSource,UIPickerViewDelegate>{
    
    IBOutlet UIPickerView *BelbinPicker;
    
    NSMutableArray *arrayBelbin;
}
@property (weak, nonatomic) IBOutlet UITextField *textBox;
@property (strong, nonatomic) IBOutlet UIView *pickerViewContainer;


@end
