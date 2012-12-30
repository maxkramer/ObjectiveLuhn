Luhn Algorithm
==============

This is just a quick port of the Luhn Algorithm, generally used for validating Credit Card details, to Objective-C (iOS).

I have included an example project showing how the method is called and how the validation can be interpreted.

To validate the details all you need to do is import the header file:

    #import "Luhn.h"
    
And then call the class method which returns a boolean value depending on the validity of the input string:

    BOOL isValid = [Luhn validateString:@"some credit card number"];
    
    if (isValid) {
       // process payment   
    }
    else {
       // alert user
    }

If you come across any issues or feel like a chat, you can contact me using the following methods:

Twitter: [@_max_k](http://twitter.com/_max_k)

Website: [http://maxkramer.co](http://maxkramer.co)

Email: [hello@maxkramer.co](mailto:hello@maxkramer.co)

##License

This project complies with the [MIT license](https://github.com/MaxKramer/LuhnAlgorithm/blob/master/LICENSE).

I accept no responsibility for any actions caused by this project or any of the files within this repository. Use at your own caution.