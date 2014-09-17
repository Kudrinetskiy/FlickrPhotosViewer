//
//  FlickrSearchOptions.h
//  PhotosViewer
//
//  Created by n.shubenkov on 29/08/14.
//  Copyright (c) 2014 n.shubenkov. All rights reserved.
//

#import <Foundation/Foundation.h>
@import MapKit;

typedef NS_ENUM(int, PSRFLickrContentType)
{
    PSRFLickrContentTypePhotosOnly = 1,
    PSRFLickrContentTypeScreenShotsOny = 2,
    PSRFLickrContentTypeOtherOnly = 3,
    PSRFLickrContentTypeAll = 7
};

@interface PSRFlickrSearchOptions : NSObject

@property (nonatomic, strong) NSArray *tags;
@property (nonatomic) PSRFLickrContentType contentType;
@property (nonatomic) CLLocationCoordinate2D coordinate;
@property (nonatomic) float radiusKilometers;
// description, license, date_upload, date_taken, owner_name, icon_server, original_format, last_update, geo, tags, machine_tags, o_dims, views, media, path_alias, url_sq, url_t, url_s, url_q, url_m, url_n, url_z, url_c, url_l, url_o
@property (nonatomic, strong) NSArray *extra;
//it is like an offset of pages. first page index is 1
@property (nonatomic) int page;
@property (nonatomic) int itemsLimit;

//list of tags.
- (instancetype)initWithTags:(NSArray *)tags;
//main method
- (NSString *)requestString;

@end
