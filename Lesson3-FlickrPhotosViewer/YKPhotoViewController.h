//
//  YKPhotoViewController.h
//  Lesson3-FlickrPhotosViewer
//
//  Created by admin on 06.09.14.
//  Copyright (c) 2014 Yuri Kudrinetskiy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YKViewController.h"

@class YKPhotoViewController;

@protocol YKPhotoViewControllerDelegate <NSObject>
- (void)addYKPhotoViewController:(YKPhotoViewController *)controller didGetImage:(UIImage *)image info:(NSString *)info;
@end

@interface YKPhotoViewController : UICollectionViewController <YKViewControllerDelegate>

@property (weak, nonatomic) id <YKPhotoViewControllerDelegate> delegate;
@property (nonatomic) NSArray * images;
@property (nonatomic) NSArray * infoes;

@end
