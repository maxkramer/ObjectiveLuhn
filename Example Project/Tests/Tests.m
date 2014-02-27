//
//  Tests.m
//  Tests
//
//  Created by Max Kramer on 24/02/2014.
//  Copyright (c) 2014 Max Kramer. All rights reserved.
//

#import "Kiwi.h"
#import "Luhn.h"

SPEC_BEGIN(LuhnSpec)

describe(@"Algorithm", ^{
    NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"TestCreditCardNumbers" ofType:@"plist"];
    NSDictionary *testValues = [NSDictionary dictionaryWithContentsOfFile:filePath];
    it(@"Should find that testValues is not null", ^{
        [[testValues should] beNonNil];
    });
    
    NSArray *validNumbers = testValues[@"valid"];
    it(@"Should find that valid numbers is not nil and the number of valid numbers is gt 0", ^{
        [[validNumbers should] beNonNil];
        [[@([validNumbers count]) should] beGreaterThan:@(0)];
    });
    
    NSArray *invalidNumbers = testValues[@"invalid"];
    it(@"Should find that invalid numbers is not nil and the number of invalid numbers is gt 0", ^{
        [[validNumbers should] beNonNil];
        [[@([validNumbers count]) should] beGreaterThan:@(0)];
    });

    [validNumbers enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
       it([NSString stringWithFormat:@"Should find that %@ is valid", obj], ^{
           BOOL valid = [Luhn validateString:obj] && [obj isValidCreditCardNumber];
           [[@(valid) should] beTrue];
       });
    }];
    
    [invalidNumbers enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        it([NSString stringWithFormat:@"Should find that %@ is invalid", obj], ^{
            BOOL valid = [Luhn validateString:obj] && [obj isValidCreditCardNumber];
            [[@(valid) should] beFalse];
        });
    }];
});

SPEC_END