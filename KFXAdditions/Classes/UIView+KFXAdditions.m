


#import "UIView+KFXAdditions.h"

@implementation UIView (KFXAdditions)

//--------------------------------------------------------
#pragma mark - First Responder
//--------------------------------------------------------
-(UIView *)kfx_findFirstResponder{
    
    // Found it first time - yay!
    if ([self isFirstResponder]) {
        return self;
    }
    
    // Look through subviews
    for (UIView *subview in [self subviews]) {
        UIView *firstResponder = [subview kfx_findFirstResponder];
        if (firstResponder != nil) {
            return firstResponder;
        }
    }
    
    // Cannot be found
    return nil;
}



//--------------------------------------------------------
#pragma mark - Border
//--------------------------------------------------------
-(void)kfx_addBorderWithRadius:(CGFloat)radius width:(CGFloat)borderWidth colour:(UIColor *)colour{
	
	self.layer.cornerRadius = radius;
	self.layer.borderWidth = borderWidth;
	self.layer.masksToBounds = YES;
	self.layer.borderColor = colour.CGColor;
	
}



@end
