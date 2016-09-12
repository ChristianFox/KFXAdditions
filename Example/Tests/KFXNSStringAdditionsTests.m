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


//--------------------------------------------------------
#pragma mark - Percent Escaping Strings
//--------------------------------------------------------
-(void)testStringByAddingPercentEscapesUsingEncoding{
    
    
    CFStringEncoding encoding = kCFStringEncodingUTF8;
    
    NSString *firstWord = @"Hello";
    NSString *lastWord = @"World";
    
    NSArray *charactersToEscape = [@"! # $ & ' ( ) * + , / : ; = ? @ [ ]" componentsSeparatedByString:@" "];
    NSArray *escapedCharacters = [@"%21 %23 %24 %26 %27 %28 %29 %2A %2B %2C %2F %3A %3B %3D %3F %40 %5B %5D" componentsSeparatedByString:@" "];
    
    XCTAssertEqual(charactersToEscape.count, escapedCharacters.count);
    
    for (NSInteger idx = 0; idx < charactersToEscape.count; idx++) {
        
        NSString *initialString = [NSString stringWithFormat:@"%@%@%@",firstWord,charactersToEscape[idx],lastWord];
        NSString *expectedString = [NSString stringWithFormat:@"%@%@%@",firstWord,escapedCharacters[idx],lastWord];
        NSString *receivedString = [initialString kfx_stringByAddingPercentEscapesUsingEncoding:encoding];
        XCTAssertEqualObjects(receivedString, expectedString);
    }
    
    
    
    
}






@end
