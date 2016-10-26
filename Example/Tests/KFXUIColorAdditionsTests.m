

#import <XCTest/XCTest.h>
#import "UIColor+KFXAdditions.h"

@interface KFXUIColorAdditionsTests : XCTestCase

@end

@implementation KFXUIColorAdditionsTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


//--------------------------------------------------------
#pragma mark - Hex Colour Tests
//--------------------------------------------------------
-(void)testColourWithHexStringWithWhiteColour{
    
    NSString *hex = @"#FFFFFF";
    UIColor *colour = [UIColor kfx_colorwithHexString:hex alpha:1.0];
    CGFloat hue;
    CGFloat saturation;
    CGFloat brightness;
    CGFloat alpha;
    BOOL isValid = [colour getHue:&hue
                       saturation:&saturation
                       brightness:&brightness
                            alpha:&alpha];
    XCTAssertTrue(isValid);
    XCTAssertEqual(saturation, 0.0);
    XCTAssertEqual(brightness, 1.0);
    
}

-(void)testColourWithHexStringWithBlackColour{
    
    NSString *hex = @"#000";
    UIColor *colour = [UIColor kfx_colorwithHexString:hex alpha:1.0];
    CGFloat hue;
    CGFloat saturation;
    CGFloat brightness;
    CGFloat alpha;
    BOOL isValid = [colour getHue:&hue
                       saturation:&saturation
                       brightness:&brightness
                            alpha:&alpha];
    XCTAssertTrue(isValid);
    XCTAssertEqual(saturation, 0.0);
    XCTAssertEqual(brightness, 0.0);
}

-(void)testColourWithHexStringWithGreyColour{
    
    NSString *hex = @"#777";
    UIColor *colour = [UIColor kfx_colorwithHexString:hex alpha:1.0];
    CGFloat hue;
    CGFloat saturation;
    CGFloat brightness;
    CGFloat alpha;
    BOOL isValid = [colour getHue:&hue
                       saturation:&saturation
                       brightness:&brightness
                            alpha:&alpha];
    XCTAssertTrue(isValid);
    XCTAssertEqual(saturation, 1.0);
    XCTAssertTrue(brightness > 0.4);
    XCTAssertTrue(brightness < 0.6);
}



//--------------------------------------------------------
#pragma mark - Random Colour Tests
//--------------------------------------------------------
-(void)testRandomColour{
 
    UIColor *colour1 = [UIColor kfx_randomColour];
    XCTAssertNotNil(colour1);
    UIColor *colour2 = [UIColor kfx_randomColour];
    XCTAssertNotNil(colour2);
    
}

-(void)testRandomColourWithAlpha{
    
    UIColor *colour1 = [UIColor kfx_randomColourWithAlpha:0.5];
    XCTAssertNotNil(colour1);
    CGFloat hue;
    CGFloat saturation;
    CGFloat brightness;
    CGFloat alpha;
    BOOL isValid = [colour1 getHue:&hue
                       saturation:&saturation
                       brightness:&brightness
                            alpha:&alpha];
    XCTAssertTrue(isValid);
    XCTAssertEqual(alpha, 0.5);

}

-(void)testRandomColourWithAlphaAvoidingBlackAndWhite{
    
    UIColor *colour1 = [UIColor kfx_randomColourAvoidingBlackAndWhiteWithAlpha:0.5];
    XCTAssertNotNil(colour1);
    CGFloat hue;
    CGFloat saturation;
    CGFloat brightness;
    CGFloat alpha;
    BOOL isValid = [colour1 getHue:&hue
                        saturation:&saturation
                        brightness:&brightness
                             alpha:&alpha];
    XCTAssertTrue(isValid);
    XCTAssertEqual(alpha, 0.5);
    XCTAssertTrue(saturation >= 0.5);
    XCTAssertTrue(brightness >= 0.5);
    
}



