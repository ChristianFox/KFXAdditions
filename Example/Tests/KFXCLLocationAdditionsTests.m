


#import <XCTest/XCTest.h>
#import <KFXAdditions/CLLocation+KFXAdditions.h>

@interface KFXCLLocationAdditionsTests : XCTestCase

@end

@implementation KFXCLLocationAdditionsTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

//======================================================
#pragma mark - ** Test Initilisers with coord adjustments **
//======================================================

//--------------------------------------------------------
#pragma mark - -locationByAdjustingCoordinatesInDegreesWithLatitude
//--------------------------------------------------------
-(void)testAdjustCoordinatesInDegrees_WithInvalidLatitude_ShouldReturnNil{
    
    CLLocation *originalLocation = [[CLLocation alloc]initWithLatitude:10.000000000
                                                             longitude:10.000000000];
    CLLocation *adjustedLocation = [originalLocation locationByAdjustingCoordinatesInDegreesWithLatitude:-100.00001                                                                                               longitude:70.0000];
    XCTAssertNil(adjustedLocation);
}

-(void)testAdjustCoordinatesInDegrees_WithInvalidLongitude_ShouldReturnNil{
    
    CLLocation *originalLocation = [[CLLocation alloc]initWithLatitude:10.000000000
                                                             longitude:10.000000000];
    CLLocation *adjustedLocation = [originalLocation locationByAdjustingCoordinatesInDegreesWithLatitude:-10.0                                                                                               longitude:170.00001];
    XCTAssertNil(adjustedLocation);
}

-(void)testAdjustCoordinatesInDegrees_WithSimpleArguments_ShouldReturnAValidLocation{
    
    CLLocation *originalLocation = [[CLLocation alloc]initWithLatitude:0.000000000
                                                             longitude:0.000000000];
    CLLocation *adjustedLocation = [originalLocation locationByAdjustingCoordinatesInDegreesWithLatitude:10.0                                                                                               longitude:10.0];
    XCTAssertNotNil(adjustedLocation);
    XCTAssertTrue(adjustedLocation.coordinate.latitude < 10.1
                  && adjustedLocation.coordinate.latitude > 9.9);
    XCTAssertTrue(adjustedLocation.coordinate.longitude < 10.1
                  && adjustedLocation.coordinate.longitude > 9.9);

}

-(void)testAdjustCoordinatesInDegrees_WithNegativeArguments_ShouldReturnAValidLocation{
    
    CLLocation *originalLocation = [[CLLocation alloc]initWithLatitude:10.000000000
                                                             longitude:10.000000000];
    CLLocation *adjustedLocation = [originalLocation locationByAdjustingCoordinatesInDegreesWithLatitude:-20.0                                                                                               longitude:-20.0];
    XCTAssertNotNil(adjustedLocation);
    XCTAssertTrue(adjustedLocation.coordinate.latitude > -10.1
                  && adjustedLocation.coordinate.latitude < -9.9);
    XCTAssertTrue(adjustedLocation.coordinate.longitude > -10.1
                  && adjustedLocation.coordinate.longitude < -9.9);
}


//--------------------------------------------------------
#pragma mark - -locationByAdjustingCoordinatesInMetresWithLatitude
//--------------------------------------------------------
-(void)testLocationByAdjustingCoordinatesInMetres_WithInvalidLatitude_ShouldReturnNil{
    
    CLLocation *originalLocation = [[CLLocation alloc]initWithLatitude:0.000000000
                                                             longitude:0.000000000];
    CLLocation *adjustedLocation = [originalLocation locationByAdjustingCoordinatesInMetresWithLatitude:90.1*110574.27608210722                                                                                               longitude:100];
    XCTAssertNil(adjustedLocation);
}

-(void)testLocationByAdjustingCoordinatesInMetres_WithInvalidLongitude_ShouldReturnNil{
    
    CLLocation *originalLocation = [[CLLocation alloc]initWithLatitude:0.000000000
                                                             longitude:0.000000000];
    CLLocation *adjustedLocation = [originalLocation locationByAdjustingCoordinatesInMetresWithLatitude:100                                                                                               longitude:180.1*111319.2895857656];
    XCTAssertNil(adjustedLocation);
}

-(void)testLocationByAdjustingCoordinatesInMetres_WithSimpleArguments_ShouldReturnLocation{
    
    CLLocation *originalLocation = [[CLLocation alloc]initWithLatitude:0.000000000
                                                             longitude:0.000000000];
    CLLocation *adjustedLocation = [originalLocation locationByAdjustingCoordinatesInMetresWithLatitude:110574.27608210722                                                                                               longitude:111319.2895857656];
    XCTAssertNotNil(adjustedLocation);
    XCTAssertTrue(adjustedLocation.coordinate.latitude > 0.9
                  && adjustedLocation.coordinate.latitude < 1.1);
    XCTAssertTrue(adjustedLocation.coordinate.longitude > 0.9
                  && adjustedLocation.coordinate.longitude < 1.1);

}

-(void)testLocationByAdjustingCoordinatesInMetres_WithNegativeArguments_ShouldReturnLocation{
    
    CLLocation *originalLocation = [[CLLocation alloc]initWithLatitude:0.000000000
                                                             longitude:0.000000000];
    CLLocation *adjustedLocation = [originalLocation locationByAdjustingCoordinatesInMetresWithLatitude:-110574.27608210722                                                                                               longitude:-111319.2895857656];
    XCTAssertNotNil(adjustedLocation);
    XCTAssertTrue(adjustedLocation.coordinate.latitude > -1.1
                  && adjustedLocation.coordinate.latitude < -0.9);
    XCTAssertTrue(adjustedLocation.coordinate.longitude > -1.1
                  && adjustedLocation.coordinate.longitude < -0.9);


}


@end











