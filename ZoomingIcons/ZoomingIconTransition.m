//
//  ZoomingIconTransition.m
//  ZoomingIcons
//
//  Created by Johnny on 2015-02-19.
//  Copyright (c) 2015 Empath Solutions. All rights reserved.
//

#import "ZoomingIconTransition.h"
#import "MenuViewController.h"
#import "DetailViewController.h"


#
# pragma mark - Implementation
#


@implementation ZoomingIconTransition


#
# pragma mark Constants
#

static const NSTimeInterval kZoomingIconTransitionDuration = 1; // seconds


#
# pragma mark <UINavigationControllerDelegate>
#


- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController*)navigationController
								  animationControllerForOperation:(UINavigationControllerOperation)operation
											   fromViewController:(UIViewController*)fromVC
												 toViewController:(UIViewController*)toVC {

	if (![fromVC conformsToProtocol:@protocol(ZoomingIconTransitionViewHierarchy)]) {
		NSLog(@"Source view controller does not conform to zooming icon transition view hierachy: %@", fromVC);
		return nil;
	}
		
	if (![toVC conformsToProtocol:@protocol(ZoomingIconTransitionViewHierarchy)]) {
		NSLog(@"Destination viewController does not conform to zooming icon transition view hierachy: %@", toVC);
		return nil;
	}
	
	return self;
}


#
# pragma mark <UIViewControllerAnimatedTransitioning>
#


- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {

	return kZoomingIconTransitionDuration;
}


- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {

	// Grab context handles
	NSTimeInterval timeInterval = [self transitionDuration:transitionContext];
	MenuViewController* fromViewController = (MenuViewController*)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
	DetailViewController* toViewController = (DetailViewController*)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
	UIView* containerView = transitionContext.containerView;
	
	// Back button initially offscreen at top
	CGFloat backButtonTopConstraint = toViewController.backButtonTopConstraint.constant;
	toViewController.backButtonTopConstraint.constant = -100;
	
	// Name and summary initially offscreen at bottom
	CGFloat nameLabelBottomConstraint = toViewController.nameLabelBottomConstraint.constant;
	toViewController.nameLabelBottomConstraint.constant = -400;
	CGFloat summaryLabelBottomConstraint = toViewController.summaryLabelBottomConstraint.constant;
	toViewController.summaryLabelBottomConstraint.constant = -400;
	
	// Snapshot color and image view
	[containerView addSubview:fromViewController.view];
	UIView* socialItemViewSnapshot = [fromViewController.socialItemView snapshotViewAfterScreenUpdates:NO];
	UIView* socialItemImageViewSnapshot = [[UIImageView alloc] initWithImage: fromViewController.socialItemImageView.image];
	socialItemImageViewSnapshot.contentMode = UIViewContentModeScaleAspectFit;
	
	// Hide color and image views initially
	fromViewController.socialItemView.hidden = YES;
	fromViewController.socialItemImageView.hidden = YES;
	toViewController.socialItemView.hidden = YES;
	toViewController.socialItemImageView.hidden = YES;
	
	// Build view hierarchy in container view
	containerView.backgroundColor = [UIColor whiteColor];
	[containerView addSubview:fromViewController.view];
	[containerView addSubview:socialItemViewSnapshot];
	[containerView addSubview:toViewController.view];
	[containerView addSubview:socialItemImageViewSnapshot];

	// Clear background color of destination controller (but remember for later)
	UIColor* toViewBackgroundColor = toViewController.view.backgroundColor;
	toViewController.view.backgroundColor = [UIColor clearColor];
	
	// Set pre-animation state
	fromViewController.view.transform = CGAffineTransformIdentity;
	fromViewController.view.alpha = 1;
	socialItemViewSnapshot.transform = CGAffineTransformIdentity;
	socialItemViewSnapshot.frame = [containerView convertRect:fromViewController.socialItemView.frame fromView: fromViewController.socialItemView.superview];
	socialItemImageViewSnapshot.frame = [containerView convertRect:fromViewController.socialItemImageView.frame fromView:fromViewController.socialItemImageView.superview];

	// Trigger layout if needed
	[fromViewController.view layoutIfNeeded];
	
	// Animate transitions
	[UIView animateWithDuration:timeInterval animations:^{
		
		// Zoom out from non-selected social items
		fromViewController.view.transform = CGAffineTransformMakeScale(0.8, 0.8);
		fromViewController.view.alpha = 0;
		
		// Zoom menu view controller color and image views
		socialItemViewSnapshot.transform = CGAffineTransformMakeScale(15, 15);
		socialItemViewSnapshot.center = [containerView convertPoint:toViewController.socialItemImageView.center fromView:toViewController.socialItemImageView.superview];
		socialItemImageViewSnapshot.frame = [containerView convertRect:toViewController.socialItemImageView.frame fromView:toViewController.socialItemImageView.superview];
		
		// Move back button onscreen
		toViewController.backButtonTopConstraint.constant = backButtonTopConstraint;
		
		// Move name and summary onscreen
		toViewController.nameLabelBottomConstraint.constant = nameLabelBottomConstraint;
		toViewController.summaryLabelBottomConstraint.constant = summaryLabelBottomConstraint;
		
	} completion:^(BOOL finished) {
		
		fromViewController.view.transform = CGAffineTransformIdentity;
		
		[socialItemViewSnapshot removeFromSuperview];
		[socialItemImageViewSnapshot removeFromSuperview];
		
		// Show color and image views
		fromViewController.socialItemView.hidden = NO;
		fromViewController.socialItemImageView.hidden = NO;
		toViewController.socialItemView.hidden = NO;
		toViewController.socialItemImageView.hidden = NO;
		
		// Restore background color of destination controller
		toViewController.view.backgroundColor = toViewBackgroundColor;
		
		[transitionContext completeTransition:!transitionContext.transitionWasCancelled];
	}];
}


@end