//--------------------------------------------------------
#pragma mark - Alter Colours Tests
//--------------------------------------------------------
#pragma mark Hue
-(void)testAlteringColourByHue{
    
    UIColor *baseColour = [UIColor colorWithHue:0.25 saturation:1.0 brightness:1.0 alpha:1.0];
    UIColor *alteredColour = [baseColour kfx_colourByAlteringHueByAmount:0.25];
    XCTAssertNotNil(alteredColour);
    CGFloat hue;
    CGFloat saturation;
    CGFloat brightness;
    CGFloat alpha;
    BOOL isValid = [alteredColour getHue:&hue
                        saturation:&saturation
                        brightness:&brightness
                             alpha:&alpha];
    XCTAssertTrue(isValid);
    XCTAssertEqual(hue, 0.5);
    XCTAssertEqual(saturation, 1.0);
    XCTAssertEqual(brightness, 1.0);
    XCTAssertEqual(alpha, 1.0);

}

-(void)testAlteringColourByHueWithValueGreaterThanOne{
    
    UIColor *baseColour = [UIColor colorWithHue:0.25 saturation:1.0 brightness:1.0 alpha:1.0];
    UIColor *alteredColour = [baseColour kfx_colourByAlteringHueByAmount:2];
    XCTAssertNotNil(alteredColour);
    CGFloat hue;
    CGFloat saturation;
    CGFloat brightness;
    CGFloat alpha;
    BOOL isValid = [alteredColour getHue:&hue
                              saturation:&saturation
                              brightness:&brightness
                                   alpha:&alpha];
    XCTAssertTrue(isValid);
    XCTAssertTrue(hue < 1.00001 && hue > 0.9998, @"Hue is %f",hue);
    XCTAssertEqual(saturation, 1.0);
    XCTAssertEqual(brightness, 1.0);
    XCTAssertEqual(alpha, 1.0);

}

-(void)testAlteringColourByHueWithValueLessThanOne{
    
    UIColor *baseColour = [UIColor colorWithHue:0.25 saturation:1.0 brightness:1.0 alpha:1.0];
    UIColor *alteredColour = [baseColour kfx_colourByAlteringHueByAmount:-0.5];
    XCTAssertNotNil(alteredColour);
    CGFloat hue;
    CGFloat saturation;
    CGFloat brightness;
    CGFloat alpha;
    BOOL isValid = [alteredColour getHue:&hue
                              saturation:&saturation
                              brightness:&brightness
                                   alpha:&alpha];
    XCTAssertTrue(isValid);
    XCTAssertTrue(hue < 0.001 && hue > -0.001, @"Hue is %f",hue);
    XCTAssertEqual(saturation, 1.0);
    XCTAssertEqual(brightness, 1.0);
    XCTAssertEqual(alpha, 1.0);

}


#pragma mark Saturation
-(void)testAlteringColourBySaturation{
    
    UIColor *baseColour = [UIColor colorWithHue:0.5 saturation:0.1 brightness:1.0 alpha:1.0];
    UIColor *alteredColour = [baseColour kfx_colourByAlteringSaturationByAmount:0.5];
    XCTAssertNotNil(alteredColour);
    CGFloat hue;
    CGFloat saturation;
    CGFloat brightness;
    CGFloat alpha;
    BOOL isValid = [alteredColour getHue:&hue
                              saturation:&saturation
                              brightness:&brightness
                                   alpha:&alpha];
    XCTAssertTrue(isValid);
    XCTAssertEqual(hue, 0.5);
    XCTAssertTrue(saturation < 0.61 && saturation > 0.59, @"saturation is %f",saturation);
    XCTAssertEqual(brightness, 1.0);
    XCTAssertEqual(alpha, 1.0);
}

