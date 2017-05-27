
#import "UICollectionViewController+KFXAdditions.h"

@implementation UICollectionViewController (KFXAdditions)

//--------------------------------------------------------
#pragma mark - Data
//--------------------------------------------------------
-(void)kfx_reloadDataOnMainQueue{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.collectionView reloadData];
    });
}





@end
