//
//  ANDSecondViewController.m
//  AppNetDemo
//
//  Created by Shane Zatezalo on 10/8/12.
//  Copyright (c) 2012 Lottadot LLC. All rights reserved.
//

#import "ANDSecondViewController.h"

@interface ANDSecondViewController ()

@end

@implementation ANDSecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Second", @"Second");
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
