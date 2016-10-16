


#import <XCTest/XCTest.h>
#import "NSDate+KFXAdditions.h"


@interface KFXNSDateAdditionsTests : XCTestCase

@end

@implementation KFXNSDateAdditionsTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


#pragma mark - Detect when true
-(void)testShouldReturnTrueIfFirstDateIsEarlierThanSecond{
    NSDate *date1 = [NSDate dateWithTimeIntervalSince1970:100];
    NSDate *date2 = [NSDate dateWithTimeIntervalSince1970:100000];
    BOOL isEarlier = NO;
    isEarlier = [date1 kfx_isEarlierThanDate:date2];
    XCTAssertTrue(isEarlier,@"Should be True.");
}

-(void)testShouldReturnTrueIfFirstDateIsLaterThanSecond{
    NSDate *date1 = [NSDate dateWithTimeIntervalSince1970:100000];
    NSDate *date2 = [NSDate dateWithTimeIntervalSince1970:100];
    BOOL isLater = NO;
    isLater = [date1 kfx_isLaterThanDate:date2];
    XCTAssertTrue(isLater,@"Should be True.");
}

#pragma mark - Detect when equal
-(void)testShouldReturnFalseIfNeitherDateIsEarlier{
    NSDate *date1 = [NSDate dateWithTimeIntervalSince1970:100];
    NSDate *date2 = [NSDate dateWithTimeIntervalSince1970:100];
    BOOL isEarlier = NO;
    isEarlier = [date1 kfx_isEarlierThanDate:date2];
    XCTAssertFalse(isEarlier,@"Should be False, neither date is earlier.");
}

-(void)testShouldReturnFalseIfNeitherDateIsLater{
    NSDate *date1 = [NSDate dateWithTimeIntervalSince1970:100];
    NSDate *date2 = [NSDate dateWithTimeIntervalSince1970:100];
    BOOL isLater = NO;
    isLater = [date1 kfx_isEarlierThanDate:date2];
    XCTAssertFalse(isLater,@"Should be False, neither date is later.");
}

#pragma mark - Detect when false
-(void)testShouldReturnFalseIfFirstDateIsEarlierThanSecond{
    NSDate *date1 = [NSDate dateWithTimeIntervalSince1970:100000];
    NSDate *date2 = [NSDate dateWithTimeIntervalSince1970:100];
    BOOL isEarlier = NO;
    isEarlier = [date1 kfx_isEarlierThanDate:date2];
    XCTAssertFalse(isEarlier,@"Should be False.");
}

-(void)testShouldReturnFalseIfFirstDateIsLaterThanSecond{
    NSDate *date1 = [NSDate dateWithTimeIntervalSince1970:100];
    NSDate *date2 = [NSDate dateWithTimeIntervalSince1970:100000];
    BOOL isLater = NO;
    isLater = [date1 kfx_isLaterThanDate:date2];
    XCTAssertFalse(isLater,@"Should be False.");
}




@end
