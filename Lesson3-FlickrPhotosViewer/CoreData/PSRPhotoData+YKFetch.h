//
//  PSRPhotoData+YKFetch.h
//  Lesson3-FlickrPhotosViewer
//
//  Created by admin on 17.09.14.
//  Copyright (c) 2014 Yuri Kudrinetskiy. All rights reserved.
//

#import "PSRPhotoData.h"

@interface PSRPhotoData (YKFetch)

+ (PSRPhotoData *)fetchOrCreateObjectWithID:(int32_t)idValue inManagedObjectContext:(NSManagedObjectContext *)context;
+ (PSRPhotoData *)fetchObjectWithID:(int32_t)idValue inManagedObjectContext:(NSManagedObjectContext *)context;
@end
