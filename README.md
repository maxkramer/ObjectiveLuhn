Luhn Algorithm
==============

[![Build Status](https://travis-ci.org/MaxKramer/ObjectiveLuhn.png?branch=master)](https://travis-ci.org/MaxKramer/ObjectiveLuhn)

This is just a quick port of the Luhn Algorithm, generally used for validating Credit Card details, to Objective-C (iOS).

I have included an example project showing how the method is called and how the validation can be interpreted.

To validate the details all you need to do is import the header file:

```obj-c
#import "Luhn.h"
```
    
And then call the class method which returns a boolean value depending on the validity of the input string:

```obj-c
BOOL isValid = [Luhn validateString:@"some credit card number"];
    
if (isValid) {
    // process payment   
}
else {
    // alert user
}
```


If you come across any issues or have a feature request, please open an issue or find me on:

Twitter: [@maxkramer](http://twitter.com/maxkramer)

Website: [http://maxkramer.co](http://maxkramer.co)

## Sources

Paypal for their test credit card numbers: [http://www.paypalobjects.com/en_US/vhelp/paypalmanager_help/credit_card_numbers.htm](http://www.paypalobjects.com/en_US/vhelp/paypalmanager_help/credit_card_numbers.htm)

## License

This project complies with the [MIT license](https://github.com/MaxKramer/LuhnAlgorithm/blob/master/LICENSE).
