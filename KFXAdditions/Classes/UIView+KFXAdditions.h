


#import <UIKit/UIKit.h>

@interface UIView (KFXAdditions)

//--------------------------------------------------------
#pragma mark - First Responder
//--------------------------------------------------------
-(UIView*)kfx_findFirstResponder;


//--------------------------------------------------------
#pragma mark - Border
//--------------------------------------------------------
-(void)kfx_addBorderWithRadius:(CGFloat)radius
						 width:(CGFloat)borderWidth
						colour:(UIColor*)colour;


@end
