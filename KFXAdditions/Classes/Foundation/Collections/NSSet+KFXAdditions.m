

#import "NSSet+KFXAdditions.h"
// Other Categories
#import "NSDictionary+KFXAdditions.h"
#import "NSArray+KFXAdditions.h"


@implementation NSSet (KFXAdditions)

-(NSUInteger)kfx_depth{
    
    NSUInteger highestCount = 0;
    NSUInteger currentCount = 0;
    for (id obj in self) {
        
        currentCount = 0;
        if (![obj respondsToSelector:@selector(kfx_depth)]) {
            currentCount = 1;
        }else{
            currentCount = [self kfx_depthOfCollection:obj];
        }
        if (currentCount > highestCount) {
            highestCount = currentCount;
        }
    }
    return highestCount;
}

-(NSUInteger)kfx_depthOfCollection:(id)collection{
    
    NSUInteger count = 0;
    if ([collection respondsToSelector:@selector(count)]) {
        
        if ([collection respondsToSelector:@selector(kfx_depth)]) {
            
            count++;
            count += [collection kfx_depth];
        }
    }
    return count;
}


@end
