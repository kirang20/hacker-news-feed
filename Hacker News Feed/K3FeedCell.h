//
//  K3FeedCell.h
//  Hacker News Feed
//
//  Created by Kiran on 15/03/14.
//  Copyright (c) 2014 Kiran. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface K3FeedCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *feedTitle;
@property (weak, nonatomic) IBOutlet UILabel *feedNumberOfComments;

@end
