//
//  SocialItemCell.h
//  ZoomingIcons
//
//  Created by Johnny on 2015-02-19.
//  Copyright (c) 2015 Empath Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SocialItem.h"

#
# pragma mark - Interface
#

@interface SocialItemCell : UICollectionViewCell

#
# pragma mark Properties
#

@property (nonatomic) SocialItem* socialItem;

@property (weak, nonatomic) IBOutlet UIView *socialItemCellView;
@property (weak, nonatomic) IBOutlet UIImageView *socialItemImageView;

#
# pragma mark Initializers
#

- (instancetype)initWithFrame:(CGRect)frame andSocialItem:(SocialItem*)socialItem;
- (instancetype)init;

+ (instancetype)socialItemCellWithFrame:(CGRect)frame andSocialItem:(SocialItem*)socialItem;
	
@end
