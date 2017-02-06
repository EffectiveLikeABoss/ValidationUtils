//
//  ELBInputValidatorSafeDecorator.m
//  ValidationUtils
//
//  Created by David Costa Gonçalves on 04/02/17.
//  Copyright © 2017 Effective Like ABoss. All rights reserved.
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
