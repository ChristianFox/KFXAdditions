

#import <UIKit/UIKit.h>

@interface UICollectionViewController (KFXAdditions)

//--------------------------------------------------------
#pragma mark - Data
//--------------------------------------------------------
/**
 * @brief Simply dispatches onto the main queue and calls reloadData on self.collectionView
 * @since 0.22.0
 **/
-(void)kfx_reloadDataOnMainQueue;

@end
