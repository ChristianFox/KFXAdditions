


#import "NSString+KFXAdditions.h"

@implementation NSString (KFXAdditions)

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

-(NSString *)kfx_stringByCapitalisingFirstLetter{
    
    NSString *uppercaseFirstLetter = [[self substringToIndex:1]uppercaseString];
    NSString *capitalised = [self stringByReplacingCharactersInRange:NSMakeRange(0, 1)
                                                                               withString:uppercaseFirstLetter];
    return capitalised;    
}


-(BOOL)kfx_containsOnlySignedDecimalDigits{
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
    NSNumber *number = [formatter numberFromString:self];
    return (number != nil) ? YES : NO;

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







@end
