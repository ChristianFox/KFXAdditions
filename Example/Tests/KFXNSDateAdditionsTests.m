


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


#pragma mark - is Date Inbetween - should be NO
-(void)testIsDateInbetween_WithDateThatIsNot_ShouldReturnNO{
    
    NSDate *rangeStartDate = [NSDate dateWithTimeIntervalSince1970:0];
    NSDate *rangeEndDate = [NSDate dateWithTimeIntervalSince1970:1000];
    NSDate *theDate = [NSDate dateWithTimeIntervalSince1970:1001];
    BOOL isInbetween = NO;
    isInbetween = [theDate kfx_isBetweenStartDate:rangeStartDate andEndDate:rangeEndDate];
    XCTAssertFalse(isInbetween);
    
}


#pragma mark - is Date Inbetween - should be YES
-(void)testIsDateInbetween_WithDateThatIs_ShouldReturnYES{
    
    NSDate *rangeStartDate = [NSDate dateWithTimeIntervalSince1970:0];
    NSDate *rangeEndDate = [NSDate dateWithTimeIntervalSince1970:1000];
    NSDate *theDate = [NSDate dateWithTimeIntervalSince1970:500];
    BOOL isInbetween = NO;
    isInbetween = [theDate kfx_isBetweenStartDate:rangeStartDate andEndDate:rangeEndDate];
    XCTAssertTrue(isInbetween);
}

//--------------------------------------------------------
#pragma mark - Components between dates
//--------------------------------------------------------
#pragma mark : -daysSinceDate
-(void)testDaysSinceDate_WithValidFutureDate_IncludeToday_ShouldReturnNegativeNumber{
	
	// GIVEN
	NSDate *mainDate = [NSDate date];
	NSDate *otherDate = [NSDate dateWithTimeIntervalSinceNow:60*60*24*10];
	NSInteger expected = -10;
	
	// WHEN
	NSInteger received = [mainDate kfx_daysSinceDate:otherDate
						 includeCurrentIncompleteDay:YES];
	
	// THEN
	XCTAssertTrue(received < 0);
	XCTAssertEqual(received, expected);
}

-(void)testDaysSinceDate_WithValidPastDate_IncludeToday_ShouldReturnPositiveNumber{
	
	// GIVEN
	NSDate *mainDate = [NSDate date];
	NSDate *otherDate = [NSDate dateWithTimeIntervalSinceNow:-60*60*24*10];
	NSInteger expected = 10;
	
	// WHEN
	NSInteger received = [mainDate kfx_daysSinceDate:otherDate
						 includeCurrentIncompleteDay:YES];
	
	// THEN
	XCTAssertTrue(received > 0);
	XCTAssertEqual(received, expected);
}


-(void)testDaysSinceDate_WithValidFutureDate_DoNotIncludeToday_ShouldReturnNegativeNumber{
	
	// GIVEN
	NSDate *mainDate = [NSDate date];
	NSDate *otherDate = [NSDate dateWithTimeIntervalSinceNow:(60*60*24*10) - 1];
	NSInteger expected = -9;
	
	// WHEN
	NSInteger received = [mainDate kfx_daysSinceDate:otherDate
						 includeCurrentIncompleteDay:NO];
	
	// THEN
	XCTAssertTrue(received < 0);
	XCTAssertEqual(received, expected);
}

-(void)testDaysSinceDate_WithValidPastDate_DoNotIncludeToday_ShouldReturnPositiveNumber{
	
	// GIVEN
	NSDate *mainDate = [NSDate date];
	NSDate *otherDate = [NSDate dateWithTimeIntervalSinceNow:(-60*60*24*10) + 1];
	NSInteger expected = 9;
	
	// WHEN
	NSInteger received = [mainDate kfx_daysSinceDate:otherDate
						 includeCurrentIncompleteDay:NO];
	
	// THEN
	XCTAssertTrue(received > 0);
	XCTAssertEqual(received, expected);
}


#pragma mark : -hoursSinceDate
-(void)testHoursSinceDate_WithValidFutureDate_IncludeCurrentHour_ShouldReturnNegativeNumber{
	
	// GIVEN
	NSDate *mainDate = [NSDate date];
	NSDate *otherDate = [NSDate dateWithTimeIntervalSinceNow:60*60*10];
	NSInteger expected = -10;
	
	// WHEN
	NSInteger received = [mainDate kfx_hoursSinceDate:otherDate
						 includeCurrentIncompleteHour:YES];
	
	// THEN
	XCTAssertTrue(received < 0);
	XCTAssertEqual(received, expected);
}

-(void)testHoursSinceDate_WithValidPastDate_IncludeCurrentHour_ShouldReturnPositiveNumber{
	
	// GIVEN
	NSDate *mainDate = [NSDate date];
	NSDate *otherDate = [NSDate dateWithTimeIntervalSinceNow:-60*60*10];
	NSInteger expected = 10;
	
	// WHEN
	NSInteger received = [mainDate kfx_hoursSinceDate:otherDate
						 includeCurrentIncompleteHour:YES];
	
	// THEN
	XCTAssertTrue(received > 0);
	XCTAssertEqual(received, expected);
}


