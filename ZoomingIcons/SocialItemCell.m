//
//  SocialItemCell.m
//  ZoomingIcons
//
//  Created by Johnny on 2015-02-19.
//  Copyright (c) 2015 Empath Solutions. All rights reserved.
//

#import "SocialItemCell.h"

@implementation SocialItemCell


- (void)layoutSubviews {

	self.layer.cornerRadius = self.bounds.size.width / 2.0 ;
	self.layer.masksToBounds = YES;
}


@end
