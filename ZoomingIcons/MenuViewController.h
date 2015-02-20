//
//  MenuViewController.h
//  ZoomingIcons
//
//  Created by Johnny on 2015-02-19.
//  Copyright (c) 2015 Empath Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZoomingIconTransition.h"

#
# pragma mark - Interface
#

@interface MenuViewController : UICollectionViewController <UICollectionViewDelegateFlowLayout, ZoomingIconTransitionViewHierarchy>

@property (strong, nonatomic) IBOutlet UIView* socialItemView;
@property (weak, nonatomic) IBOutlet UIImageView* socialItemImageView;

@end
