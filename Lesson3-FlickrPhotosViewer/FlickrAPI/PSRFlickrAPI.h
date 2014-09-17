//
//  FlickrFetcher.h
//  PhotosViewer
//
//  Created by n.shubenkov on 29/08/14.
//  Copyright (c) 2014 n.shubenkov. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PSRFlickrSearchOptions.h"


@class PSRFlickrPhoto;

@interface PSRFlickrAPI : NSObject

//returns array of PSRFlickrPhoto items
- (id)requestPhotosWithOptions:(PSRFlickrSearchOptions *)options;

@end
