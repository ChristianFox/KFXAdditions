


#import <UIKit/UIKit.h>

@interface UIView (KFXAdditions)

//--------------------------------------------------------
#pragma mark Init
//--------------------------------------------------------
/// Assumes the nib has the same name as the class. Loads nib with nil owner and options
+(instancetype)kfx_instantiateFromNib;

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