-(void)testAlteringColourBySaturationWithValueGreaterThanOne{
    
    CGFloat originalSaturation = 0.9;
    CGFloat alterAmount = 1.9;
    UIColor *baseColour = [UIColor colorWithHue:0.25 saturation:originalSaturation brightness:1.0 alpha:1.0];
    UIColor *alteredColour = [baseColour kfx_colourByAlteringSaturationByAmount:alterAmount];
    XCTAssertNotNil(alteredColour);
    CGFloat hue;
    CGFloat saturation;
    CGFloat brightness;
    CGFloat alpha;
    BOOL isValid = [alteredColour getHue:&hue
                              saturation:&saturation
                              brightness:&brightness
                                   alpha:&alpha];
    XCTAssertTrue(isValid);
    NSOperatingSystemVersion ios10 = (NSOperatingSystemVersion){10, 0, 0};
    if ([[NSProcessInfo processInfo] isOperatingSystemAtLeastVersion:ios10]) {
        XCTAssertEqual(saturation, originalSaturation+alterAmount);
    } else {
        XCTAssertTrue(saturation < 1.00001 && saturation > 0.9998, @"Saturation is %f",saturation);
    }

    XCTAssertEqual(hue, 0.25);
    XCTAssertEqual(brightness, 1.0);
    XCTAssertEqual(alpha, 1.0);

}

-(void)testAlteringColourBySaturationWithValueLessThanOne{
    
    CGFloat originalSaturation = 0.9;
    CGFloat alterAmount = -1.9;
    UIColor *baseColour = [UIColor colorWithHue:0.35 saturation:originalSaturation brightness:1.0 alpha:1.0];
    UIColor *alteredColour = [baseColour kfx_colourByAlteringSaturationByAmount:alterAmount];
    XCTAssertNotNil(alteredColour);
    CGFloat hue;
    CGFloat saturation;
    CGFloat brightness;
    CGFloat alpha;
    BOOL isValid = [alteredColour getHue:&hue
                              saturation:&saturation
                              brightness:&brightness
                                   alpha:&alpha];
    XCTAssertTrue(isValid);
    NSOperatingSystemVersion ios10 = (NSOperatingSystemVersion){10, 0, 0};
    if ([[NSProcessInfo processInfo] isOperatingSystemAtLeastVersion:ios10]) {
        XCTAssertTrue(saturation < 0.01 && saturation > -0.01, @"saturation is %f",saturation);
    } else {
        XCTAssertTrue(saturation < 0.0001 && saturation > -0.0001, @"Saturation is %f",saturation);
    }
    
    XCTAssertTrue(hue < 0.37 && hue > 0.32,@"Hue is %f",hue);
    XCTAssertEqual(brightness, 1.0);
    XCTAssertEqual(alpha, 1.0);
    
}


#pragma mark Brightness
-(void)testAlteringColourByBrightness{
    
    UIColor *baseColour = [UIColor colorWithHue:0.5 saturation:0.6 brightness:0.2 alpha:1.0];
    UIColor *alteredColour = [baseColour kfx_colourByAlteringBrightnessByAmount:0.5];
    XCTAssertNotNil(alteredColour);
    CGFloat hue;
    CGFloat saturation;
    CGFloat brightness;
    CGFloat alpha;
    BOOL isValid = [alteredColour getHue:&hue
                              saturation:&saturation
                              brightness:&brightness
                                   alpha:&alpha];
    XCTAssertTrue(isValid);
    XCTAssertEqual(hue, 0.5);
    XCTAssertTrue(saturation < 0.61 && saturation > 0.59, @"saturation is %f",saturation);
    XCTAssertTrue(brightness < 0.71 && brightness > 0.69, @"brightness is %f",brightness);
    XCTAssertEqual(alpha, 1.0);
}

-(void)testAlteringColourByBrightnessWithValueGreaterThanOne{
    
    CGFloat originalBrightness = 0.9;
    CGFloat alterAmount = 1.9;
    UIColor *baseColour = [UIColor colorWithHue:0.25 saturation:0.9 brightness:originalBrightness alpha:1.0];
    UIColor *alteredColour = [baseColour kfx_colourByAlteringBrightnessByAmount:alterAmount];
    XCTAssertNotNil(alteredColour);
    CGFloat hue;
    CGFloat saturation;
    CGFloat brightness;
    CGFloat alpha;
    BOOL isValid = [alteredColour getHue:&hue
                              saturation:&saturation
                              brightness:&brightness
                                   alpha:&alpha];
    XCTAssertTrue(isValid);
    NSOperatingSystemVersion ios10 = (NSOperatingSystemVersion){10, 0, 0};
    if ([[NSProcessInfo processInfo] isOperatingSystemAtLeastVersion:ios10]) {
        XCTAssertEqual(brightness, originalBrightness+alterAmount);
    } else {
        XCTAssertTrue(brightness < 1.00001 && brightness > 0.9998, @"Brightness is %f",brightness);
    }
    
    XCTAssertEqual(hue, 0.25);
    XCTAssertTrue(saturation < 0.91 && saturation > 0.89, @"saturation is %f",saturation);
    XCTAssertEqual(alpha, 1.0);
    
}

