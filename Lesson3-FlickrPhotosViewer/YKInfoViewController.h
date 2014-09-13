//
//  YKInfoViewController.h
//  Lesson3-FlickrPhotosViewer
//
//  Created by admin on 07.09.14.
//  Copyright (c) 2014 Yuri Kudrinetskiy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YKPhotoViewController.h"

@interface YKInfoViewController : UIViewController <YKPhotoViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (nonatomic) UIActivityIndicatorView *spinner;

@end
