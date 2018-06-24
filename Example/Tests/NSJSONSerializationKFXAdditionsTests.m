
#import <XCTest/XCTest.h>
#import "NSJSONSerialization+KFXAdditions.h"

@interface NSJSONSerializationKFXAdditionsTests : XCTestCase

@end

@implementation NSJSONSerializationKFXAdditionsTests

- (void)setUp {
    [super setUp];

}

- (void)tearDown {

    [super tearDown];
}

-(void)testJSONStringWithJSONObject{
    
    // GIVEN
    NSDictionary *JSONDict = @{@"key1":@[@1,@2,@3],@"key2":@"value"};
    
    // WHEN
    NSString *JSONString = [NSJSONSerialization kfx_JSONStringWithJSONObject:JSONDict options:NSJSONWritingPrettyPrinted error:nil];
    
    // THEN
    XCTAssertNotNil(JSONString);
    XCTAssertTrue([JSONString containsString:@"key2"]);
}

-(void)testJSONObjectWithString{
    
    // GIVEN
    NSString *JSONString = @"{\"key\":[1,2,3]}";
    
    // WHEN
    NSDictionary *JSONObject = [NSJSONSerialization kfx_JSONObjectWithString:JSONString options:NSJSONReadingAllowFragments error:nil];
    
    // THEN
    XCTAssertNotNil(JSONObject);
    NSArray *expected = @[@1,@2,@3];
    XCTAssertEqualObjects(JSONObject[@"key"], expected);

}


@end
