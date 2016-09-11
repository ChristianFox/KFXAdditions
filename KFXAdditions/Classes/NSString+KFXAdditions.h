


#import <Foundation/Foundation.h>

@interface NSString (KFXAdditions)


//======================================================
#pragma mark - ** Class Methods **
//======================================================
+(NSString*)kfx_randomStringOfLength:(int)length;
+(NSString*)kfx_stringByCombiningComponents:(NSArray<NSString*>*)components separatedByString:(NSString*)separator;



//======================================================
#pragma mark - ** Instance Methods **
//======================================================
//--------------------------------------------------------
#pragma mark - Queries
//--------------------------------------------------------
-(BOOL)kfx_containsOnlySignedDecimalDigits;
-(BOOL)kfx_containsAlphaNumericCharacters;

//--------------------------------------------------------
#pragma mark - Edit String
//--------------------------------------------------------
-(NSString*)kfx_stringByCapitalisingFirstLetter;

//--------------------------------------------------------
#pragma mark - Attributed String
//--------------------------------------------------------
-(NSAttributedString *)kfx_attributeStringWithAttributes:(NSDictionary *)attributes;


@end
