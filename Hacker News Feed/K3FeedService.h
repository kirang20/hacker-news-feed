//
//  K3FeedService.h
//  Hacker News Feed
//
//  Created by Kiran on 15/03/14.
//  Copyright (c) 2014 Kiran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "K3FeedProtocol.h"
#import "AFHTTPRequestOperationManager.h"

@interface K3FeedService : NSObject
- (void) fetch:(id<K3FeedProtocol>) delegate;
@end
