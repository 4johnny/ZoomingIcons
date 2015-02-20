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


- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
	
	return self;
}


#
# pragma mark <UIViewControllerAnimatedTransitioning>
#


- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {

	return kZoomingIconTransitionDuration;
}


- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
	
	NSTimeInterval timeInterval = [self transitionDuration:transitionContext];
	
	MenuViewController* fromViewController = (MenuViewController*)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
	DetailViewController* toViewController = (DetailViewController*)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
	
	UIView* containerView = transitionContext.containerView;
	
	[containerView addSubview:fromViewController.view];
	[containerView addSubview:toViewController.view];
	
	// Faded out initially
	toViewController.view.alpha = 0;
	
	// Back button initially offscreen at top
	CGFloat backButtonTopConstraint = toViewController.backButtonTopConstraint.constant;
	toViewController.backButtonTopConstraint.constant = -100;
	
	// Name and summary initially offscreen at bottom
	CGFloat nameLabelBottomConstraint = toViewController.nameLabelBottomConstraint.constant;
	toViewController.nameLabelBottomConstraint.constant = -400;
	CGFloat summaryLabelBottomConstraint = toViewController.summaryLabelBottomConstraint.constant;
	toViewController.summaryLabelBottomConstraint.constant = -400;
	
	[toViewController.view layoutIfNeeded];
	
	// Animate transitions
	[UIView animateWithDuration:timeInterval animations:^{
		
		// Fade in
		toViewController.view.alpha = 1;
		
		// Move back button onscreen
		toViewController.backButtonTopConstraint.constant = backButtonTopConstraint;
		
		// Move name and summary onscreen
		toViewController.nameLabelBottomConstraint.constant = nameLabelBottomConstraint;
		toViewController.summaryLabelBottomConstraint.constant = summaryLabelBottomConstraint;

		[toViewController.view layoutIfNeeded];
		
	} completion:nil];
}


@end
