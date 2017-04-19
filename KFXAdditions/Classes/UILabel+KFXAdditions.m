

#import "UILabel+KFXAdditions.h"

@implementation UILabel (KFXAdditions)

-(BOOL)kfx_setText:(NSString*)text withDefault:(NSString*)defaultText{

    if (text == nil || [text isEqual:[NSNull null]] || text.length == 0) {
        self.text = defaultText;
        return NO;
    }else{
        self.text = text;
        return YES;
    }
}

-(BOOL)kfx_setTextToNumber:(NSNumber *)number withDefault:(NSString *)defaultText{
    
    if (number == nil || [number isEqual:[NSNull null]]) {
        self.text = defaultText;
        return NO;
    }else{
        self.text = [number stringValue];
        return YES;
    }
    
}


@end
