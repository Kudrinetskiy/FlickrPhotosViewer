//
//  FlickrSearchOptions.m
//  PhotosViewer
//
//  Created by n.shubenkov on 29/08/14.
//  Copyright (c) 2014 n.shubenkov. All rights reserved.
//

#import "PSRFlickrSearchOptions.h"

@implementation PSRFlickrSearchOptions

- (void)setTags:(NSArray *)tags
{
    _tags = tags;
}

- (instancetype)initWithTags:(NSArray *)tags
{
    NSParameterAssert(tags.count > 0);
    if (self  = [super init]){
        _tags = tags;
    }
    return self;
}

- (NSString *)defaultString
{
    return [NSString stringWithFormat:@"&format=json&nojsoncallback=1"];
}

- (NSString *)requestString
{
    NSMutableString *searchString = [[NSString stringWithFormat:@"&tags=%@",[self.tags componentsJoinedByString:@","]] mutableCopy];
    [searchString appendString:[self defaultString]];
    if (self.contentType){
        [searchString appendFormat:@"&contentType=%d",self.contentType];
    }
    if (self.coordinate.latitude != 0 && self.coordinate.longitude != 0){
        [searchString appendFormat:@"&lat=%.4f&lon=%.4f",self.coordinate.latitude, self.coordinate.longitude];
    }
    if (self.radiusKilometers > 0.01){
        [searchString appendFormat:@"&radius=%.2f",self.radiusKilometers];
    }
    if (self.extra){
        [searchString appendFormat:@"&extra=%@",[self.extra componentsJoinedByString:@","]];
    }
    if (self.page > 0){
        [searchString appendFormat:@"&page=%d",self.page];
    }
    if (self.itemsLimit > 0){
        [searchString appendFormat:@"&per_page=%d",self.itemsLimit];
    }
    return [searchString copy];
}

@end
