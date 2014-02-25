//
//  Luhn.h
//  Luhn Algorithm (Mod 10)
//
//  Created by Max Kramer on 30/12/2012.
//  Copyright (c) 2012 Max Kramer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Luhn : NSObject

+ (BOOL)validateString:(NSString *)string;

@end