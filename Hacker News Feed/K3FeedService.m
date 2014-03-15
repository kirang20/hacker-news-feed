//
//  K3FeedService.m
//  Hacker News Feed
//
//  Created by Kiran on 15/03/14.
//  Copyright (c) 2014 Kiran. All rights reserved.
//

#import "K3FeedService.h"
#import "AFHTTPRequestOperationManager.h"

@interface K3FeedService()

@property  NSDictionary* feed;
@end

@implementation K3FeedService

- (void) fetch:(id<K3FeedProtocol>) delegate{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager
     GET:@"http://api.ihackernews.com/page"
     parameters:nil
     success:^(AFHTTPRequestOperation *operation, id responseObject) {
         //         NSLog(@"%@", responseObject);
         [delegate feedDidDownload:(NSDictionary* ) responseObject];
     }
     failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"Error: %@", error);
     }];
}

@end
