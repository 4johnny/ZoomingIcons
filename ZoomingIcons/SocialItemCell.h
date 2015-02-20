//
//  SocialItemCell.h
//  ZoomingIcons
//
//  Created by Johnny on 2015-02-19.
//  Copyright (c) 2015 Empath Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

#
# pragma mark - Interface
#

@interface SocialItemCell : UICollectionViewCell

#
# pragma mark Properties
#

@property (weak, nonatomic) IBOutlet UIView *socialItemCellView;
@property (weak, nonatomic) IBOutlet UIImageView *socialItemImageView;

@end
