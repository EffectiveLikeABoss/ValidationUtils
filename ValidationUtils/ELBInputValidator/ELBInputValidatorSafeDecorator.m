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

#import "ELBInputValidatorSafeDecorator.h"

@implementation ELBInputValidatorSafeDecorator

-(BOOL)isValidEmail:(NSString*)email{
    if (email && [email isKindOfClass:[NSString class]]) {
        return [super isValidEmail:email];
    }
    return NO;
}

-(BOOL)isValidString:(NSString*)string{
    if (string && [string isKindOfClass:[NSString class]]) {
        return [super isValidString:string];
    }
    return NO;
}

-(BOOL)isValidString:(NSString*)string withMinLenght:(NSInteger)minLenght{
    if (string && [string isKindOfClass:[NSString class]]) {
        return [super isValidString:string withMinLenght:minLenght];
    }
    return NO;
}

-(BOOL)isValidPositiveDecimal:(NSNumber*)decimal{
    if (decimal && [decimal isKindOfClass:[NSNumber class]]) {
        return [super isValidPositiveDecimal:decimal];
    }
    return NO;
}

-(BOOL)isValidPositiveNumber:(NSNumber*)number{
    if (number && [number isKindOfClass:[NSNumber class]]) {
        return [super isValidPositiveNumber:number];
    }
    return NO;
}


-(BOOL)isEmptyString:(NSString*)string {
    if (string && [string isKindOfClass:[NSString class]]) {
        return [super isEmptyString:string];
    }
    return NO;
}

@end
