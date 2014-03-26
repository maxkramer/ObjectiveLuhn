//
//  Luhn.m
//  Luhn Algorithm (Mod 10)
//
//  Created by Max Kramer on 30/12/2012.
//  Copyright (c) 2012 Max Kramer. All rights reserved.
//

#import "Luhn.h"

@implementation NSString (Luhn)

- (BOOL) isValidCreditCardNumber {
    return [Luhn validateString:self];
}

- (OLCreditCardType) creditCardType {
    return [Luhn typeFromString:self];
}

@end

@interface NSString (Luhn_Private)

- (NSString *) formattedStringForProcessing;

@end

@implementation NSString (Luhn_Private)

- (NSString *) formattedStringForProcessing {
    NSCharacterSet *illegalCharacters = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    NSArray *components = [self componentsSeparatedByCharactersInSet:illegalCharacters];
    return [components componentsJoinedByString:@""];
}

@end

@implementation Luhn

+ (OLCreditCardType) typeFromString:(NSString *) string {
    BOOL valid = [string isValidCreditCardNumber];
    if (!valid) {
        return OLCreditCardTypeInvalid;
    }
    
    NSString *formattedString = [string formattedStringForProcessing];
    if (formattedString == nil || formattedString.length < 9) {
        return OLCreditCardTypeInvalid;
    }
    
    NSArray *enums = @[@(OLCreditCardTypeAmex), @(OLCreditCardTypeDinersClub), @(OLCreditCardTypeDiscover), @(OLCreditCardTypeJCB), @(OLCreditCardTypeMastercard), @(OLCreditCardTypeVisa)];
    
    __block OLCreditCardType type = OLCreditCardTypeInvalid;
    [enums enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        OLCreditCardType _type = [obj integerValue];
        NSPredicate *predicate = [Luhn predicateForType:_type];
        BOOL isCurrentType = [predicate evaluateWithObject:formattedString];
        if (isCurrentType) {
            type = _type;
            *stop = YES;
        }
    }];
    return type;
}

+ (NSPredicate *) predicateForType:(OLCreditCardType) type {
    if (type == OLCreditCardTypeInvalid || type == OLCreditCardTypeUnsupported) {
        return nil;
    }
    NSString *regex = nil;
    switch (type) {
        case OLCreditCardTypeAmex:
            regex = @"^3[47][0-9]{5,}$";
            break;
        case OLCreditCardTypeDinersClub:
            regex = @"^3(?:0[0-5]|[68][0-9])[0-9]{4,}$";
            break;
        case OLCreditCardTypeDiscover:
            regex = @"^6(?:011|5[0-9]{2})[0-9]{3,}$";
            break;
        case OLCreditCardTypeJCB:
            regex = @"^(?:2131|1800|35[0-9]{3})[0-9]{3,}$";
            break;
        case OLCreditCardTypeMastercard:
            regex = @"^5[1-5][0-9]{5,}$";
            break;
        case OLCreditCardTypeVisa:
            regex = @"^4[0-9]{6,}$";
            break;
        default:
            break;
    }
    return [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
}

+ (BOOL) validateString:(NSString *)string forType:(OLCreditCardType)type {
    return [Luhn typeFromString:string] == type;
}

+ (BOOL)validateString:(NSString *)string {
    NSString *formattedString = [string formattedStringForProcessing];
    if (formattedString == nil || formattedString.length < 9) {
        return NO;
    }
    
    NSMutableString *reversedString = [NSMutableString stringWithCapacity:[formattedString length]];
    
    [formattedString enumerateSubstringsInRange:NSMakeRange(0, [formattedString length]) options:(NSStringEnumerationReverse |NSStringEnumerationByComposedCharacterSequences) usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
        [reversedString appendString:substring];
    }];
    
    NSUInteger oddSum = 0, evenSum = 0;
    
    for (NSUInteger i = 0; i < [reversedString length]; i++) {
        NSInteger digit = [[NSString stringWithFormat:@"%C", [reversedString characterAtIndex:i]] integerValue];
        
        if (i % 2 == 0) {
            evenSum += digit;
        }
        else {
            oddSum += digit / 5 + (2 * digit) % 10;
        }
    }
    return (oddSum + evenSum) % 10 == 0;
}

@end