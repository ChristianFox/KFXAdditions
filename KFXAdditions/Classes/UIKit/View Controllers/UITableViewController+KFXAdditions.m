

#import "UITableViewController+KFXAdditions.h"

@implementation UITableViewController (KFXAdditions)

//--------------------------------------------------------
#pragma mark - Data
//--------------------------------------------------------
-(void)kfx_reloadDataOnMainQueue{
    if ([NSThread isMainThread]) {
        [self.tableView reloadData];
    }else{
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    }
}



@end