-(void)testAlteringColourByBrightnessWithValueLessThanOne{
    
    CGFloat originalBrightness = 0.9;
    CGFloat alterAmount = -1.9;
    UIColor *baseColour = [UIColor colorWithHue:0.35 saturation:0.9 brightness:originalBrightness alpha:1.0];
    UIColor *alteredColour = [baseColour kfx_colourByAlteringBrightnessByAmount:alterAmount];
    XCTAssertNotNil(alteredColour);
    CGFloat hue;
    CGFloat saturation;
    CGFloat brightness;
    CGFloat alpha;
    BOOL isValid = [alteredColour getHue:&hue
                              saturation:&saturation
                              brightness:&brightness
                                   alpha:&alpha];
    XCTAssertTrue(isValid);
    NSOperatingSystemVersion ios10 = (NSOperatingSystemVersion){10, 0, 0};
    if ([[NSProcessInfo processInfo] isOperatingSystemAtLeastVersion:ios10]) {
        XCTAssertTrue(brightness < 0.0001 && brightness > -0.0001, @"Brightness is %f",brightness);
    } else {
        XCTAssertTrue(brightness < 0.0001 && brightness > -0.0001, @"Brightness is %f",brightness);
    }
    
    XCTAssertTrue(hue < 0.37 && hue > 0.32,@"Hue is %f",hue);
    XCTAssertTrue(saturation < 0.91 && saturation > 0.89, @"saturation is %f",saturation);
    XCTAssertEqual(alpha, 1.0);
    
}



#pragma mark Alpha
-(void)testAlteringColourByAlpha{
    
    UIColor *baseColour = [UIColor colorWithHue:0.5 saturation:0.6 brightness:0.7 alpha:0.2];
    UIColor *alteredColour = [baseColour kfx_colourByAlteringAlphaByAmount:0.5];
    XCTAssertNotNil(alteredColour);
    CGFloat hue;
    CGFloat saturation;
    CGFloat brightness;
    CGFloat alpha;
    BOOL isValid = [alteredColour getHue:&hue
                              saturation:&saturation
                              brightness:&brightness
                                   alpha:&alpha];
    XCTAssertTrue(isValid);
    XCTAssertEqual(hue, 0.5);
    XCTAssertTrue(saturation < 0.61 && saturation > 0.59, @"saturation is %f",saturation);
    XCTAssertTrue(brightness < 0.71 && brightness > 0.69, @"brightness is %f",brightness);
    XCTAssertTrue(alpha < 0.71 && alpha > 0.69, @"Alpha is %f",alpha);
}

-(void)testAlteringColourByAlphaWithValueGreaterThanOne{
    
    CGFloat originalAlpha = 0.2;
    CGFloat alterAmount = 1.9;
    UIColor *baseColour = [UIColor colorWithHue:0.25 saturation:0.9 brightness:0.6 alpha:originalAlpha];
    UIColor *alteredColour = [baseColour kfx_colourByAlteringAlphaByAmount:alterAmount];
    XCTAssertNotNil(alteredColour);
    CGFloat hue;
    CGFloat saturation;
    CGFloat brightness;
    CGFloat alpha;
    BOOL isValid = [alteredColour getHue:&hue
                              saturation:&saturation
                              brightness:&brightness
                                   alpha:&alpha];
    XCTAssertTrue(isValid);
    XCTAssertTrue(alpha < 1.00001 && alpha > 0.9998, @"Alpha is %f",alpha);
    XCTAssertEqual(hue, 0.25);
    XCTAssertTrue(saturation < 0.91 && saturation > 0.89, @"saturation is %f",saturation);
    XCTAssertEqual(alpha, 1.0);
    
}

