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
#import "NSDictionary+ELBSafe.h"

@interface NSDictionary_ELBSafeTest : XCTestCase

@end

@implementation NSDictionary_ELBSafeTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)testSafeNSArrayForKey {
    NSDictionary *testDictionary = @{
                                     @"null" : [NSNull null],
                                     @"number" : @1,
                                     @"string" : @"string",
                                     @"array" : @[],
                                     @"dictionary" : @{},
                                     };
    
    XCTAssertNil([testDictionary safeNSArrayForKey:@"null"]);
    XCTAssertNil([testDictionary safeNSArrayForKey:@"number"]);
    XCTAssertNil([testDictionary safeNSArrayForKey:@"string"]);
    XCTAssertNil([testDictionary safeNSArrayForKey:@"dictionary"]);
    XCTAssertNotNil([testDictionary safeNSArrayForKey:@"array"]);
    
    XCTAssertNil([testDictionary safeNSDictionaryForKey:@"null"]);
    XCTAssertNil([testDictionary safeNSDictionaryForKey:@"number"]);
    XCTAssertNil([testDictionary safeNSDictionaryForKey:@"string"]);
    XCTAssertNil([testDictionary safeNSDictionaryForKey:@"array"]);
    XCTAssertNotNil([testDictionary safeNSDictionaryForKey:@"dictionary"]);
    
    XCTAssertNil([testDictionary safeNSNumberForKey:@"null"]);
    XCTAssertNil([testDictionary safeNSNumberForKey:@"array"]);
    XCTAssertNil([testDictionary safeNSNumberForKey:@"string"]);
    XCTAssertNil([testDictionary safeNSNumberForKey:@"dictionary"]);
    XCTAssertNotNil([testDictionary safeNSNumberForKey:@"number"]);
    
    XCTAssertNil([testDictionary safeNSStringForKey:@"null"]);
    XCTAssertNil([testDictionary safeNSStringForKey:@"number"]);
    XCTAssertNil([testDictionary safeNSStringForKey:@"array"]);
    XCTAssertNil([testDictionary safeNSStringForKey:@"dictionary"]);
    XCTAssertNotNil([testDictionary safeNSStringForKey:@"string"]);
}


-(void)testSafeObjectForKeyForTargetClass {
    NSDictionary *testDictionary = @{
                                     @"null" : [NSNull null],
                                     @"number" : @1,
                                     @"string" : @"string",
                                     @"array" : @[],
                                     @"dictionary" : @{},
                                     };
    
    XCTAssertNotNil([testDictionary safeObjectForKey:@"null" forTargetClass:[NSNull class]]);
    XCTAssertNotNil([testDictionary safeObjectForKey:@"number" forTargetClass:[NSNumber class]]);
    XCTAssertNotNil([testDictionary safeObjectForKey:@"string" forTargetClass:[NSString class]]);
    XCTAssertNotNil([testDictionary safeObjectForKey:@"dictionary" forTargetClass:[NSDictionary class]]);
    XCTAssertNotNil([testDictionary safeObjectForKey:@"array" forTargetClass:[NSArray class]]);
    
    XCTAssertNil([testDictionary safeObjectForKey:@"null" forTargetClass:[NSNumber class]]);
    XCTAssertNil([testDictionary safeObjectForKey:@"number" forTargetClass:[NSDictionary class]]);
    XCTAssertNil([testDictionary safeObjectForKey:@"string" forTargetClass:[NSNumber class]]);
    XCTAssertNil([testDictionary safeObjectForKey:@"dictionary" forTargetClass:[NSNumber class]]);
    XCTAssertNil([testDictionary safeObjectForKey:@"array" forTargetClass:[NSNumber class]]);
}


@end
