


#import <Foundation/Foundation.h>

@interface NSString (KFXAdditions)

+(NSString*)kfx_randomStringOfLength:(int)length;
-(NSString*)kfx_stringByCapitalisingFirstLetter;
-(BOOL)kfx_containsOnlySignedDecimalDigits;
+(NSString*)kfx_stringByCombiningComponents:(NSArray<NSString*>*)components separatedByString:(NSString*)separator;

@end
