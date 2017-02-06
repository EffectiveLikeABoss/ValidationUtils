//
//  This is free and unencumbered software released into the public domain.
//
//  Anyone is free to copy, modify, publish, use, compile, sell, or
//  distribute this software, either in source code form or as a compiled
//  binary, for any purpose, commercial or non-commercial, and by any
//  means.

//  In jurisdictions that recognize copyright laws, the author or authors
//  of this software dedicate any and all copyright interest in the
//  software to the public domain. We make this dedication for the benefit
//  of the public at large and to the detriment of our heirs and
//  successors. We intend this dedication to be an overt act of
//  relinquishment in perpetuity of all present and future rights to this
//  software under copyright law.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
//  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
//  IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
//  OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
//  ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
//  OTHER DEALINGS IN THE SOFTWARE.
//
//  For more information, please refer to <http://unlicense.org>
//
//  Created by Effective Like ABoss
//

#import "ELBInputValidator.h"
#import "NSDate+ELBZeroTime.h"

@implementation ELBInputValidator

-(BOOL)isValidEmail:(NSString*)email{
    if (email) {
        if(email.length == 0){
            return NO;
        }
        NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", @".+@.+\\.[A-Za-z-]{2}[A-Za-z]*"];
        return [emailTest evaluateWithObject:email];
    }
    return NO;
}

-(BOOL)isDate:(NSDate*)firstDate biggerThanDate:(NSDate*)secondDate{
    NSComparisonResult result = [[firstDate resetTimeToZero] compare:[secondDate resetTimeToZero]];
    if(result==NSOrderedAscending || result==NSOrderedSame)
        return NO;
    else
        return YES;
}

-(BOOL)isDate:(NSDate*)firstDate equalsToDate:(NSDate*)secondDate{
    NSComparisonResult result = [[firstDate resetTimeToZero] compare:[secondDate resetTimeToZero]];
    if(result!=NSOrderedSame)
        return NO;
    else
        return YES;
}

-(BOOL)isDate:(NSDate*)firstDate biggerOrEqualsThanDate:(NSDate*)secondDate{
    NSComparisonResult result = [[firstDate resetTimeToZero] compare:[secondDate resetTimeToZero]];
    if(result==NSOrderedAscending)
        return NO;
    else
        return YES;
}

-(BOOL)isDateTime:(NSDate*)firstDate biggerThanDateTime:(NSDate*)secondDate{
    return [firstDate timeIntervalSinceDate:secondDate] > 0;
}

-(BOOL)isDateTime:(NSDate*)firstDate biggerOrEqualsThanDateTime:(NSDate*)secondDate{
    return [firstDate timeIntervalSinceDate:secondDate] >= 0;
}

-(BOOL)isTime:(NSDate*)firstTime biggerThanTime:(NSDate*)secondTime{
    NSComparisonResult result = [[firstTime resetDateToCurrent] compare:[secondTime resetDateToCurrent]];
    if(result==NSOrderedAscending || result==NSOrderedSame)
        return NO;
    else
        return YES;
}

-(BOOL)isTime:(NSDate*)firstTime biggerOrEqualsThanTime:(NSDate*)secondTime{
    NSComparisonResult result = [[firstTime resetDateToCurrent] compare:[secondTime resetDateToCurrent]];
    if(result==NSOrderedAscending)
        return NO;
    else
        return YES;
}

-(BOOL)isValidString:(NSString*)string{
    return string && string.length != 0;
}

-(BOOL)isValidString:(NSString*)string withMinLenght:(NSUInteger)minLenght{
    return string && string.length >= minLenght;
}

-(BOOL)isValidPositiveDecimal:(NSNumber*)decimal{
    return decimal && decimal.doubleValue > 0;
}

-(BOOL)isValidPositiveNumber:(NSNumber*)number{
    return number && number.integerValue > 0;
}


-(BOOL)isEmptyString:(NSString*)string {
    NSCharacterSet *inverted = [[NSCharacterSet whitespaceAndNewlineCharacterSet] invertedSet];
    NSRange range = [string rangeOfCharacterFromSet:inverted];
    return (range.location == NSNotFound);
}

@end
