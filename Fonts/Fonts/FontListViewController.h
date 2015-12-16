//
//  FontListViewController.h
//  Fonts
//
//  Created by ldjhust on 15/12/16.
//  Copyright © 2015年 ldj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FontListViewController : UITableViewController

@property (copy, nonatomic) NSArray *fontNames;
@property (assign, nonatomic) BOOL showFavorites;

@end
