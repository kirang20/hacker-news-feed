//
//  K3FeedDetailController.m
//  Hacker News Feed
//
//  Created by Kiran on 15/03/14.
//  Copyright (c) 2014 Kiran. All rights reserved.
//

#import "K3FeedDetailController.h"

@interface K3FeedDetailController ()
@property (weak, nonatomic) IBOutlet UIWebView *feedWebView;
@end

@implementation K3FeedDetailController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:self.feedItem[@"title"]];
    [self.feedWebView setDelegate:self];
    [self.feedWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.feedItem[@"url"]]]];
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}
@end
