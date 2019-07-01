
# ChangeLog - KFXAdditions

### 2.5.0 | UIView Bug fix and UICollectionViewCell additions
- Adds kfx_reuseIdentifier; & kfx_nib; to UICollectionViewCell
- Fixes error in  UIView -top; where it was using self.x instead of self.y

### 2.4.0 | Adds -kfx_combineWithColour: amount: to UIColor

### 2.3.1 | Fixes MKMapKit+KFXAdditions being in the wrong folder

### 2.3.0 | Various Additions
- Adds convenience initiliser method to NSIndexPath +kfx_zeroZeroPath;
- Adds methods to NSString for getting initials
- Fixes crash when using +kfx_urlFromHTMLString:...
- Adds MKMapView Additions
- Adds -kfx_presentWebPageWithURL: to UIViewController
- Adds -kfx_showOpenSettingsAlertWithTitle to UIViewController
- Adds -kfx_removeObjectsMatchingPredicate: to NSMutableArray
- Adds methods to UITableViewCell: kfx_reuseIdentifier;, kfx_nib
- Includes UINavigationController+KFXAdditions.h in UIKitAdditions.h

### 2.2.0 | Various Additions 
- Adds methods for converting between NSIndexPaths and view.tags
- Adds method to UINavigationController for making the nav bar invisible
- Adds method to NSURL for finding a URL in HTML
- Adds methods to NSAttributedString for converting HTML to an AttributedString

### 2.1.1 | Imports CoreGraphics into NSString so that CGFloat can be used

### 2.1.0 | Various additions
- Improves this method -kfx_currentCalendarDateComponents; so that it sets the calendar on the NSDateComponents object
- Adds method to NSDate -kfx_isCloseToDate: withinSeconds:
- Adds method to CLLocation +locationFromString:withSeparator:
- Adds methods to NSJSONSerialization for converting a JSON object to a string and vice versa.

### 2.0.3 | Correctly fixes Licence

### 2.0.2 | Updates Licence

### 2.0.1 | Updates README.md, adds unimplemented method to NSAttributedString+KFXAdditions

### 2.0.0...
- Update Readme, Licence and podspec
- Move project to github

### 1.2.2
- Fixes issue with NSAttributedString+KFXAdditions because NSText needed to be imported

### 1.2.1
- Fixes issue with NSAttributedString+KFXAdditions because UIFont, UIColor and CoreGraphics needed to be imported

### 1.2.0
- Adds more documenting comments
- Adds more methods to NSDate: -kfx_isToday;, -kfx_isThisMonth;, -kfx_isThisYear;
- Adds more convinence initilisers to NSAttributedString
- Adds -kfx_matchPercentageWithOtherString: to NSString

### 1.1.1 - minor fixes

### 1.1.0 - More additions
- Adds UIBezierPath+KFXAdditions
- Adds +kfx_arrayByCombingObjectsFromArrays: to NSArray
- Adds documenting comments to CLLocation+KFXAdditions
- Adds new initiliser to CLLocation
- Adds -kfx_addRoundedCorners: to UIView
- Adds NSURL+KFXAdditions with kfx_queryParameters

## 1.0.0 -
- Adds convience headers for importing all additions
- Adds UIButton+KFXAdditions
- Adds UITableView+KFXAdditions
- Adds MKMapKit+KFXAdditions
- Adds methods to UIView+KFXAdditions
- Adds methods to NSString+KFXAdditions
- Adds methods to NSDate+KFXAdditions

## 0.36.1 - Fix bug because calling [NSThread mainThread] instead of [NSThread isMainThread]

## 0.36.0 - Switch to new bb repo

## 0.35.3
- Adds #pragma clang diagnostic ignored '-Wdeprecated-declarations' to UIApplication+KFXAdditions +kfx_pushNotificationsEnabled; 

## 0.35.2
- updates podspec

## 0.35.1
- Updates License headers

## 0.35.0
- Sort categories into folders

## 0.34.0
- Updates Licence file

## 0.33.1
- Fix code error: NSError+KFXAdditions not getting the bundleId correctly

