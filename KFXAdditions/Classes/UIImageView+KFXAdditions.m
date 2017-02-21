//
//  UIImageView+KFXAdditions.m
//  Pods
//
//  Created by Eyeye on 20/02/2017.
//
//

#import "UIImageView+KFXAdditions.h"

@implementation UIImageView (KFXAdditions)

-(void)kfx_addBorderWithRadius:(CGFloat)radius width:(CGFloat)borderWidth colour:(UIColor *)colour{
	
	self.layer.cornerRadius = radius;
	self.layer.borderWidth = borderWidth;
	self.layer.masksToBounds = YES;
	self.layer.borderColor = colour.CGColor;

}

@end
