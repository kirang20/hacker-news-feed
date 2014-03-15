//
//  K3FeedController.m
//  Hacker News Feed
//
//  Created by Kiran on 15/03/14.
//  Copyright (c) 2014 Kiran. All rights reserved.
//

#import "K3FeedController.h"
#import "K3FeedService.h"
#import "K3FeedDetailController.h"

@interface K3FeedController ()

@property K3FeedService* feedService;
@property NSDictionary* feed;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *progressIndicator;

@end

@implementation K3FeedController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.feedService = [[K3FeedService alloc] init];
    [self.feedService fetch:self];
}

- (void)feedDidDownload:(NSDictionary *)feed {
    self.feed = feed;
    [self.tableView reloadData];
    [self.progressIndicator stopAnimating];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.feed[@"items"] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"feed"];
    NSString* feedTitle = [NSString stringWithFormat:@"%@", self.feed[@"items"][indexPath.row][@"title"]];
    [cell.textLabel setText:feedTitle];
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UITableViewCell *cell = (UITableViewCell*) sender;
    int index = [[self.tableView indexPathForCell:cell] row];
    K3FeedDetailController * controller = (K3FeedDetailController*) [segue destinationViewController];
    [controller setFeedItem:self.feed[@"items"][index]];
}

@end
