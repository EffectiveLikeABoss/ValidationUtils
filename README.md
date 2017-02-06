# ValidationUtils
Some validation functions for NSDate, NSString and NSNumber

**ELBInputValidatorFactory** factory to build validators

**ELBInputValidator** normal validator

**ELBInputValidatorSafeDecorator** decorator that alsos validates input class type

# Usuage

**Using a normal validator**
```
id<IELBInputValidator> validator= [ELBInputValidatorFactory getValidator:ELBIVNormal];
[validator isValidEmail:@""]; // returns NO
[validator isValidEmail:[NSNull null]]; // throws exception
```

**Using a safe validator**
```
id<IELBInputValidator> validator= [ELBInputValidatorFactory getValidator:ELBIVSafe];
[validator isValidEmail:@""]; // returns NO
[validator isValidEmail:[NSNull null]]; // returns NO
```











