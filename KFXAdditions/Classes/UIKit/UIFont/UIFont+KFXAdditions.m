


#import "UIFont+KFXAdditions.h"

@implementation UIFont (KFXAdditions)

+(void)logAvailableFonts{
    
    for (NSString* family in [UIFont familyNames])
    {
        NSLog(@"%@", family);
        
        for (NSString* name in [UIFont fontNamesForFamilyName: family])
        {
            NSLog(@"  %@", name);
        }
    }
    
}


@end
