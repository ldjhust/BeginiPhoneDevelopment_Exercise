//
//  FontListViewController.m
//  Fonts
//
//  Created by ldjhust on 15/12/16.
//  Copyright © 2015年 ldj. All rights reserved.
//

#import "FontListViewController.h"
#import "FavoritesList.h"

@interface FontListViewController ()

@property (assign, nonatomic) CGFloat cellPointSize;

- (UIFont *)fontForDisplayAtIndexPath:(NSIndexPath *)indexPath;

@end

@implementation FontListViewController

#pragma mark - view lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIFont *preferredTablewViewFont = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
    self.cellPointSize = preferredTablewViewFont.pointSize;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    if (self.showFavorites) {
        self.fontNames = [FavoritesList sharedFavoritesList].favorites;
        [self.tableView reloadData];
    }
}

#pragma mark - private methods

- (UIFont *)fontForDisplayAtIndexPath:(NSIndexPath *)indexPath {
    NSString *fontName = self.fontNames[indexPath.row];
    
    return [UIFont fontWithName:fontName size:self.cellPointSize];
}

#pragma mark - UITableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.fontNames count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"FontName";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.font = [self fontForDisplayAtIndexPath:indexPath];
    cell.textLabel.text = self.fontNames[indexPath.row];
    cell.detailTextLabel.text = self.fontNames[indexPath.row];
    
    return cell;
}

@end
