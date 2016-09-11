


#import <Foundation/Foundation.h>

@interface NSObject (KFXAdditions)


#pragma mark - Properties of a class (introspection?)
+ (NSDictionary *)kfx_propertiesOfClass:(Class)klass;



#pragma mark - Blocks 
-(void)kfx_waitUntilDone:(void(^)(void))waitBlock;
- (void) kfx_performBlock: (dispatch_block_t) block
           afterDelay: (NSTimeInterval) delay;


@end
