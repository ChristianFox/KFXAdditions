


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

-(BOOL)kfx_setAttributedText:(NSAttributedString *)text withDefault:(NSAttributedString *)defaultText{
    
    if (text == nil || [text isEqual:[NSNull null]] || text.string.length == 0) {
        self.attributedText = defaultText;
        return NO;
    }else{
        self.attributedText = text;
        return YES;
    }
    
}


@end
