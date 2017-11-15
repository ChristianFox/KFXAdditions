

#import <XCTest/XCTest.h>
// SUT
#import <KFXAdditions/NSURL+KFXAdditions.h>

@interface NSURLKFXAdditionsTests : XCTestCase

@end

@implementation NSURLKFXAdditionsTests


//======================================================
#pragma mark - ** Primary Function Tests **
//======================================================
-(void)testkfx_QueryParameters{
    
    // GIVEN
    NSURL *url = [NSURL URLWithString:@"http://www.blahblah.com/?aKey1=aValue1&aKey2=aValue2"];
    
    // WHEN
    NSDictionary *params = [url kfx_queryParameters];
    
    // THEN
    XCTAssertEqual(2, params.count);
    XCTAssertEqualObjects(params[@"akey1"], @"avalue1");
}

@end
