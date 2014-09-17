//
//  PSRPhotoData.h
//  Lesson3-FlickrPhotosViewer
//
//  Created by admin on 17.09.14.
//  Copyright (c) 2014 Yuri Kudrinetskiy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class PSRTag, PhotoOwner;

@interface PSRPhotoData : NSManagedObject

@property (nonatomic) NSTimeInterval date;
@property (nonatomic, retain) NSString * fullImageURL;
@property (nonatomic) int32_t idValue;
@property (nonatomic, retain) NSString * thumbURL;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) PhotoOwner *newRelationship;
@property (nonatomic, retain) NSSet *tag;
@end

@interface PSRPhotoData (CoreDataGeneratedAccessors)

- (void)addTagObject:(PSRTag *)value;
- (void)removeTagObject:(PSRTag *)value;
- (void)addTag:(NSSet *)values;
- (void)removeTag:(NSSet *)values;

@end
