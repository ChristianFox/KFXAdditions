


#import <Foundation/Foundation.h>

@interface NSString (KFXAdditions)

+(NSString*)kfx_randomStringOfLength:(int)length;

-(NSString*)kfx_stringByCapitalisingFirstLetter;

-(BOOL)kfx_containsOnlySignedDecimalDigits;

@end
