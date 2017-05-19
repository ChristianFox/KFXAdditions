


#import <Foundation/Foundation.h>

@interface NSIndexPath (KFXAdditions)


//--------------------------------------------------------
#pragma mark Creating Arrays of Index Paths
//--------------------------------------------------------
/**
 
 Ripped from iOSKit http://foundationk.it
 
 This method returns an array of indexPaths in the same section.
 The row index starts with startRow (including) and ends with endRow (including).
 
 @param startRow the row-index to start
 @param endRow the row-index to end
 @param section the section index of the indexPaths
 @return an array of indexPaths in the given section, starting from startRow to endRow
 */
+ (NSArray<NSIndexPath*>*)kfx_indexPathsFromRow:(NSInteger)startRow
							 toRow:(NSInteger)endRow
						 inSection:(NSInteger)section;

+ (NSArray<NSIndexPath*>*)kfx_indexPathsFromItem:(NSInteger)startItem
										  toItem:(NSInteger)endItem
									  inSection:(NSInteger)section;


@end
