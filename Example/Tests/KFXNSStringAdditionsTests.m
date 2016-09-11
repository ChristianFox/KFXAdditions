//
//  KFXNSStringAdditionsTests.m
//  KFXAdditions
//
//  Created by Eyeye on 14/08/2016.
//  Copyright © 2016 Christian Fox. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+KFXAdditions.h"


@interface KFXNSStringAdditionsTests : XCTestCase

@end

@implementation KFXNSStringAdditionsTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testStringByCombingComponents{
    
    
    NSArray *components = @[@"Hello",@"World!",@"How",@"are",@"you?"];
    NSString *result = [NSString kfx_stringByCombiningComponents:components separatedByString:@" "];
    XCTAssertEqualObjects(result, @"Hello World! How are you?");
}


@end
