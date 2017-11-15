


#import <XCTest/XCTest.h>
// SUT
#import <KFXAdditions/NSSet+KFXAdditions.h>

@interface NSSetKFXAdditionsTests : XCTestCase

@end

@implementation NSSetKFXAdditionsTests


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
-(void)testDepthOfSet_WithEmptySet_ShouldReturn0{
    
    // GIVEN
    NSSet *set = [NSSet setWithArray:@[]];
    
    // WHEN
    NSInteger depth = [set kfx_depth];
    
    // THEN
    XCTAssertEqual(depth, 0);
}

-(void)testDepthOfSet_WithOneObject_ShouldReturn1{
    
    // GIVEN
    NSSet *set = [NSSet setWithArray:@[@"one"]];
    
    // WHEN
    NSInteger depth = [set kfx_depth];
    
    // THEN
    XCTAssertEqual(depth, 1);
}

-(void)testDepthOfSet_WithTwoObjects_ShouldReturn1{
    
    // GIVEN
    NSSet *set = [NSSet setWithArray:@[@"one",@"two"]];
    
    // WHEN
    NSInteger depth = [set kfx_depth];
    
    // THEN
    XCTAssertEqual(depth, 1);
}

-(void)testDepthOfSet_WithThreeObjects_ShouldReturn1{
    
    // GIVEN
    NSSet *set = [NSSet setWithArray:@[@"one",@"two",@"three"]];
    
    // WHEN
    NSInteger depth = [set kfx_depth];
    
    // THEN
    XCTAssertEqual(depth, 1);
}

-(void)testDepthOfSet_WithOneEmptySet_ShouldReturn1{
    
    // GIVEN
    NSSet *set = [NSSet setWithObject:[NSSet setWithArray:@[]]];
    
    // WHEN
    NSInteger depth = [set kfx_depth];
    
    // THEN
    XCTAssertEqual(depth, 1);
}

-(void)testDepthOfSet_WithOneSetWithOneObject_ShouldReturn2{
    
    // GIVEN
    NSSet *set = [NSSet setWithObject:[NSSet setWithArray:@[@"one"]]];
    
    // WHEN
    NSInteger depth = [set kfx_depth];
    
    // THEN
    XCTAssertEqual(depth, 2);
}

-(void)testDepthOfSet_WithOneSetWithTwoObjects_ShouldReturn2{
    
    // GIVEN
    NSSet *set = [NSSet setWithObject:[NSSet setWithArray:@[@"one",@"two"]]];
    
    // WHEN
    NSInteger depth = [set kfx_depth];
    
    // THEN
    XCTAssertEqual(depth, 2);
}

-(void)testDepthOfSet_WithTwoSetsWithTwoObjects_ShouldReturn2{
    
    // GIVEN
    NSSet *set = [NSSet setWithObjects:[NSSet setWithArray:@[@"one",@"two"]],[NSSet setWithArray:@[@"one",@"two"]],nil];
    
    // WHEN
    NSInteger depth = [set kfx_depth];
    
    // THEN
    XCTAssertEqual(depth, 2);
}

-(void)testDepthOfSet_WithDepthOf3_ShouldReturn3{
    
    // GIVEN
    NSSet *set = [NSSet setWithObjects:[NSSet setWithObjects:@[@"one"],nil],nil];
    
    // WHEN
    NSInteger depth = [set kfx_depth];
    
    // THEN
    XCTAssertEqual(depth, 3);
}

-(void)testDepthOfSet_WithDepthOf5_ShouldReturn5{
    
    // GIVEN
    NSSet *set = [NSSet setWithObjects:[NSSet setWithObjects:[NSSet setWithObjects:[NSSet setWithObjects:@[@"one"],nil],nil],nil],nil];
    
    // WHEN
    NSInteger depth = [set kfx_depth];
    
    // THEN
    XCTAssertEqual(depth, 5);
}

-(void)testDepthOfSet_WithDepthOf3Dictionaries_ShouldReturn3{
    
    // GIVEN
    NSSet *set = [NSSet setWithArray:@[@{@"key":@{@"key":@{}}}]];
    
    // WHEN
    NSInteger depth = [set kfx_depth];
    
    // THEN
    XCTAssertEqual(depth, 3);
}




@end










































