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

//--------------------------------------------------------
#pragma mark - Occurances of string
//--------------------------------------------------------
-(void)testOccurancesOfString1{
    
    NSString *string = @"aaaaaaaaabccccc";
    NSString *subString = @"abc";
    NSUInteger expected = 1;
    NSUInteger received = [string kfx_occurancesOfString:subString options:kNilOptions];
    XCTAssertEqual(received, expected);
}

-(void)testOccurancesOfString2{
    
    NSString *string = @"aaabbbaaa";
    NSString *subString = @"a";
    NSUInteger expected = 6;
    NSUInteger received = [string kfx_occurancesOfString:subString options:kNilOptions];
    XCTAssertEqual(received, expected);
}


-(void)testOccurancesOfString3{
    
    NSString *string = @"abababa a b a ba ab ababababa";
    NSString *subString = @"aba";
    NSUInteger expected = 7;
    NSUInteger received = [string kfx_occurancesOfString:subString options:kNilOptions];
    XCTAssertEqual(received, expected);
}

-(void)testOccurancesOfString4{
    
    NSString *string = @"a a a a a  b  b";
    NSString *subString = @" ";
    NSUInteger expected = 8;
    NSUInteger received = [string kfx_occurancesOfString:subString options:kNilOptions];
    XCTAssertEqual(received, expected);
}

-(void)testOccurancesOfString5{
    
    NSString *string = @"a a a a a  b  b";
    NSString *subString = @"";
    NSUInteger expected = 0;
    NSUInteger received = [string kfx_occurancesOfString:subString options:kNilOptions];
    XCTAssertEqual(received, expected);
}

-(void)testOccurancesOfString6{
    
    NSString *string = @"";
    NSString *subString = @"";
    NSUInteger expected = 0;
    NSUInteger received = [string kfx_occurancesOfString:subString options:kNilOptions];
    XCTAssertEqual(received, expected);
}


//--------------------------------------------------------
#pragma mark - Removing white space
//--------------------------------------------------------
-(void)testStringByRemovingExcessiveWhiteSpace1{
    
    NSString *string = @"Hello   World";
    NSString *expected = @"Hello World";
    NSString *received = [string kfx_stringByRemovingExcessiveWhiteSpace];
    XCTAssertEqualObjects(received, expected);
}


-(void)testStringByRemovingExcessiveWhiteSpace2{
    
    NSString *string = @"  Hello   \n  World \n\n\r    ";
    NSString *expected = @" Hello \n World \n\n\r ";
    NSString *received = [string kfx_stringByRemovingExcessiveWhiteSpace];
    XCTAssertEqualObjects(received, expected);
}

-(void)testStringByRemovingExcessiveWhiteSpace3{
    
    NSString *string = @"    ";
    NSString *expected = @" ";
    NSString *received = [string kfx_stringByRemovingExcessiveWhiteSpace];
    XCTAssertEqualObjects(received, expected);
}

-(void)testStringByRemovingExcessiveWhiteSpace4{
    
    NSString *string = @"   \r\n  \r \n\t\t\r\n";
    NSString *expected = @" \r\n \r \n\t\t\r\n";
    NSString *received = [string kfx_stringByRemovingExcessiveWhiteSpace];
    XCTAssertEqualObjects(received, expected);
}

-(void)testStringByRemovingExcessiveWhiteSpace5{
    
    NSString *string = @"\n\r  a   b  \n\r";
    NSString *expected = @"\n\r a b \n\r";
    NSString *received = [string kfx_stringByRemovingExcessiveWhiteSpace];
    XCTAssertEqualObjects(received, expected);
}

//--------------------------------------------------------
#pragma mark - Trimming white space & new Lines
//--------------------------------------------------------
-(void)testStringByTrimmingWhiteSpaceAndNewLines1{
    
    NSString *string =   @"Hello   World";
    NSString *expected = @"Hello   World";
    NSString *received = [string kfx_stringByTrimmingWhiteSpaceAndNewLines];
    XCTAssertEqualObjects(received, expected);
}


-(void)testStringByTrimmingWhiteSpaceAndNewLines2{
    
    NSString *string =   @"  Hello   \n  World \n\n\r    ";
    NSString *expected = @"Hello   \n  World";
    NSString *received = [string kfx_stringByTrimmingWhiteSpaceAndNewLines];
    XCTAssertEqualObjects(received, expected);
}

-(void)testStringByTrimmingWhiteSpaceAndNewLines3{
    
    NSString *string = @"    ";
    NSString *expected = @"";
    NSString *received = [string kfx_stringByTrimmingWhiteSpaceAndNewLines];
    XCTAssertEqualObjects(received, expected);
}

-(void)testStringByTrimmingWhiteSpaceAndNewLines4{
    
    NSString *string = @"   \r\n  \r \n\t\t\r\n";
    NSString *expected = @"";
    NSString *received = [string kfx_stringByTrimmingWhiteSpaceAndNewLines];
    XCTAssertEqualObjects(received, expected);
}

-(void)testStringByTrimmingWhiteSpaceAndNewLines5{
    
    NSString *string = @"\n\r  a   b  \n\r";
    NSString *expected = @"a   b";
    NSString *received = [string kfx_stringByTrimmingWhiteSpaceAndNewLines];
    XCTAssertEqualObjects(received, expected);
}

//--------------------------------------------------------
#pragma mark - Randomd String from Character Pool
//--------------------------------------------------------
-(void)testRandomStringsFromCharacterPool1{
    
    NSString *pool = @"a";
    int length = 5;
    NSString *expected = @"aaaaa";
    NSString *received = [NSString kfx_randomStringOfLength:length fromCharacterPool:pool];
    XCTAssertEqualObjects(received, expected);
}

//--------------------------------------------------------
#pragma mark - Random String with Components
//--------------------------------------------------------
-(void)testRandomStringWithComponents1{
    
    KFXStringComponent components = KFXStringComponentAlpha | KFXStringComponentNumerical | KFXStringComponentSymbolsExtensive;
    int length = 5000;
    NSString *received = [NSString kfx_randomStringOfLength:length withStringComponents:components];
    XCTAssertEqual(received.length, length);
}

-(void)testRandomStringWithComponents2{
    
    KFXStringComponent components = KFXStringComponentNumerical;
    int length = 20;
    NSString *received = [NSString kfx_randomStringOfLength:length withStringComponents:components];
    XCTAssertTrue([received kfx_containsOnlySignedDecimalDigits]);
}

-(void)testRandomStringWithComponents3{
    
    KFXStringComponent components = KFXStringComponentNumerical;
    int length = 10;
    NSString *received = [NSString kfx_randomStringOfLength:length withStringComponents:components];
    NSInteger number = [received integerValue];
    NSString *numberAsString = [NSString stringWithFormat:@"%ld",(long)number];
    XCTAssertEqualObjects(received, numberAsString);
}

-(void)testRandomStringWithComponents4{
    
    KFXStringComponent components = KFXStringComponentSymbolsExtensive | KFXStringComponentSymbolsCommon;
    int length = 5000;
    NSString *received = [NSString kfx_randomStringOfLength:length withStringComponents:components];
    XCTAssertFalse([received kfx_containsAlphaNumericCharacters]);
}

-(void)testRandomStringWithComponents5{
    
    KFXStringComponent components = KFXStringComponentAlpha | KFXStringComponentNumerical;
    int length = 5000;
    NSString *received = [NSString kfx_randomStringOfLength:length withStringComponents:components];
    XCTAssertTrue([received kfx_containsAlphaNumericCharacters]);
}


//--------------------------------------------------------
#pragma mark -
//--------------------------------------------------------









@end





















