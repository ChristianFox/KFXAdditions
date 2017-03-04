


NS_ASSUME_NONNULL_BEGIN
@interface NSMutableSet (KFXAdditions)

/**
 * Checks if the object is nil and if it is not it adds the object to the set using --addObject:. If the object is nil then it does nothing but doesn't crash.
 * @param object The object you want to add to the set. Can be nil.
 * @return YES if the object was added, NO if it was not.
 * @since 0.10.0
 **/
-(BOOL)kfx_addObject:(id __nullable)object;


/**
 * Checks if the object is nil and if it is not it adds the object to the array using -insertObject:atIndex:. If the object is nil then it does nothing but doesn't crash.
 * @param object The object you want to add to the array. Can be nil.
 * @param index the index to insert the object at
 * @return YES if the object was inserted, NO if it was not.
 * @since 0.20.0
 **/
-(BOOL)kfx_insertObject:(id __nullable)object atIndex:(NSInteger)index;

@end
NS_ASSUME_NONNULL_END
