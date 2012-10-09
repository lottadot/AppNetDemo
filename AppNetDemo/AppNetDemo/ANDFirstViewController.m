//
//  ANDFirstViewController.m
//  AppNetDemo
//
//  Created by Shane Zatezalo on 10/8/12.
//  Copyright (c) 2012 Lottadot LLC. All rights reserved.
//

#import "ANDFirstViewController.h"
#import "AppNetKit.h"

@interface ANDFirstViewController ()

@property (strong, nonatomic) NSString *authToken;
@end

@implementation ANDFirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"First", @"First");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSURL *redirectURL = [NSURL URLWithString:kAppDotNetCallbackURL];
    [[ANAuthenticator sharedAuthenticator] setClientID:kAppDotNetClientID];
    [[ANAuthenticator sharedAuthenticator] setRedirectURL:redirectURL];
    
    NSArray *scopes = [NSArray arrayWithObjects:ANScopeStream, ANScopeEmail, ANScopeWritePost, ANScopeFollow, ANScopeMessages, ANScopeExport, nil];
    NSURL *url = [[ANAuthenticator sharedAuthenticator] URLToAuthenticateForScopes:scopes];
    NSLog(@"URLToAuthenticateForScopes:%@", [url absoluteString]);
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:webView];
    [webView setDelegate:self];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - UIWebViewDelegate

- (BOOL)webView:(UIWebView*)webView
shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView*)webView {
}

- (void)webViewDidFinishLoad:(UIWebView*)webView {
}

- (void)webView:(UIWebView*)webView didFailLoadWithError:(NSError*)error {
}


@end
