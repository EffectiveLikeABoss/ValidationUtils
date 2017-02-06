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
#import "NSDate+ELBZeroTime.h"

@interface ELBInputValidatorTest : XCTestCase

@end

@implementation ELBInputValidatorTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


- (void)testIsValidEmail {
    id<IELBInputValidator> validator= [ELBInputValidatorFactory getValidator:ELBIVNormal];
    
    XCTAssertThrows([validator isValidEmail:[NSNull null]]);
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

- (void)testIsValidString {
    id<IELBInputValidator> validator= [ELBInputValidatorFactory getValidator:ELBIVNormal];
    
    XCTAssertThrows([validator isValidString:[NSNull null]]);
    XCTAssertFalse([validator isValidString:nil]);
    
    XCTAssertFalse([validator isValidString:@""]);
    XCTAssertTrue([validator isValidString:@"a"]);
}

- (void)testIsValidStringWithMinLenght {
    id<IELBInputValidator> validator= [ELBInputValidatorFactory getValidator:ELBIVNormal];
    
    XCTAssertThrows([validator isValidString:[NSNull null] withMinLenght:0]);
    XCTAssertThrows([validator isValidString:[NSNull null] withMinLenght:1]);
    
    XCTAssertFalse([validator isValidString:nil withMinLenght:0]);
    XCTAssertFalse([validator isValidString:nil withMinLenght:1]);
    
    
    XCTAssertTrue([validator isValidString:@"a" withMinLenght:0]);
    XCTAssertTrue([validator isValidString:@"a" withMinLenght:1]);
    XCTAssertTrue([validator isValidString:@"aa" withMinLenght:1]);
    
    XCTAssertFalse([validator isValidString:@"a" withMinLenght:2]);
    
    XCTAssertTrue([validator isValidEmail:@"aaaaa@aaaaaa.aaa"]);
}

- (void)testIsValidPositiveDecimal {
    id<IELBInputValidator> validator= [ELBInputValidatorFactory getValidator:ELBIVNormal];
    
    XCTAssertThrows([validator isValidPositiveDecimal:[NSNull null]]);
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

- (void)testIsValidPositiveNumber {
    id<IELBInputValidator> validator= [ELBInputValidatorFactory getValidator:ELBIVNormal];
    
    XCTAssertThrows([validator isValidPositiveNumber:[NSNull null]]);
    XCTAssertFalse([validator isValidPositiveNumber:nil]);
    
    XCTAssertFalse([validator isValidPositiveNumber:@-1]);
    XCTAssertFalse([validator isValidPositiveNumber:@0]);
    XCTAssertFalse([validator isValidPositiveNumber:@0.4]);
    XCTAssertFalse([validator isValidPositiveNumber:@0.5]);
    XCTAssertTrue([validator isValidPositiveNumber:@1]);
}

- (void)testIsEmptyString {
    id<IELBInputValidator> validator= [ELBInputValidatorFactory getValidator:ELBIVNormal];
    
    XCTAssertThrows([validator isEmptyString:[NSNull null]]);
    XCTAssertFalse([validator isEmptyString:nil]);
    
    XCTAssertTrue([validator isEmptyString:@""]);
    XCTAssertFalse([validator isEmptyString:@"a"]);
}



-(void)testIsDateEqualsToDate{
    id<IELBInputValidator> validator= [ELBInputValidatorFactory getValidator:ELBIVNormal];
    NSDate *now = [NSDate date];
    NSDate *after = [NSDate dateWithTimeInterval:3600*24*1 sinceDate:now];
    NSDate *before = [NSDate dateWithTimeInterval:-(3600*24*1) sinceDate:now];
    NSDate *afterMili = [NSDate dateWithTimeInterval:1 sinceDate:now];
    NSDate *beforeMili = [NSDate dateWithTimeInterval:-1 sinceDate:now];
    
    XCTAssertTrue([validator isDate:now equalsToDate:now]);
    XCTAssertFalse([validator isDate:now equalsToDate:after]);
    XCTAssertFalse([validator isDate:now equalsToDate:before]);
    XCTAssertTrue([validator isDate:now equalsToDate:afterMili]);
    XCTAssertTrue([validator isDate:now equalsToDate:beforeMili]);
}

-(void)testIsDateBiggerThanDate{
    id<IELBInputValidator> validator= [ELBInputValidatorFactory getValidator:ELBIVNormal];
    NSDate *now = [NSDate date];
    NSDate *after = [NSDate dateWithTimeInterval:3600*24*1 sinceDate:now];
    NSDate *before = [NSDate dateWithTimeInterval:-(3600*24*1) sinceDate:now];
    NSDate *afterMili = [NSDate dateWithTimeInterval:1 sinceDate:now];
    NSDate *beforeMili = [NSDate dateWithTimeInterval:-1 sinceDate:now];
    
    XCTAssertFalse([validator isDate:now biggerThanDate:now]);
    XCTAssertFalse([validator isDate:now biggerThanDate:after]);
    XCTAssertTrue([validator isDate:now biggerThanDate:before]);
    XCTAssertFalse([validator isDate:now biggerThanDate:afterMili]);
    XCTAssertFalse([validator isDate:now biggerThanDate:beforeMili]);
}

-(void)testIsDateBiggerOrEqualsThanDate{
    id<IELBInputValidator> validator= [ELBInputValidatorFactory getValidator:ELBIVNormal];
    NSDate *now = [NSDate date];
    NSDate *after = [NSDate dateWithTimeInterval:3600*24*1 sinceDate:now];
    NSDate *before = [NSDate dateWithTimeInterval:-(3600*24*1) sinceDate:now];
    NSDate *afterMili = [NSDate dateWithTimeInterval:1 sinceDate:now];
    NSDate *beforeMili = [NSDate dateWithTimeInterval:-1 sinceDate:now];
    
    XCTAssertTrue([validator isDate:now biggerOrEqualsThanDate:now]);
    XCTAssertFalse([validator isDate:now biggerOrEqualsThanDate:after]);
    XCTAssertTrue([validator isDate:now biggerOrEqualsThanDate:before]);
    XCTAssertTrue([validator isDate:now biggerOrEqualsThanDate:afterMili]);
    XCTAssertTrue([validator isDate:now biggerOrEqualsThanDate:beforeMili]);
}

-(void)testIsDateTimeBiggerThanDateTime{
    id<IELBInputValidator> validator= [ELBInputValidatorFactory getValidator:ELBIVNormal];
    NSDate *now = [NSDate date];
    NSDate *after = [NSDate dateWithTimeInterval:3600*24*1 sinceDate:now];
    NSDate *before = [NSDate dateWithTimeInterval:-(3600*24*1) sinceDate:now];
    NSDate *afterMili = [NSDate dateWithTimeInterval:1 sinceDate:now];
    NSDate *beforeMili = [NSDate dateWithTimeInterval:-1 sinceDate:now];
    NSDate *afterMin = [NSDate dateWithTimeInterval:60 sinceDate:now];
    NSDate *beforeMin = [NSDate dateWithTimeInterval:-60 sinceDate:now];
    
    XCTAssertFalse([validator isDateTime:now biggerThanDateTime:now]);
    XCTAssertFalse([validator isDateTime:now biggerThanDateTime:after]);
    XCTAssertTrue([validator isDateTime:now biggerThanDateTime:before]);
    XCTAssertFalse([validator isDateTime:now biggerThanDateTime:afterMili]);
    XCTAssertTrue([validator isDateTime:now biggerThanDateTime:beforeMili]);
    XCTAssertFalse([validator isDateTime:now biggerThanDateTime:afterMin]);
    XCTAssertTrue([validator isDateTime:now biggerThanDateTime:beforeMin]);
}

-(void)testIsDateTimeBiggerOrEqualsThanDateTime{
    id<IELBInputValidator> validator= [ELBInputValidatorFactory getValidator:ELBIVNormal];
    NSDate *now = [NSDate date];
    NSDate *after = [NSDate dateWithTimeInterval:3600*24*1 sinceDate:now];
    NSDate *before = [NSDate dateWithTimeInterval:-(3600*24*1) sinceDate:now];
    NSDate *afterMili = [NSDate dateWithTimeInterval:1 sinceDate:now];
    NSDate *beforeMili = [NSDate dateWithTimeInterval:-1 sinceDate:now];
    NSDate *afterMin = [NSDate dateWithTimeInterval:60 sinceDate:now];
    NSDate *beforeMin = [NSDate dateWithTimeInterval:-60 sinceDate:now];
    
    XCTAssertTrue([validator isDateTime:now biggerOrEqualsThanDateTime:now]);
    XCTAssertFalse([validator isDateTime:now biggerOrEqualsThanDateTime:after]);
    XCTAssertTrue([validator isDateTime:now biggerOrEqualsThanDateTime:before]);
    XCTAssertFalse([validator isDateTime:now biggerOrEqualsThanDateTime:afterMili]);
    XCTAssertTrue([validator isDateTime:now biggerOrEqualsThanDateTime:beforeMili]);
    XCTAssertFalse([validator isDateTime:now biggerOrEqualsThanDateTime:afterMin]);
    XCTAssertTrue([validator isDateTime:now biggerOrEqualsThanDateTime:beforeMin]);
}

-(void)testIsTimeBiggerThanTime{
    id<IELBInputValidator> validator= [ELBInputValidatorFactory getValidator:ELBIVNormal];
    NSDate *now = [NSDate date];
    NSDate *after = [NSDate dateWithTimeInterval:3600*24*1 sinceDate:now];
    NSDate *before = [NSDate dateWithTimeInterval:-(3600*24*1) sinceDate:now];
    NSDate *afterMili = [NSDate dateWithTimeInterval:1 sinceDate:now];
    NSDate *beforeMili = [NSDate dateWithTimeInterval:-1 sinceDate:now];
    NSDate *afterMin = [NSDate dateWithTimeInterval:60 sinceDate:now];
    NSDate *beforeMin = [NSDate dateWithTimeInterval:-60 sinceDate:now];
    
    XCTAssertFalse([validator isTime:now biggerThanTime:now]);
    XCTAssertFalse([validator isTime:now biggerThanTime:after]);
    XCTAssertFalse([validator isTime:now biggerThanTime:before]);
    XCTAssertFalse([validator isTime:now biggerThanTime:afterMili]);
    XCTAssertFalse([validator isTime:now biggerThanTime:beforeMili]);
    XCTAssertFalse([validator isTime:now biggerThanTime:afterMin]);
    XCTAssertTrue([validator isTime:now biggerThanTime:beforeMin]);
}

-(void)testIsTimeBiggerOrEqualsThanTime{
    id<IELBInputValidator> validator= [ELBInputValidatorFactory getValidator:ELBIVNormal];
    NSDate *now = [NSDate date];
    NSDate *after = [NSDate dateWithTimeInterval:3600*24*1 sinceDate:now];
    NSDate *before = [NSDate dateWithTimeInterval:-(3600*24*1) sinceDate:now];
    NSDate *afterMili = [NSDate dateWithTimeInterval:1 sinceDate:now];
    NSDate *beforeMili = [NSDate dateWithTimeInterval:-1 sinceDate:now];
    NSDate *afterMin = [NSDate dateWithTimeInterval:60 sinceDate:now];
    NSDate *beforeMin = [NSDate dateWithTimeInterval:-60 sinceDate:now];
    
    XCTAssertTrue([validator isTime:now biggerOrEqualsThanTime:now]);
    XCTAssertTrue([validator isTime:now biggerOrEqualsThanTime:after]);
    XCTAssertTrue([validator isTime:now biggerOrEqualsThanTime:before]);
    XCTAssertTrue([validator isTime:now biggerOrEqualsThanTime:afterMili]);
    XCTAssertTrue([validator isTime:now biggerOrEqualsThanTime:beforeMili]);
    XCTAssertFalse([validator isTime:now biggerOrEqualsThanTime:afterMin]);
    XCTAssertTrue([validator isTime:now biggerOrEqualsThanTime:beforeMin]);
}

@end
