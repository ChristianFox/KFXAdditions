//
//  NSMutableDictionary+KFXAdditions.h
//  Pods
//
//  Created by Eyeye on 07/09/2016.
//
//


NS_ASSUME_NONNULL_BEGIN
@interface NSMutableDictionary (KFXAdditions)


/**
 * Checks if the object and key are nil and if they are not it adds the object to the dictionary using -setObject:forKey:. If either the object or key are nil then it does nothing but doesn't crash.
 * @param object The object you want to add to the dictionary. Can be nil.
 * @param key The key to use when adding the object. Can be nil. Must conform to NSCopying.
 * @return YES if the object was added, NO if it was not.
 * @since 0.5.0
 **/
-(BOOL)kfx_setObject:(id __nullable)object forKey:(id<NSCopying> __nullable)key;

@end
NS_ASSUME_NONNULL_END
