//
//  PSRTag.h
//  Lesson3-FlickrPhotosViewer
//
//  Created by admin on 17.09.14.
//  Copyright (c) 2014 Yuri Kudrinetskiy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class PSRPhotoData;

@interface PSRTag : NSManagedObject

@property (nonatomic) NSString *tagName;
@property (nonatomic, retain) NSSet *photo;
@end

@interface PSRTag (CoreDataGeneratedAccessors)

- (void)addPhotoObject:(PSRPhotoData *)value;
- (void)removePhotoObject:(PSRPhotoData *)value;
- (void)addPhoto:(NSSet *)values;
- (void)removePhoto:(NSSet *)values;

@end
