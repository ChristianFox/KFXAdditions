


#import <XCTest/XCTest.h>
// SUT
#import "NSDictionary+KFXAdditions.h"

@interface NSDictionaryKFXAdditionsTests : XCTestCase

@end

@implementation NSDictionaryKFXAdditionsTests


//======================================================
#pragma mark - ** Setup, Tear down **
//======================================================
- (void)setUp {
    [super setUp];
    
}

- (void)tearDown {
    
    [super tearDown];
}

//======================================================
#pragma mark - ** Initilisation Tests **
//======================================================
-(void)testInitiliseSUT{
    
}


//======================================================
#pragma mark - ** Primary Function Tests **
//======================================================
//--------------------------------------------------------
#pragma mark - Test kfx_depth
//--------------------------------------------------------
-(void)testDepthOfDictionary_WithEmptyDictionary_ShouldReturn0{
    
    // GIVEN
    NSDictionary *dict = @{};
    
    // WHEN
    NSInteger depth = [dict kfx_depth];
    
    // THEN
    XCTAssertEqual(depth, 0);
}

-(void)testDepthOfDictionary_WithOneObject_ShouldReturn1{
    
    // GIVEN
    NSDictionary *dict = @{@"key":@"one"};
    
    // WHEN
    NSInteger depth = [dict kfx_depth];
    
    // THEN
    XCTAssertEqual(depth, 1);
}

-(void)testDepthOfDictionary_WithTwoObjects_ShouldReturn1{
    
    // GIVEN
    NSDictionary *dict = @{@"key1":@"one",@"key2":@"two"};
    
    // WHEN
    NSInteger depth = [dict kfx_depth];
    
    // THEN
    XCTAssertEqual(depth, 1);
}

-(void)testDepthOfDictionary_WithThreeObjects_ShouldReturn1{
    
    // GIVEN
    NSDictionary *dict = @{@"key1":@"one",@"key2":@"two",@"key3":@"three"};
    
    // WHEN
    NSInteger depth = [dict kfx_depth];
    
    // THEN
    XCTAssertEqual(depth, 1);
}

-(void)testDepthOfDictionary_WithOneEmptyArray_ShouldReturn1{
    
    // GIVEN
    NSDictionary *dict = @{@"key":@[]};
    
    // WHEN
    NSInteger depth = [dict kfx_depth];
    
    // THEN
    XCTAssertEqual(depth, 1);
}

-(void)testDepthOfDictionary_WithOneArrayWithOneObject_ShouldReturn2{
    
    // GIVEN
    NSDictionary *dict = @{@"key1":@[@"one"]};
    
    // WHEN
    NSInteger depth = [dict kfx_depth];
    
    // THEN
    XCTAssertEqual(depth, 2);
}

-(void)testDepthOfDictionary_WithOneArrayWithTwoObjects_ShouldReturn2{
    
    // GIVEN
    NSDictionary *dict = @{@"key":@[@"one",@"two"]};
    
    // WHEN
    NSInteger depth = [dict kfx_depth];
    
    // THEN
    XCTAssertEqual(depth, 2);
}

-(void)testDepthOfDictionary_WithTwoArraysWithTwoObjects_ShouldReturn2{
    
    // GIVEN
    NSDictionary *dict = @{@"key1":@[@"one",@"two"],@"key2":@[@"one",@"two"]};
    
    // WHEN
    NSInteger depth = [dict kfx_depth];
    
    // THEN
    XCTAssertEqual(depth, 2);
}

-(void)testDepthOfDictionary_WithDepthOf3_ShouldReturn3{
    
    // GIVEN
    NSDictionary *dict = @{@"key":@{@"key":@{@"key":@{}}}};
    
    // WHEN
    NSInteger depth = [dict kfx_depth];
    
    // THEN
    XCTAssertEqual(depth, 3);
}

-(void)testDepthOfDictionary_WithDepthOf5_ShouldReturn5{
    
    // GIVEN
    NSDictionary *dict = @{@"key":@{@"key":@{@"key":@{@"key":@{@"key":@{}}}}}};
    
    // WHEN
    NSInteger depth = [dict kfx_depth];
    
    // THEN
    XCTAssertEqual(depth, 5);
}




@end










































