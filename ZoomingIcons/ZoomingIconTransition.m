//
//  ZoomingIconTransition.m
//  ZoomingIcons
//
//  Created by Johnny on 2015-02-19.
//  Copyright (c) 2015 Empath Solutions. All rights reserved.
//

#import "ZoomingIconTransition.h"


#
# pragma mark - Implementation
#


@implementation ZoomingIconTransition


#
# pragma mark Constants
#

static const NSTimeInterval kZoomingIconTransitionDuration = 1; // seconds


#
# pragma mark <UIViewControllerAnimatedTransitioning>
#


- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {

	return kZoomingIconTransitionDuration;
}


-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
	
	NSTimeInterval timeInterval = [self transitionDuration:transitionContext];
	
	UIViewController* fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
	UIViewController* toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
	
	UIView* containerView = transitionContext.containerView;
	
	[containerView addSubview:fromViewController.view];
	[containerView addSubview:toViewController.view];
	
	toViewController.view.alpha = 0;
	
	[UIView animateWithDuration:timeInterval animations:^{
		
		toViewController.view.alpha = 1;
		
	} completion:^(BOOL finished) {
		
	}];
}


#
# pragma mark <UINavigationControllerDelegate>
#


- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
	
	return self;
}


@end
