//
//  FavoritesList.h
//  Fonts
//
//  Created by ldjhust on 15/12/12.
//  Copyright © 2015年 ldj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FavoritesList : NSObject

+ (instancetype)sharedFavoritesList;

- (NSArray *)favorites;
- (void)addFavorite:(id)item;
- (void)removeFavorite:(id)item;

@end
