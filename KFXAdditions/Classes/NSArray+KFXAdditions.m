

#import "NSArray+KFXAdditions.h"

@implementation NSArray (KFXAdditions)

-(NSArray *)kfx_shuffledArray{
    NSUInteger i = self.count;
    NSMutableArray *shuffledArray = [self mutableCopy];
    
    while (i) {
        NSUInteger randomIndex = arc4random_uniform((u_int32_t)i);
        [shuffledArray exchangeObjectAtIndex:randomIndex withObjectAtIndex:--i];
    }
    
    return [shuffledArray copy];
}

-(NSArray *)kfx_reversedArray{
    NSMutableArray *reversedArray = [self mutableCopy];
    
    NSUInteger count = reversedArray.count;
    
    for (int i = 0; i < count / 2; i++) {
        [reversedArray exchangeObjectAtIndex:i withObjectAtIndex:(count - 1 - i)];
    }
    
    return [reversedArray copy];
}

-(id)kfx_randomObject {
    if (self.count <= (uint32_t)-1) {
        uint32_t count = (uint32_t)self.count;
        return [self objectAtIndex:arc4random_uniform(count)];
    }else{
        return [self objectAtIndex:arc4random() % self.count];
    }
}


@end