-(void)testHoursSinceDate_WithValidFutureDate_DoNotIncludeCurrentHour_ShouldReturnNegativeNumber{
	
	// GIVEN
	NSDate *mainDate = [NSDate date];
	NSDate *otherDate = [NSDate dateWithTimeIntervalSinceNow:(60*60*10) - 1];
	NSInteger expected = -9;
	
	// WHEN
	NSInteger received = [mainDate kfx_hoursSinceDate:otherDate
						 includeCurrentIncompleteHour:NO];
	
	// THEN
	XCTAssertTrue(received < 0);
	XCTAssertEqual(received, expected);
}

-(void)testHoursSinceDate_WithValidPastDate_DoNotIncludeCurrentHour_ShouldReturnPositiveNumber{
	
	// GIVEN
	NSDate *mainDate = [NSDate date];
	NSDate *otherDate = [NSDate dateWithTimeIntervalSinceNow:(-60*60*10) + 1];
	NSInteger expected = 9;
	
	// WHEN
	NSInteger received = [mainDate kfx_hoursSinceDate:otherDate
						 includeCurrentIncompleteHour:NO];
	
	// THEN
	XCTAssertTrue(received > 0);
	XCTAssertEqual(received, expected);
}


//--------------------------------------------------------
#pragma mark - Equality
//--------------------------------------------------------
-(void)testIsDayEqualToDate_WithSameDate_ShouldReturnYES{
	
	// GIVEN
	NSDate *dateA = [NSDate date];
	NSDate *dateB = dateA;

	// WHEN
	BOOL received = [dateA kfx_isDayEqualToDate:dateB];
	
	// THEN
	XCTAssertTrue(received);
}

-(void)testIsDayEqualToDate_WithSimilarDate_ShouldReturnYES_UnlessAlmostMidnight{
	
	// GIVEN
	NSDate *dateA = [NSDate date];
	NSDate *dateB = [NSDate dateWithTimeIntervalSinceNow:10];
	
	// WHEN
	BOOL received = [dateA kfx_isDayEqualToDate:dateB];
	
	// THEN
	XCTAssertTrue(received);
}


-(void)testIsDayEqualToDate_WithFarawayDate_ShouldReturnNO{
	
	// GIVEN
	NSDate *dateA = [NSDate date];
	NSDate *dateB = [NSDate dateWithTimeIntervalSinceNow:60*60*24];
	
	// WHEN
	BOOL received = [dateA kfx_isDayEqualToDate:dateB];
	
	// THEN
	XCTAssertFalse(received);
}


-(void)testIsHourEqualToDate_WithSameDate_ShouldReturnYES{
	
	// GIVEN
	NSDate *dateA = [NSDate date];
	NSDate *dateB = dateA;
	
	// WHEN
	BOOL received = [dateA kfx_isHourEqualToDate:dateB];
	
	// THEN
	XCTAssertTrue(received);
}

-(void)testIsHourEqualToDate_WithSimilarDate_ShouldReturnYES{
	
	// GIVEN
	NSDate *dateA = [NSDate date];
	NSDate *dateB = [NSDate dateWithTimeIntervalSinceNow:100];
	
	// WHEN
	BOOL received = [dateA kfx_isHourEqualToDate:dateB];
	
	// THEN
	XCTAssertTrue(received);
}


-(void)testIsHourEqualToDate_WithFarawayDate_ShouldReturnNO{
	
	// GIVEN
	NSDate *dateA = [NSDate date];
	NSDate *dateB = [NSDate dateWithTimeIntervalSinceNow:60*60];
	
	// WHEN
	BOOL received = [dateA kfx_isHourEqualToDate:dateB];
	
	// THEN
	XCTAssertFalse(received);
}

-(void)testIsMinuteEqualToDate_WithSameDate_ShouldReturnYES{
	
	// GIVEN
	NSDate *dateA = [NSDate date];
	NSDate *dateB = dateA;
	
	// WHEN
	BOOL received = [dateA kfx_isMinuteEqualToDate:dateB];
	
	// THEN
	XCTAssertTrue(received);
}

-(void)testIsMinuteEqualToDate_WithSimilarDate_ShouldReturnYES{
	
	// GIVEN
	NSDate *dateA = [NSDate date];
	NSDate *dateB = [NSDate dateWithTimeIntervalSinceNow:1];
	
	// WHEN
	BOOL received = [dateA kfx_isMinuteEqualToDate:dateB];
	
	// THEN
	XCTAssertTrue(received);
}


-(void)testIsMinuteEqualToDate_WithFarawayDate_ShouldReturnNO{
	
	// GIVEN
	NSDate *dateA = [NSDate date];
	NSDate *dateB = [NSDate dateWithTimeIntervalSinceNow:60*2];
	
	// WHEN
	BOOL received = [dateA kfx_isMinuteEqualToDate:dateB];
	
	// THEN
	XCTAssertFalse(received);
}









@end














