
#import <Foundation/Foundation.h>

@interface NSAttributedString (KFXAdditions)

//--------------------------------------------------------
#pragma mark - Convience Initilisers
//--------------------------------------------------------
+(instancetype)kfx_instanceWithString:(NSString*)string;
+(instancetype)kfx_instanceWithString:(NSString*)string attributes:(NSDictionary*)attributes;
+(instancetype)kfx_instanceWithFormat:(NSString*)format,...;
+(instancetype)kfx_instanceWithAttributes:(NSDictionary*)attributes format:(NSString*)format,...;

@end
