

#import "UITableViewController+KFXAdditions.h"

@implementation UITableViewController (KFXAdditions)

//--------------------------------------------------------
#pragma mark - Data
//--------------------------------------------------------
-(void)kfx_reloadDataOnMainQueue{
	dispatch_async(dispatch_get_main_queue(), ^{
		[self.tableView reloadData];
	});
}



@end
