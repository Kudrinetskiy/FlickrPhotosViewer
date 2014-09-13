//
//  YKInfoViewController.m
//  Lesson3-FlickrPhotosViewer
//
//  Created by admin on 07.09.14.
//  Copyright (c) 2014 Yuri Kudrinetskiy. All rights reserved.
//

#import "YKInfoViewController.h"
#import "PSRFlickrPhoto.h"
#import "YKPhotoViewController.h"

@interface YKInfoViewController ()

@end

@implementation YKInfoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.imageView.alpha = 0;
    self.textView.alpha = 0;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.spinner = [[UIActivityIndicatorView alloc] initWithFrame:self.view.frame];
    self.spinner.hidesWhenStopped = YES;
    [self.spinner startAnimating];
    [self.view addSubview:self.spinner];
}


- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [UIView animateWithDuration:0.25 animations:^{
        self.view.alpha = 0;
    }];
}

#pragma mark - YKPhotoViewController delegate

- (void)addYKPhotoViewController:(YKPhotoViewController *)controller didGetImage:(UIImage *)image info:(NSString *)info
{
    [self.spinner stopAnimating];
    self.imageView.image = image;
    self.textView.text = info;
    
    [UIView animateWithDuration:0.25 animations:^{
        self.imageView.alpha = 1;
        self.textView.alpha = 1;
    }];
    
    
}

@end
