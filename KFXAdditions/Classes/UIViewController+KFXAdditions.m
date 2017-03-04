

#import "UIViewController+KFXAdditions.h"
// Other Categories
#import "UIAlertController+KFXAdditions.h"

@implementation UIViewController (KFXAdditions)



//--------------------------------------------------------
#pragma mark - Navigation
//--------------------------------------------------------
-(void)kfx_dismissViewController{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)kfx_dismissViewControllerFromPresenting{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}


//--------------------------------------------------------
#pragma mark Alerts
//--------------------------------------------------------
-(void)kfx_showSimpleAlertWithTitle:(NSString *)title message:(NSString *)message buttonTitle:(NSString *)buttonTitle{
	
	dispatch_async(dispatch_get_main_queue(), ^{
		NSString *buttonTitle2 = buttonTitle;
		if (buttonTitle2 == nil) {
			buttonTitle2 = NSLocalizedString(@"Okay", @"Okay / agree / accept");
		}
		UIAlertController *alert = [UIAlertController kfx_alertControllerWithTitle:title message:message singleButtonTitle:buttonTitle2];
		[self presentViewController:alert animated:YES completion:nil];
	});
	
}

-(void)kfx_showSimpleAlertWithTitle:(NSString *)title message:(NSString *)message buttonTitle:(NSString *)buttonTitle buttonCompletion:(void (^)(UIAlertAction *))completionBlock{
	
	dispatch_async(dispatch_get_main_queue(), ^{
		NSString *buttonTitle2 = buttonTitle;
		if (buttonTitle2 == nil) {
			buttonTitle2 = NSLocalizedString(@"Okay", @"Okay / agree / accept");
		}
		UIAlertController *alert = [UIAlertController kfx_alertControllerWithTitle:title message:message singleButtonTitle:buttonTitle2 buttonTappedCompletionBlock:completionBlock];
		[self presentViewController:alert animated:YES completion:nil];
	});
	
}

-(void)kfx_showErrorAlertWithMessage:(NSString *)message{
	
	[self kfx_showSimpleAlertWithTitle:NSLocalizedString(@"Error", @"An error occurred")
							   message:message
						   buttonTitle:nil];
}

-(void)kfx_showSuccessAlertWithMessage:(NSString *)message{
	
	[self kfx_showSimpleAlertWithTitle:NSLocalizedString(@"Success", @"The operation was a success")
							   message:message
						   buttonTitle:nil];
}

//--------------------------------------------------------
#pragma mark - Child View Controllers
//--------------------------------------------------------
-(void)kfx_addChildViewController:(UIViewController *)childVC toView:(UIView *)view{
	[childVC willMoveToParentViewController:self];
	[self addChildViewController:childVC];
	childVC.view.frame = view.bounds;
	[view addSubview:childVC.view];
	[childVC didMoveToParentViewController:self];
}

-(void)kfx_addChildViewController:(UIViewController *)childVC toView:(UIView *)view withFrame:(CGRect)frame{
	[childVC willMoveToParentViewController:self];
	[self addChildViewController:childVC];
	childVC.view.frame = frame;
	[view addSubview:childVC.view];
	[childVC didMoveToParentViewController:self];
}

-(void)kfx_removeChildViewController:(UIViewController *)childVC{
	if ([childVC respondsToSelector:@selector(setDelegate:)]) {
		[childVC performSelector:@selector(setDelegate:) withObject:nil];
	}
	[childVC willMoveToParentViewController:nil];
	[childVC.view removeFromSuperview];
	[childVC removeFromParentViewController];
}


-(NSArray *)kfx_findChildViewControllersOfClass:(Class)childClass{
	NSMutableArray *mutArray = [[NSMutableArray alloc]initWithCapacity:2];
	for (UIViewController *childVC in self.childViewControllers) {
		if ([childVC isKindOfClass:childClass]) {
			[mutArray addObject:childVC];
		}
	}
	return [mutArray copy];
}


@end
