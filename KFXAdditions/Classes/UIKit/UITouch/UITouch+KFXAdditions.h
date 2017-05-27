


#import <UIKit/UIKit.h>

@interface UITouch (KFXAdditions)

/// Returns the centre point of all touches within the given view
+(CGPoint)kfx_centroidOfTouches:(NSSet*)touches
						 inView:(UIView*)view;

@end
