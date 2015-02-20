//
//  MenuViewController.m
//  ZoomingIcons
//
//  Created by Johnny on 2015-02-19.
//  Copyright (c) 2015 Empath Solutions. All rights reserved.
//

#import "MenuViewController.h"
#import "SocialItemCell.h"


#
# pragma mark - Constants
#


# define VERTICAL_PADDING			25 // points
# define CONTENT_VERTICAL_PADDING	(3 * VERTICAL_PADDING) // points
# define HORIZONTAL_PADDING			10 // points


#
# pragma mark - Interface
#


@interface MenuViewController ()

@property (nonatomic) NSArray* socialItems;

@end


#
# pragma mark - Implementation
#


@implementation MenuViewController


static NSString * const reuseIdentifier = @"socialItemCell";


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
	
	[self loadDataModel];
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
	
	SocialItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
	
	// Configure the cell
	
	cell.socialItem = self.socialItems[indexPath.section][indexPath.item];
	
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
	
	CGFloat leftInset = (viewWidth - contentWidth) / 2;
	CGFloat rightInset = leftInset;
	
	return UIEdgeInsetsMake(VERTICAL_PADDING, leftInset, VERTICAL_PADDING, rightInset);
}


#
# pragma mark Helpers
#


- (void)loadDataModel {
	
	self.socialItems =
	@[
	  @[
		  [SocialItem socialItemWithName:@"Twitter"
							  andSummary:@"Twitter is an online social networking service that enables users to send and read short 140-character messages called \"tweets\"."
								andImage:[UIImage imageNamed:@"icon-twitter"]
								andColor:[UIColor colorWithRed:0.255 green:0.557 blue:0.910 alpha:1]],
		  
		  [SocialItem socialItemWithName:@"Facebook"
							  andSummary:@"Facebook (formerly thefacebook) is an online social networking service headquartered in Menlo Park, California. Its name comes from a colloquialism for the directory given to students at some American universities."
								andImage:[UIImage imageNamed:@"icon-facebook"]
								andColor:[UIColor colorWithRed:0.239 green:0.353 blue:0.588 alpha:1]],
		  ],
	  @[
		  [SocialItem socialItemWithName:@"Youtube"
							  andSummary:@"YouTube is a video-sharing website headquartered in San Bruno, California. The service was created by three former PayPal employees in February 2005 and has been owned by Google since late 2006. The site allows users to upload, view, and share videos."
								andImage:[UIImage imageNamed:@"icon-youtube"]
								andColor:[UIColor colorWithRed:0.729 green:0.188 blue:0.180 alpha:1]],
		  
		  [SocialItem socialItemWithName:@"Vimeo"
							  andSummary:@"Vimeo is a U.S.-based video-sharing website on which users can upload, share and view videos. Vimeo was founded in November 2004 by Jake Lodwick and Zach Klein."
								andImage:[UIImage imageNamed:@"icon-vimeo"]
								andColor:[UIColor colorWithRed:0.329 green:0.737 blue:0.988 alpha:1]],
		  
		  [SocialItem socialItemWithName:@"Instagram"
							  andSummary:@"Instagram is an online mobile photo-sharing, video-sharing and social networking service that enables its users to take pictures and videos, and share them on a variety of social networking platforms, such as Facebook, Twitter, Tumblr and Flickr."
								andImage:[UIImage imageNamed:@"icon-instagram"]
								andColor:[UIColor colorWithRed:0.325 green:0.498 blue:0.635 alpha:1]]
		  ]
	  ];
}


@end
