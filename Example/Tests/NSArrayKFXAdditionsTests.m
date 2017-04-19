


#import <XCTest/XCTest.h>
// SUT
#import "NSArray+KFXAdditions.h"

@interface NSArrayKFXAdditionsTests : XCTestCase

@end

@implementation NSArrayKFXAdditionsTests


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
-(void)testDepthOfArray_WithEmptyArray_ShouldReturn0{
    
    // GIVEN
    NSArray *array = @[];
    
    // WHEN
    NSInteger depth = [array kfx_depth];
    
    // THEN
    XCTAssertEqual(depth, 0);
}

-(void)testDepthOfArray_WithOneObject_ShouldReturn1{
    
    // GIVEN
    NSArray *array = @[@"one"];
    
    // WHEN
    NSInteger depth = [array kfx_depth];
    
    // THEN
    XCTAssertEqual(depth, 1);
}

-(void)testDepthOfArray_WithTwoObjects_ShouldReturn1{
    
    // GIVEN
    NSArray *array = @[@"one",@"two"];
    
    // WHEN
    NSInteger depth = [array kfx_depth];
    
    // THEN
    XCTAssertEqual(depth, 1);
}

-(void)testDepthOfArray_WithThreeObjects_ShouldReturn1{
    
    // GIVEN
    NSArray *array = @[@"one",@"two",@"three"];
    
    // WHEN
    NSInteger depth = [array kfx_depth];
    
    // THEN
    XCTAssertEqual(depth, 1);
}

-(void)testDepthOfArray_WithOneEmptyArray_ShouldReturn1{
    
    // GIVEN
    NSArray *array = @[@[]];
    
    // WHEN
    NSInteger depth = [array kfx_depth];
    
    // THEN
    XCTAssertEqual(depth, 1);
}

-(void)testDepthOfArray_WithOneArrayWithOneObject_ShouldReturn2{
    
    // GIVEN
    NSArray *array = @[@[@"one"]];
    
    // WHEN
    NSInteger depth = [array kfx_depth];
    
    // THEN
    XCTAssertEqual(depth, 2);
}

-(void)testDepthOfArray_WithOneArrayWithTwoObjects_ShouldReturn2{
    
    // GIVEN
    NSArray *array = @[@[@"one",@"two"]];
    
    // WHEN
    NSInteger depth = [array kfx_depth];
    
    // THEN
    XCTAssertEqual(depth, 2);
}

-(void)testDepthOfArray_WithTwoArraysWithTwoObjects_ShouldReturn2{
    
    // GIVEN
    NSArray *array = @[@[@"one",@"two"],@[@"one",@"two"]];
    
    // WHEN
    NSInteger depth = [array kfx_depth];
    
    // THEN
    XCTAssertEqual(depth, 2);
}

-(void)testDepthOfArray_WithDepthOf3_ShouldReturn3{
    
    // GIVEN
    NSArray *array = @[@[@[@"one",@"two"]]];
    
    // WHEN
    NSInteger depth = [array kfx_depth];
    
    // THEN
    XCTAssertEqual(depth, 3);
}

-(void)testDepthOfArray_WithDepthOf5_ShouldReturn5{
    
    // GIVEN
    NSArray *array = @[@[@[@[@[@[]]]]]];
    
    // WHEN
    NSInteger depth = [array kfx_depth];
    
    // THEN
    XCTAssertEqual(depth, 5);
}

-(void)testDepthOfArray_WithDepthOf3Dictionaries_ShouldReturn3{
    
    // GIVEN
    NSArray *array = @[@{@"key":@{@"key":@{}}}];
    
    // WHEN
    NSInteger depth = [array kfx_depth];
    
    // THEN
    XCTAssertEqual(depth, 3);
}




@end










































