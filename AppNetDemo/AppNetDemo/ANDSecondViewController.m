//
//  ANDSecondViewController.m
//  AppNetDemo
//
//  Created by Shane Zatezalo on 10/8/12.
//  Copyright (c) 2012 Lottadot LLC. All rights reserved.
//

#import "ANDSecondViewController.h"
#import "AppNetKit.h"

@interface ANDSecondViewController ()
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *tableData;
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
	[[ANSession defaultSession] setAccessToken:kAppDotNetDemoUserToken];
    
    [[ANSession defaultSession] postsInStreamWithCompletion:^(ANResponse *response,
                                                              NSArray *posts, NSError *error) {
        if(!posts) {
            UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:NSLocalizedString(@"Could not load posts", nil)
                                                        message:error.localizedDescription
                                                       delegate:self
                                              cancelButtonTitle:nil
                                              otherButtonTitles:NSLocalizedString(@"OK", nil), nil];
            [alert show];
            return;
        } else {
            NSLog(@"Posts:%@", posts);
            _tableData = posts;
            [_tableView reloadData];
        }
    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView Delegate Protocol

- (NSInteger)numberOfSectionsInTableView:(UITableView *)table {
    return 1;
}

- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section {
    NSInteger numberOfRows = 0;
    if (_tableData) {
        numberOfRows = [_tableData count];
    }
    return numberOfRows;
}


- (UITableViewCell *)tableView:(UITableView *)tableView
		 cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                       reuseIdentifier:CellIdentifier];
	}
    
    ANPost *post = (ANPost *)[_tableData objectAtIndex:indexPath.row];
    ANUser *poster = [post user];
    cell.textLabel.text = [poster username];
    cell.detailTextLabel.text = [post text];
    return cell;
}

@end
