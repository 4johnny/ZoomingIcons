//
//  SocialItem.h
//  ZoomingIcons
//
//  Created by Johnny on 2015-02-19.
//  Copyright (c) 2015 Empath Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>


#
# pragma mark - Interface
#

@interface SocialItem : NSObject

#
# pragma mark Properties
#

@property (nonatomic) NSString* name;
@property (nonatomic) NSString* summary;
@property (nonatomic) UIImage* image;
@property (nonatomic) UIColor* color;


#
# pragma mark Initializers
#

+ (instancetype)socialItemWithName:(NSString*)name andSummary:(NSString*)summary andImage:(UIImage*)image andColor:(UIColor*)color;

@end
