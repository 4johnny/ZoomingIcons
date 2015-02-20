//
//  SocialItem.m
//  ZoomingIcons
//
//  Created by Johnny on 2015-02-19.
//  Copyright (c) 2015 Empath Solutions. All rights reserved.
//

#import "SocialItem.h"


#
# pragma mark - Implementation
#


@implementation SocialItem


#
# pragma mark Initializers
#


- (instancetype)initWithName:(NSString*)name andSummary:(NSString*)summary andImage:(UIImage*)image andColor:(UIColor*)color {
	
	self = [super init];
	if (self) {
		
		_name = name;
		_summary = summary;
		_image = image;
		_color = color;
	}
	
	return self;
}


- (instancetype)init {
	
	return [self initWithName:nil andSummary:nil andImage:nil andColor:nil];
}


+ (instancetype)socialItemWithName:(NSString*)name andSummary:(NSString*)summary andImage:(UIImage*)image andColor:(UIColor*)color {
	
	return [[SocialItem alloc] initWithName:name andSummary:summary andImage:image andColor:color];
}
	

@end
