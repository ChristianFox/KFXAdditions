

#import <UIKit/UIKit.h>

@interface UITableViewController (KFXAdditions)

//--------------------------------------------------------
#pragma mark - Data
//--------------------------------------------------------
/**
 * @brief Simply dispatches onto the main queue and calls reloadData on self.tableView
 * @since 0.22.0
 **/
-(void)kfx_reloadDataOnMainQueue;

@end
