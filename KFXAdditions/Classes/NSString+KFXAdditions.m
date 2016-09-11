


#import "NSString+KFXAdditions.h"

@implementation NSString (KFXAdditions)



//======================================================
#pragma mark - ** Class Methods **
//======================================================
+(NSString *)kfx_randomStringOfLength:(int)length{
    
    NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    int randMax = (int)letters.length;
    
    NSMutableString *mutString = [[NSMutableString alloc]initWithString:@""];
    for (int idx = 0; idx < length; idx++) {
        
        int randInt = arc4random_uniform(randMax);
        [mutString appendFormat: @"%C", [letters characterAtIndex: randInt]];
        
    }
    return [mutString copy];
}


+(NSString *)kfx_stringByCombiningComponents:(NSArray<NSString *> *)components separatedByString:(NSString *)separator{
    
    NSMutableString *mutString = [[NSMutableString alloc]init];
    
    NSInteger idx = 0;
    for (NSString *subString in components) {
        [mutString appendString:subString];
        if (++idx < components.count) {
            [mutString appendString:separator];
        }
    }
    return [mutString copy];
}



//======================================================
#pragma mark - ** Instance Methods **
//======================================================
//--------------------------------------------------------
#pragma mark - Queries
//--------------------------------------------------------
-(BOOL)kfx_containsOnlySignedDecimalDigits{
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
    NSNumber *number = [formatter numberFromString:self];
    return (number != nil) ? YES : NO;
    
}

-(BOOL)kfx_containsAlphaNumericCharacters{
    
    NSCharacterSet *s = [NSCharacterSet alphanumericCharacterSet];
    NSRange r = [self rangeOfCharacterFromSet:s];
    if (r.location == NSNotFound) {
        return NO;
    }else{
        return YES;
    }
}


//--------------------------------------------------------
#pragma mark - Edit String
//--------------------------------------------------------
-(NSString *)kfx_stringByCapitalisingFirstLetter{
    
    NSString *uppercaseFirstLetter = [[self substringToIndex:1]uppercaseString];
    NSString *capitalised = [self stringByReplacingCharactersInRange:NSMakeRange(0, 1)
                                                                               withString:uppercaseFirstLetter];
    return capitalised;    
}




//--------------------------------------------------------
#pragma mark - Attributed String
//--------------------------------------------------------

-(NSAttributedString *)kfx_attributeStringWithAttributes:(NSDictionary *)attributes{
	
	NSAttributedString *attributedString = [[NSAttributedString alloc]initWithString:self
																		  attributes:attributes];
	return attributedString;
}






@end
