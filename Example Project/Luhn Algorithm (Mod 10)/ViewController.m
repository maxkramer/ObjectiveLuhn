//
//  ViewController.m
//  Luhn Algorithm (Mod 10)
//
//  Created by Max Kramer on 30/12/2012.
//  Copyright (c) 2012 Max Kramer. All rights reserved.
//

#import "ViewController.h"
#import "Luhn.h"

@implementation ViewController

- (void)viewDidLoad {
    // a valid number to test out is: "49927398716".
    [self.resultLabel setAlpha:0.0f];
    [self.validateButton addTarget:self action:@selector(textFieldShouldReturn:) forControlEvents:UIControlEventTouchUpInside];
    
    [super viewDidLoad];
}

- (BOOL) textFieldShouldReturn:(UITextField *)_textField {
    [self.textField resignFirstResponder];
    if (self.textField.text.length < 1) {
        return YES;
    }
    
    BOOL isValid = [self.textField.text ol_isValidCreditCardNumber];
    [self.resultLabel setText:[NSString stringWithFormat:@"The number you entered is %@!", isValid ? @"valid" : @"isn't valid"]];
    
    [UIView animateWithDuration:0.5f delay:0.0f options:UIViewAnimationOptionAutoreverse animations:^{
        [self.resultLabel setAlpha:1.0f];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.5f animations:^{
            [self.resultLabel setAlpha:1.0f];
        }];
    }];
    return YES;
}

@end
