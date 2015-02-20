//
//  SocialItemCell.m
//  ZoomingIcons
//
//  Created by Johnny on 2015-02-19.
//  Copyright (c) 2015 Empath Solutions. All rights reserved.
//

#import "SocialItemCell.h"
#import "SocialItem.h"


#
# pragma mark - Interface
#

@interface SocialItemCell ()

@end


#
# pragma mark - Implementation
#


@implementation SocialItemCell


#
# pragma mark Property Accessors
#


- (void)setSocialItem:(SocialItem*)socialItem {

	_socialItem = socialItem;

	self.socialItemImageView.image = _socialItem.image;
	self.socialItemCellView.backgroundColor = _socialItem.color;
}


#
# pragma mark Initializers
#


- (instancetype)initWithFrame:(CGRect)frame andSocialItem:(SocialItem*)socialItem {
	
	self = [super initWithFrame:frame];
	if (self) {

		_socialItem = socialItem;
	}
	
	return self;
}


- (instancetype)init {
	
	return [self initWithFrame:CGRectZero andSocialItem:nil];
}


+ (instancetype)socialItemCellWithFrame:(CGRect)frame andSocialItem:(SocialItem*)socialItem {
	
	return [[SocialItemCell alloc] initWithFrame:frame andSocialItem:socialItem];
}


#
# pragma mark UIView
#


- (void)layoutSubviews {

	self.layer.cornerRadius = self.bounds.size.width / 2.0 ;
	self.layer.masksToBounds = YES;
}


@end
