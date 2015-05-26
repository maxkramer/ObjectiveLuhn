Luhn Algorithm
==============

[![Circle CI](https://circleci.com/gh/MaxKramer/ObjectiveLuhn/tree/master.svg?style=shield)](https://circleci.com/gh/MaxKramer/ObjectiveLuhn/tree/master)

This is a port of the Luhn Algorithm, generally used for validating Credit Card details, to Objective-C (iOS).

It's as simple as calling one single method; no special formatting is required.

You must run `pod install` before opening the Example Project's 'workspace.

## Instructions

Import the header:

```obj-c
#import "Luhn.h"
```
    
Call the class method returning a `BOOL` as to whether the string is valid or not:

```obj-c
BOOL isValid = [Luhn validateString:@"some credit card number"];
    
if (isValid) {
    // process payment   
}
else {
    // alert user
}
```

Alternatively, you can use the NSString category (no additional imports required):

```obj-c
NSString *ccNumber = @"378282246310005";
BOOL isValid = [ccNumber isValidCreditCardNumber];
```

You can also get the type of the credit card i.e. Visa, Diners, Amex, etc:

```obj-c
OLCreditCardType cardType = [ccNumber creditCardType];
// or
OLCreditCardType cardType = [Luhn typeFromString:ccNumber];
```

If you come across any issues or have a feature request, please open an issue or find me on:

Twitter: [@maxkramer](http://twitter.com/maxkramer)

Website: [http://maxkramer.co](http://maxkramer.co)

## Sources

|Name|Website|Reason|
|:---|:------|:-----|
|Paypal|[http://www.paypalobjects.com/en_US/vhelp/paypalmanager_help/credit_card_numbers.htm](http://www.paypalobjects.com/en_US/vhelp/paypalmanager_help/credit_card_numbers.htm)|List of valid credit card numbers for the unit tests|

## Thanks

Ayaka Nonaka for updating the Cocoapod spec and helping me with other aspects of the project!

Twitter: [@ayanonagon](https://twitter.com/ayanonagon)

## License

This project is licensed under the [MIT License](https://github.com/MaxKramer/ObjectiveLuhn/blob/master/LICENSE).
