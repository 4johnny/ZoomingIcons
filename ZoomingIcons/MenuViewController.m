//
//  MenuViewController.m
//  ZoomingIcons
//
//  Created by Johnny on 2015-02-19.
//  Copyright (c) 2015 Empath Solutions. All rights reserved.
//

#import "MenuViewController.h"
#import "MenuViewCell.h"


#
# pragma mark - Constants
#


# define VERTICAL_PADDING	25 // points
# define CONTENT_VERTICAL_PADDING (3 * VERTICAL_PADDING)
# define HORIZONTAL_PADDING	10 // points


#
# pragma mark - Interface
#


@interface MenuViewController ()

@end


#
# pragma mark - Implementation
#


@implementation MenuViewController


static NSString * const reuseIdentifier = @"menuViewCell";


#
# pragma mark UIViewController
#


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
	//    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
	
    // Do any additional setup after loading the view.
	
	self.collectionView.contentInset = UIEdgeInsetsMake(CONTENT_VERTICAL_PADDING, 0, CONTENT_VERTICAL_PADDING, 0);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#
# pragma mark <UICollectionViewDataSource>
#


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

	return 2;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

	return section == 0 ? 2 : 3;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
	
    MenuViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
	
    
    return cell;
}


#
# pragma mark <UICollectionViewDelegate>
#


/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/


#
# pragma mark <UICollectionViewDelegateFlowLayout>
#


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
	
	NSInteger numItems = [self collectionView:collectionView numberOfItemsInSection:section];
	NSInteger itemWidth = ((UICollectionViewFlowLayout*)collectionViewLayout).itemSize.width;
	NSInteger viewWidth = collectionView.bounds.size.width;
	
	CGFloat contentWidth = numItems * itemWidth + (numItems - 1) * HORIZONTAL_PADDING;
	
	CGFloat left = (viewWidth - contentWidth) / 2;
	CGFloat right = left;
	
	return UIEdgeInsetsMake(VERTICAL_PADDING, left, VERTICAL_PADDING, right);
}


@end
