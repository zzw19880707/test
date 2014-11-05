//
//  BMTableViewController.m
//  BlueMobiProject
//
//  Created by 朱 亮亮 on 14-5-5.
//  Copyright (c) 2014年 朱 亮亮. All rights reserved.
//

#import "BMTableViewController.h"

@interface BMTableViewController ()

@end

@implementation BMTableViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Public Methods
- (void)reloadData
{

}

- (void)loadMoreData
{
    [self reloadData];
}

@end
