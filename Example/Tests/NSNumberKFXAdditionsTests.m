

#import <XCTest/XCTest.h>
#import <KFXAdditions/NSNumber+KFXAdditions.h>

@interface NSNumberKFXAdditionsTests : XCTestCase

@end

@implementation NSNumberKFXAdditionsTests




//======================================================
#pragma mark - ** Tests **
//======================================================
-(void)testLowestNumberFromNumbers{
    
    // GIVEN
    NSArray *numbers = @[@5,@4,@10,@22,@8,@1,@99];
    
    // WHEN
    NSNumber *result = [NSNumber kfx_lowestNumberFromNumbers:numbers];
    
    // THEN
    XCTAssertEqualObjects(result, @1);
    
}

-(void)testHighestNumberFromNumbers{
    
    // GIVEN
    NSArray *numbers = @[@5,@4,@10,@22,@8,@1,@99];
    
    // WHEN
    NSNumber *result = [NSNumber kfx_highestNumberFromNumbers:numbers];
    
    // THEN
    XCTAssertEqualObjects(result, @99);
    
}



@end
