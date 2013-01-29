CategoricallyEvil
=================

Objective-C categories that are pure evil.  

## Method Swizzling ##
It seemed right to kick this project off with a most baneful category, and that is adding a swizzle method to NSObject.

### Usage ###
```
// import the evil header
#import "SSCategoricallyEvil.h"

// swizzle two methods
NSString *basicString = @"I'm a string";
  
[basicString swizzleMe:@selector(uppercaseString) andNewMethod:@selector(lowercaseString)];
  
// let the evil flow through your code
NSString *result1 = [basicString uppercaseString];
NSString *result2 = [basicString lowercaseString];

```
More on method swizzling at <http://cocoadev.com/wiki/MethodSwizzling>
