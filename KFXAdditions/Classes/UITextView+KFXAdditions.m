


#import "UITextView+KFXAdditions.h"

@implementation UITextView (KFXAdditions)

-(BOOL)kfx_setText:(NSString*)text withDefault:(NSString*)defaultText{
    
    if (text == nil || [text isEqual:[NSNull null]] || text.length == 0) {
        self.text = defaultText;
        return NO;
    }else{
        self.text = text;
        return YES;
    }
}

@end
