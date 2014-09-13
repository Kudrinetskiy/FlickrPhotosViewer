//
//  PSRFlickrPhoto.m
//  PhotosViewer
//
//  Created by n.shubenkov on 29/08/14.
//  Copyright (c) 2014 n.shubenkov. All rights reserved.
//

#import "PSRFlickrPhoto.h"

@interface PSRFlickrPhoto()

@property (nonatomic,readwrite, strong) NSDictionary *info;

@end

@implementation PSRFlickrPhoto

+ (NSArray *)photosWithInfoes:(NSArray *)infoes
{
    NSMutableArray *photos = [NSMutableArray arrayWithCapacity:infoes.count];
    [infoes enumerateObjectsUsingBlock:^(NSDictionary *anInfo, NSUInteger idx, BOOL *stop) {
        [photos addObject:[self photoWithInfo:anInfo]];
    }];
    //imitate long parsing process
//    [NSThread sleepForTimeInterval:2];
    return photos;
}

+ (instancetype)photoWithInfo:(NSDictionary *)info
{
    return [[self alloc]initWithInfo:info];
}

- (instancetype)initWithInfo:(NSDictionary *)info
{
    if (self = [super init]){
        _info = info;
    }
    return self;
}



- (NSURL *)lowQualityURL
{
    return [self urlForQualityTag:@"s"];
}

- (NSURL *)mediumQualityURL
{
    return [self urlForQualityTag:@"n"];
}

- (NSURL *)highQualityURL
{
    return [self urlForQualityTag:@"b"];
}

- (NSURL *)urlForQualityTag:(NSString *)qualityTag
{
    NSString *photoURLString = [NSString stringWithFormat:@"http://farm%@.static.flickr.com/%@/%@_%@_%@.jpg", [self.info objectForKey:@"farm"], [self.info objectForKey:@"server"], [self.info objectForKey:@"id"], [self.info objectForKey:@"secret"], qualityTag];
    return [NSURL URLWithString:photoURLString];
}

@end