-(void)testAlteringColourByAlphaWithValueLessThanOne{
    
    CGFloat originalAlpha = 0.2;
    CGFloat alterAmount = -1.9;
    UIColor *baseColour = [UIColor colorWithHue:0.35 saturation:0.9 brightness:0.4 alpha:originalAlpha];
    UIColor *alteredColour = [baseColour kfx_colourByAlteringAlphaByAmount:alterAmount];
    XCTAssertNotNil(alteredColour);
    CGFloat hue;
    CGFloat saturation;
    CGFloat brightness;
    CGFloat alpha;
    BOOL isValid = [alteredColour getHue:&hue
                              saturation:&saturation
                              brightness:&brightness
                                   alpha:&alpha];
    XCTAssertTrue(isValid);
    XCTAssertTrue(alpha < 0.00001 && alpha > -0.001, @"Alpha is %f",alpha);
    XCTAssertTrue(hue < 0.37 && hue > 0.32,@"Hue is %f",hue);
    XCTAssertTrue(saturation < 0.91 && saturation > 0.89, @"saturation is %f",saturation);
    
}



# pragma mark Hue, Saturation, Brightness & Alpha
-(void)testColourByAlteringHueSaturationBrightnessAndAlpha{
    
    UIColor *baseColour = [UIColor colorWithHue:0.1 saturation:0.1 brightness:0.1 alpha:0.1];
    UIColor *alteredColour = [baseColour kfx_colourByAlteringHue:0.4
                                                      saturation:0.4
                                                      brightness:0.4
                                                           alpha:0.4];
    XCTAssertNotNil(alteredColour);
    CGFloat hue;
    CGFloat saturation;
    CGFloat brightness;
    CGFloat alpha;
    BOOL isValid = [alteredColour getHue:&hue
                              saturation:&saturation
                              brightness:&brightness
                                   alpha:&alpha];
    XCTAssertTrue(isValid);
    XCTAssertTrue(hue < 0.55 && hue > 0.45);
    XCTAssertTrue(saturation < 0.55 && saturation > 0.45);
    XCTAssertTrue(brightness < 0.55 && brightness > 0.45);
    XCTAssertTrue(alpha < 0.55 && alpha > 0.45);
}

-(void)testColourByAlteringHueSaturationBrightnessAndAlphaClampsValuesGreaterThanOne{
    
    UIColor *baseColour = [UIColor colorWithHue:0.1 saturation:0.1 brightness:0.1 alpha:0.1];
    UIColor *alteredColour = [baseColour kfx_colourByAlteringHue:1.0
                                                      saturation:1.0
                                                      brightness:1.0
                                                           alpha:1.0];
    XCTAssertNotNil(alteredColour);
    CGFloat hue;
    CGFloat saturation;
    CGFloat brightness;
    CGFloat alpha;
    BOOL isValid = [alteredColour getHue:&hue
                              saturation:&saturation
                              brightness:&brightness
                                   alpha:&alpha];
    XCTAssertTrue(isValid);
    XCTAssertTrue(hue < 1.00001 && hue > 0.9998, @"Hue is %f",hue);
    XCTAssertTrue(alpha < 1.001 && alpha > 0.99, @"alpha is %f",alpha);

    NSOperatingSystemVersion ios10 = (NSOperatingSystemVersion){10, 0, 0};
    if ([[NSProcessInfo processInfo] isOperatingSystemAtLeastVersion:ios10]) {
        XCTAssertTrue(saturation < 1.11 && saturation > 1.09, @"saturation is %f",saturation);
        XCTAssertTrue(brightness < 1.11 && brightness > 1.09, @"brightness is %f",brightness);
    } else {
        XCTAssertTrue(saturation < 1.01 && saturation > 0.99, @"saturation is %f",saturation);
        XCTAssertTrue(brightness < 1.01 && brightness > 0.99, @"brightness is %f",brightness);
    }

}







@end























