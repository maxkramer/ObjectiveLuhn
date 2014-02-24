//
//  ViewController.h
//  Luhn Algorithm (Mod 10)
//
//  Created by Max Kramer on 30/12/2012.
//  Copyright (c) 2012 Max Kramer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, weak) IBOutlet UILabel *resultLabel;
@property (nonatomic, weak) IBOutlet UITextField *textField;
@property (nonatomic, weak) IBOutlet UIButton *validateButton;

@end
