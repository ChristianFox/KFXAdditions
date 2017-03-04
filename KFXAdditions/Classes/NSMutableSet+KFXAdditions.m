


#import "NSMutableSet+KFXAdditions.h"

@implementation NSMutableSet (KFXAdditions)


-(BOOL)kfx_addObject:(id)object{
    
    if (object != nil) {
        [self addObject:object];
        return YES;
    }
    return NO;
}

-(BOOL)kfx_insertObject:(id)object atIndex:(NSInteger)index{
	
	if (object != nil) {
		[self insertObject:object atIndex:index];
		return YES;
	}
	return NO;
}

@end
