//
//  YKCollectionViewCell.m
//  Lesson3-FlickrPhotosViewer
//
//  Created by admin on 05.09.14.
//  Copyright (c) 2014 Yuri Kudrinetskiy. All rights reserved.
//

#import "YKPhotoCell.h"

@implementation YKPhotoCell

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _spinner = [[UIActivityIndicatorView alloc] initWithFrame:self.frame];
        _spinner.hidesWhenStopped = YES;
        [self addSubview:_spinner];
    }
    return self;
}

@end
