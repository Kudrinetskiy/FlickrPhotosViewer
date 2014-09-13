//
//  YKCollectionViewCell.h
//  Lesson3-FlickrPhotosViewer
//
//  Created by admin on 05.09.14.
//  Copyright (c) 2014 Yuri Kudrinetskiy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SDWebImage/UIImage+GIF.h>

@interface YKPhotoCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (nonatomic) UIActivityIndicatorView *spinner;

@end
