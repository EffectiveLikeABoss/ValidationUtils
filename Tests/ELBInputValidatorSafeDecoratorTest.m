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

#import <XCTest/XCTest.h>
#import "ELBInputValidatorFactory.h"

@interface ELBInputValidatorSafeDecoratorTest : XCTestCase

@end

@implementation ELBInputValidatorSafeDecoratorTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testSafeIsValidEmail {
    id<IELBInputValidator> validator= [ELBInputValidatorFactory getValidator:ELBIVSafe];
    
    XCTAssertFalse([validator isValidEmail:[NSNull null]]);
    XCTAssertFalse([validator isValidEmail:nil]);
    XCTAssertFalse([validator isValidEmail:@""]);
    XCTAssertFalse([validator isValidEmail:@"a@a.a"]);
    XCTAssertFalse([validator isValidEmail:@"aaaaa@a.a"]);
    XCTAssertFalse([validator isValidEmail:@"aaaaa@aaaaaa.a"]);
    XCTAssertTrue([validator isValidEmail:@"aaaaa@aaaaaa.aaa"]);
    XCTAssertFalse([validator isValidEmail:@"a@aaaaa.a"]);
    XCTAssertTrue([validator isValidEmail:@"a@aaaaa.aaaaaa"]);
    XCTAssertTrue([validator isValidEmail:@"aaaaaa@a.aaaaaa"]);
}

- (void)testSafeIsValidString {
    id<IELBInputValidator> validator= [ELBInputValidatorFactory getValidator:ELBIVSafe];
    
    XCTAssertFalse([validator isValidString:[NSNull null]]);
    XCTAssertFalse([validator isValidString:nil]);
    XCTAssertFalse([validator isValidString:@""]);
    XCTAssertTrue([validator isValidString:@"a"]);
}

- (void)testSafeIsValidStringWithMinLenght {
    id<IELBInputValidator> validator= [ELBInputValidatorFactory getValidator:ELBIVSafe];
    
    XCTAssertFalse([validator isValidString:[NSNull null] withMinLenght:0]);
    XCTAssertFalse([validator isValidString:[NSNull null] withMinLenght:1]);
    
    XCTAssertFalse([validator isValidString:nil withMinLenght:0]);
    XCTAssertFalse([validator isValidString:nil withMinLenght:1]);
    
    XCTAssertTrue([validator isValidString:@"a" withMinLenght:0]);
    XCTAssertTrue([validator isValidString:@"a" withMinLenght:1]);
    XCTAssertTrue([validator isValidString:@"aa" withMinLenght:1]);
    
    XCTAssertFalse([validator isValidString:@"a" withMinLenght:2]);
}

- (void)testSafeIsValidPositiveDecimal {
    id<IELBInputValidator> validator= [ELBInputValidatorFactory getValidator:ELBIVSafe];
    
    XCTAssertFalse([validator isValidPositiveDecimal:[NSNull null]]);
    XCTAssertFalse([validator isValidPositiveDecimal:nil]);
    XCTAssertFalse([validator isValidPositiveDecimal:@-1]);
    XCTAssertFalse([validator isValidPositiveDecimal:@-1.5]);
    XCTAssertFalse([validator isValidPositiveDecimal:@-1.4]);
    XCTAssertFalse([validator isValidPositiveDecimal:@-0.4]);
    XCTAssertFalse([validator isValidPositiveDecimal:@-0.5]);
    XCTAssertFalse([validator isValidPositiveDecimal:@0]);
    XCTAssertTrue([validator isValidPositiveDecimal:@0.4]);
    XCTAssertTrue([validator isValidPositiveDecimal:@0.5]);
    XCTAssertTrue([validator isValidPositiveDecimal:@1]);
}

- (void)testSafeIsValidPositiveNumber {
    id<IELBInputValidator> validator= [ELBInputValidatorFactory getValidator:ELBIVSafe];
    
    XCTAssertFalse([validator isValidPositiveNumber:[NSNull null]]);
    XCTAssertFalse([validator isValidPositiveNumber:nil]);
    XCTAssertFalse([validator isValidPositiveNumber:@-1]);
    XCTAssertFalse([validator isValidPositiveNumber:@0]);
    XCTAssertFalse([validator isValidPositiveNumber:@0.4]);
    XCTAssertFalse([validator isValidPositiveNumber:@0.5]);
    XCTAssertTrue([validator isValidPositiveNumber:@1]);
}

- (void)testSafeIsEmptyString {
    id<IELBInputValidator> validator= [ELBInputValidatorFactory getValidator:ELBIVSafe];
    
    XCTAssertFalse([validator isEmptyString:[NSNull null]]);
    XCTAssertFalse([validator isEmptyString:nil]);
    XCTAssertTrue([validator isEmptyString:@""]);
    XCTAssertFalse([validator isEmptyString:@"a"]);
}




@end
