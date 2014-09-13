//
//  PSRFlickrPhoto.h
//  PhotosViewer
//
//  Created by n.shubenkov on 29/08/14.
//  Copyright (c) 2014 n.shubenkov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PSRFlickrPhoto : NSObject

+ (instancetype)photoWithInfo:(NSDictionary *)info;
@property (nonatomic, readonly, strong) NSDictionary *info;
//return Array of FlickrPhoto instanses
//parse photos for some sec, so interface may freeze for some time
//if you call it from main thread
+ (NSArray *)photosWithInfoes:(NSArray *)infoes;

- (NSURL *)lowQualityURL;
- (NSURL *)mediumQualityURL;
- (NSURL *)highQualityURL;

@end
