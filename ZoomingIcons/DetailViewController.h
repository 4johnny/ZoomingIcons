//
//  DetailViewController.h
//  ZoomingIcons
//
//  Created by Johnny on 2015-02-19.
//  Copyright (c) 2015 Empath Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SocialItem.h"
#import "ZoomingIconTransition.h"

#
# pragma mark - Interface
#

@interface DetailViewController : UIViewController <ZoomingIconTransitionViewHierarchy>

#
# pragma mark Properties
#

@property (nonatomic) SocialItem* socialItem;

#
# pragma mark Outlets
#

@property (strong, nonatomic) IBOutlet UIView* socialItemView;

@property (weak, nonatomic) IBOutlet UIButton* backButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint* backButtonTopConstraint;

@property (weak, nonatomic) IBOutlet UIImageView* socialItemImageView;

@property (weak, nonatomic) IBOutlet UILabel* socialItemNameLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint* nameLabelBottomConstraint;

@property (weak, nonatomic) IBOutlet UILabel* socialItemSummaryLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint* summaryLabelBottomConstraint;

@end
