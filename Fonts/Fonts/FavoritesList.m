//
//  FavoritesList.m
//  Fonts
//
//  Created by ldjhust on 15/12/12.
//  Copyright © 2015年 ldj. All rights reserved.
//

#import "FavoritesList.h"

@interface FavoritesList ()

@property (strong, nonatomic) NSMutableArray *favorites;

- (void)saveFavorites;

@end

@implementation FavoritesList

- (instancetype)init {
    self = [super init];
    if (self) {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSArray *storedFavorites = [defaults objectForKey:@"favorites"];
        if (storedFavorites != nil) {
            _favorites = [storedFavorites mutableCopy];
        } else {
            _favorites = [@[] mutableCopy];
        }
    }
    
    return self;
}

+ (instancetype)sharedFavoritesList {
    static FavoritesList *_sharedFavoritesList = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _sharedFavoritesList = [[FavoritesList alloc] init];
    });
    
    return _sharedFavoritesList;
}

- (void)addFavorite:(id)item {
    [_favorites insertObject:item atIndex:0];
    [self saveFavorites];
}

- (void)removeFavorite:(id)item {
    [_favorites removeObject:item];
    [self saveFavorites];
}

- (void)saveFavorites {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:self.favorites forKey:@"favorites"];
    [defaults synchronize];
}

@end
