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
#pragma mark - -indexOfSubstring
//--------------------------------------------------------
-(void)testIndexOfSubstring{
    
    // GIVEN
    NSString *string = @"123456789 ten ten ten 11 12";
    NSString *substring = @"ten";
    NSUInteger expected = 10;
    
    // WHEN
    NSUInteger received = [string kfx_indexOfSubstring:substring];
    
    // THEN
    XCTAssertEqual(received, expected);
}

-(void)testIndexOfSubstringFromIndex{
    
    // GIVEN
    NSString *string = @"123456789 ten ten ten 11 12";
    NSString *substring = @"ten";
    NSUInteger expected1 = 10;
    NSUInteger expected2 = 14;
    NSUInteger expected3 = 18;
    
    // WHEN
    NSUInteger received1 = [string kfx_indexOfSubstring:substring fromIndex:0];
    NSUInteger received2 = [string kfx_indexOfSubstring:substring fromIndex:received1+1];
    NSUInteger received3 = [string kfx_indexOfSubstring:substring fromIndex:received2+1];
    
    // THEN
    XCTAssertEqual(received1, expected1);
    XCTAssertEqual(received2, expected2);
    XCTAssertEqual(received3, expected3);
}

-(void)testIndexOfLastSubstring{
    
    // GIVEN
    NSString *string = @"123456789 ten ten ten 11 12";
    NSString *substring = @"ten";
    NSUInteger expected = 18;
    
    // WHEN
    NSUInteger received = [string kfx_indexOfLastSubstring:substring];
    
    // THEN
    XCTAssertEqual(received, expected);
}


//--------------------------------------------------------
#pragma mark Queries
//--------------------------------------------------------
-(void)testMatchPercentageWithOtherString_WithTwoEmptyStrings{
    
    // GIVEN
    NSString *reciver = @"";
    NSString *other = @"";
    CGFloat expected = 0.0;
    
    // WHEN
    CGFloat result = [reciver kfx_matchPercentageWithOtherString:other];
    
    // THEN
    XCTAssertEqual(expected, result);
}

-(void)testMatchPercentageWithOtherString_WithTwoEqualOneLetterStrings{
    
    // GIVEN
    NSString *reciver = @"a";
    NSString *other = @"a";
    CGFloat expected = 1.0;
    
    // WHEN
    CGFloat result = [reciver kfx_matchPercentageWithOtherString:other];
    
    // THEN
    XCTAssertEqual(expected, result);
}

-(void)testMatchPercentageWithOtherString_WithTwoUnequalOneLetterStrings{
    
    // GIVEN
    NSString *reciver = @"a";
    NSString *other = @"b";
    CGFloat expected = 0.0;
    
    // WHEN
    CGFloat result = [reciver kfx_matchPercentageWithOtherString:other];
    
    // THEN
    XCTAssertEqual(expected, result);
}

-(void)testMatchPercentageWithOtherString_WithUnequalStrings_1{
    
    // GIVEN
    NSString *reciver = @"ab";
    NSString *other = @"a";
    CGFloat expected = 0.5;
    
    // WHEN
    CGFloat result = [reciver kfx_matchPercentageWithOtherString:other];
    
    // THEN
    XCTAssertEqual(expected, result);
}

-(void)testMatchPercentageWithOtherString_WithUnequalStrings_2{
    
    // GIVEN
    NSString *reciver = @"abc";
    NSString *other = @"abc";
    CGFloat expected = 1.0;
    
    // WHEN
    CGFloat result = [reciver kfx_matchPercentageWithOtherString:other];
    
    // THEN
    XCTAssertEqual(expected, result);
}

-(void)testMatchPercentageWithOtherString_WithUnequalStrings_3{
    
    // GIVEN
    NSString *reciver = @"abcd";
    NSString *other = @"a";
    CGFloat expected = 0.25;
    
    // WHEN
    CGFloat result = [reciver kfx_matchPercentageWithOtherString:other];
    
    // THEN
    XCTAssertEqual(expected, result);
}

-(void)testMatchPercentageWithOtherString_WithUnequalStrings_4{
    
    // GIVEN
    NSString *reciver = @"abcd";
    NSString *other = @"abc";
    CGFloat expected = 0.75;
    
    // WHEN
    CGFloat result = [reciver kfx_matchPercentageWithOtherString:other];
    
    // THEN
    XCTAssertEqual(expected, result);
}

-(void)testMatchPercentageWithOtherString_WithUnequalStrings_5{
    
    // GIVEN
    NSString *reciver = @"ab";
    NSString *other = @"abcd";
    CGFloat expected = 0.5;
    
    // WHEN
    CGFloat result = [reciver kfx_matchPercentageWithOtherString:other];
    
    // THEN
    XCTAssertEqual(expected, result);
}

-(void)testMatchPercentageWithOtherString_WithUnequalStrings_6{
    
    // GIVEN
    NSString *reciver = @"a";
    NSString *other = @"abcd";
    CGFloat expected = 0.75;
    
    // WHEN
    CGFloat result = [reciver kfx_matchPercentageWithOtherString:other];
    
    // THEN
    XCTAssertEqual(expected, result);
}

-(void)testMatchPercentageWithOtherString_WithUnequalStrings_7{
    
    // GIVEN
    NSString *reciver = @"abcdEFGHIJKLMNOP";
    NSString *other = @"abcdefghijklmnop";
    CGFloat expected = 0.25;
    
    // WHEN
    CGFloat result = [reciver kfx_matchPercentageWithOtherString:other];
    
    // THEN
    XCTAssertEqual(expected, result);
}










@end





















