
#import <Foundation/Foundation.h>

@interface NSArray (KFXAdditions)

-(NSArray*)kfx_shuffledArray;
-(NSArray*)kfx_reversedArray;
-(id)kfx_randomObject;



/**
 * @brief Determines the depth of this collection. Counts the number of collections contained. 
 * @example An empty collection has a depth of 0; A collection with one object has a depth of 1; A collection containing an empty collection has a depth of 1; A collection containing a collection which contains a non-collection object has a depth of 1; A collection containing a collection which contains an object has a depth of 2.
 * @return The depth
 **/
-(NSUInteger)kfx_depth;


@end