## 0.33.0
- NSError+KFXAdditions: fixes some string format errors
- NSDate+KFXAdditions: Adds -kfx_isTimeEqualToDate:, -kfx_isEarlierThanOrEqualToDate:, -kfx_isLaterThanOrEqualToDate
- Adds NSNumber+KFXAdditions with comparison methods
- Adds masking method to UIImage
- Adds -className & +className methods to NSObject
- Adds more methods to UIColor
- Adds +kfx_instantiateFromNib; method to UIView & UIViewController
- Adds two new resize image methods to UIImage

## 0.32.0 NSError+KFXAdditions update
- NSError+KFXAdditions: Adds some new error codes and fixes some typos

## 0.31.0
- Adds NSError+KFXAdditions with a well populated error code enum and many useful methods

## 0.30.0
- Improves additions in UITableViewController and UIViewController which were switching to main thread without checking if already on main thread, now check first and only switch if necessary
- Adds -kfx_deepCopy; to NSObject
- Adds +(UIImage*)kfx_tintImage:(UIImage *)image withColor:(UIColor *)color to UIImage
- UIApplication : adds +kfx_isActive, +kfx_isInactive, +kfx_isBackground

## 0.29.0
- Adds -kfx_pushNotificationsEnabled; to UIApplication
- UIViewController : Changes -hasBeenPresentedModally to -kfx_hasBeenPresentedModally;
- Adds comments to Crayon colour s of UIColor+KFXAdditions
- Adds -kfx_setAttributedText:withDefault: to UILabel
- Adds -kfx_setAttributedText:withDefault: to UITextView

## 0.28.0
- Adds -kfx_openURL:options:completionHandler: to UIApplication
- Adds UIFont+KFXAddtions
- Adds +logAvailableFonts; to UIFont

## 0.27.0
- Adds -kfx_setTextToNumber:withDefault: to UILabel
- Adds NSDictionary+KFXAdditions
- Adds NSSet+KFXAdditions
- Adds -kfx_depth; to NSArray, NSDictionary, NSSet

## 0.26.0
- Adds +kfx_yesOrNo: and +kfx_trueOrFalse: methods to NSString
- Adds +kfx_hasBackgroundModeEnabled to UIApplication
- Adds -kfx_setText:withDefault: to UILabel
- Adds -kfx_setText:withDefault: to UITextView

## 0.25.0
- Adds -kfx_rangeOfString; to NSString & NSAttributedString
- Adds -kfx_attributedString; to NSString

## 0.24.0
- Fixes bug (wrong image used as a parameter) in method -kfx_applyBlurWithRadius:(CGFloat)blurRadius
- Adds -hasBeenPresentedModally to UIViewController+KFXAdditions

## 0.23.0
- Adds -kfx_applyBlurWithRadius:(CGFloat)blurRadius to UIImage+KFXAdditions

## 0.22.0
- Fixes bug with NSString kfx_randomStringOfLength: withStringComponents: that caused the bitmask to not be read correctly
- Adds -kfx_insertObject:atIndex: to NSMutableArray+KFXAdditions
- Adds NSAttributedString+KFXAdditions with 4 convienence initilisers
- Adds UIViewController, UITableViewController, UICollectionViewController + KFXAdditions
- Moves -kfx_addBorderWithRadius:width:colour: to UIView+KFXAdditions


## 0.21.0 | 2017/02/21
- Adds -kfx_cleanTelephoneNumber; method to NSString
- Adds UIImageView+KFXAdditions
- Add -kfx_addBorderWithRadius:width:colour: to UIImageView+KFXAdditions

## 0.20.0 | 2016/12/28
- Adds more methods to NSDate+KFXAdditions

## 0.19.0 | 2016/12/11
- Adds -kfx_normalisedString to NSString+KFXAdditions


## 0.18.0 | 09/11/2016
- Adds -kfx_formattedAge to CLLocation+KFXAdditions


## 0.17.0 | 09/11/2016
- Adds -kfx_age method to CLLocation+KFXAdditions


## 0.16.0
- Adds UIAlertController+KFXAdditions category with 3 convinence initilisers

## 0.15.0



## 0.14.0
- Adds CLLocation+KFXAdditions with many query and formatting methods
- Adjust NSKeyedArchiver and NSKeyedUnarchive categories
