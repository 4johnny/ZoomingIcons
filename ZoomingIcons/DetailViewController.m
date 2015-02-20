//
//  DetailViewController.m
//  ZoomingIcons
//
//  Created by Johnny on 2015-02-19.
//  Copyright (c) 2015 Empath Solutions. All rights reserved.
//

#import "DetailViewController.h"


#
# pragma mark - Interface
#


@interface DetailViewController ()

@end


#
# pragma mark - Implementation
#


@implementation DetailViewController


#
# pragma mark UIViewController
#


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	
	self.socialItemImageView.image = self.socialItem.image;
	self.socialItemView.backgroundColor = self.socialItem.color;
	self.socialItemNameLabel.text = self.socialItem.name;
	self.socialItemSummaryLabel.text = self.socialItem.summary;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#
# pragma mark Action Handlers
#


- (IBAction)backPressed:(UIButton *)sender {

	[self.navigationController popViewControllerAnimated:YES];
}


@end
