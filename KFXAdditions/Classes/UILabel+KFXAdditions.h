


#import <UIKit/UIKit.h>

@interface UILabel (KFXAdditions)

/**
 * @brief Sets the text property of the label only if the text is non nil, not equal to  NSNull and has a length > 0. Otherwise sets the text property to the defaultText without checking its validity.
 * @param text the string to set the text property to
 * @param defaultText the string to use if the text string fails any of the checks
 * @return YES if the text was used, NO if the defaultText was used
 **/
-(BOOL)kfx_setText:(NSString*)text withDefault:(NSString*)defaultText;

/**
 * @brief Sets the text property of the label by getting the NSNumber's -stringValue but only if the number is non nil, not equal to  NSNull. Otherwise sets the text property to the defaultText without checking its validity.
 * @param number the number to set the text property to
 * @param defaultText the string to use if the number fails any of the checks
 * @return YES if the number was used, NO if the defaultText was used
 **/
-(BOOL)kfx_setTextToNumber:(NSNumber*)number withDefault:(NSString*)defaultText;


@end