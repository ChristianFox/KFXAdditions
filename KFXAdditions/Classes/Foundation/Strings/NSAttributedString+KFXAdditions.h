/********************************
 *
 * Copyright © 2016-2017 Christian Fox
 * All Rights Reserved
 * Full licence details can be found in the file 'LICENSE' or in the Pods-{yourProjectName}-acknowledgements.markdown
 *
 * This file is included with KFXAdditions
 *
 ************************************/


#import <Foundation/Foundation.h>

@interface NSAttributedString (KFXAdditions)

//--------------------------------------------------------
#pragma mark - Convience Initilisers
//--------------------------------------------------------
/// Returns an NSAttributedString with the given string and no attributes
+(instancetype)kfx_instanceWithString:(NSString*)string;

/// Returns an NSAttributedString with the given string and attributes
+(instancetype)kfx_instanceWithString:(NSString*)string attributes:(NSDictionary*)attributes;

/// Returns an NSAttributedString with the given format string and no attributes
+(instancetype)kfx_instanceWithFormat:(NSString*)format,...;

/// Returns an NSAttributedString with the given format string and the attributes
+(instancetype)kfx_instanceWithAttributes:(NSDictionary*)attributes
                                   format:(NSString*)format,...;

/// Returns an NSAttributedString with the given string and the attributes
+(instancetype)kfx_instanceWithString:(NSString*)string
                                 font:(UIFont*)font
                               colour:(UIColor*)colour;

/// Returns an NSAttributedString with the given string and the attributes
+(instancetype)kfx_instanceWithString:(NSString*)string
                                 font:(UIFont*)font
                               colour:(UIColor*)colour
                            alignment:(NSTextAlignment)alignment;

/// Returns an NSAttributedString with the given string and the attributes
+(instancetype)kfx_instanceWithString:(NSString*)string
                                 font:(UIFont*)font
                               colour:(UIColor*)colour
                            alignment:(NSTextAlignment)alignment
                          lineSpacing:(CGFloat)lineSpacing;


//--------------------------------------------------------
#pragma mark - Ranges
//--------------------------------------------------------
/// Returns the NSRange for the receiver's string
-(NSRange)kfx_rangeOfString;

@end
