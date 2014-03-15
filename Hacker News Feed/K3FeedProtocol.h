//
//  K3FeedProtocol.h
//  Hacker News Feed
//
//  Created by Kiran on 15/03/14.
//  Copyright (c) 2014 Kiran. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol K3FeedProtocol <NSObject>
- (void) feedDidDownload: (NSDictionary*) feed;
@end
