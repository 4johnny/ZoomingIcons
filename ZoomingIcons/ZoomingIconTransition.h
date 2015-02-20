//
//  ZoomingIconTransition.h
//  ZoomingIcons
//
//  Created by Johnny on 2015-02-19.
//  Copyright (c) 2015 Empath Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>


#
# pragma mark - Protocol
#

@protocol ZoomingIconTransitionViewHierarchy <NSObject>

@property (strong, nonatomic) IBOutlet UIView* socialItemView;
@property (weak, nonatomic) IBOutlet UIImageView* socialItemImageView;

@end

#
# pragma mark - Interface
#

@interface ZoomingIconTransition : NSObject <UINavigationControllerDelegate, UIViewControllerAnimatedTransitioning>

@end
