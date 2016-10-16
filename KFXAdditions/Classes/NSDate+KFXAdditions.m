

#import "NSDate+KFXAdditions.h"

@implementation NSDate (KFXAdditions)

-(BOOL)kfx_isLaterThanDate:(NSDate *)anotherDate{
    
    NSComparisonResult result = [self compare:anotherDate];
    if (result == NSOrderedAscending) {
        return NO;
    }else if (result == NSOrderedSame){
        return NO;
    }else{
        return YES;
    }
}

-(BOOL)kfx_isEarlierThanDate:(NSDate *)anotherDate{
    
    NSComparisonResult result = [self compare:anotherDate];
    if (result == NSOrderedDescending) {
        return NO;
    }else if (result == NSOrderedSame){
        return NO;
    }else{
        return YES;
    }
}

@end
