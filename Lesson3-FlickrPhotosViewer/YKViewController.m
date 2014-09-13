//
//  YKViewController.m
//  Lesson3-FlickrPhotosViewer
//
//  Created by admin on 05.09.14.
//  Copyright (c) 2014 Yuri Kudrinetskiy. All rights reserved.
//

#import "YKViewController.h"
#import "YKPhotoViewController.h"
#import "PSRFlickrAPI.h"
#import "PSRFlickrPhoto.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface YKViewController () {
    NSArray * searchTags;
}
@property (nonatomic) PSRFlickrSearchOptions * searchOptions;
@property (nonatomic) NSArray * infoes;
@property (nonatomic) NSMutableArray * images;
@end

@implementation YKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark - IBActions

- (IBAction)searchPhotos:(id)sender
{
    if ([self.textField.text isEqualToString:[searchTags componentsJoinedByString:@" "]]) {
        return;
    }
    
    [self.textField resignFirstResponder];
    self.showButton.hidden = YES;
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];

    searchTags = [self.textField.text componentsSeparatedByString:@" "];
    self.searchOptions = [[PSRFlickrSearchOptions alloc] initWithTags:searchTags];
    self.searchOptions.itemsLimit = 99;
    self.searchOptions.extra = @[@"url_c"];
    self.infoes = [[PSRFlickrAPI new] requestPhotosWithOptions:self.searchOptions];
    
    [self loadPhotos];
}

- (IBAction)dismissKeyboard:(id)sender
{
    [self.textField resignFirstResponder];
}

#pragma mark - Private methods

- (void)loadPhotos
{
    dispatch_queue_t getPhotoQueue = dispatch_queue_create("getPhotoQueue", nil);
    dispatch_async(getPhotoQueue, ^{
        if ([self.infoes count] > 0) {
            self.images = [NSMutableArray arrayWithCapacity:[self.infoes count]];
            
            for (int i = 0; i < [self.infoes count]; i++) {
                [self.images addObject:[NSNull null]];
            }
            
            NSURL * url = [self.infoes[0] highQualityURL];
            NSData * data = [NSData dataWithContentsOfURL:url];
            UIImage * image = [UIImage imageWithData:data];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                self.showButton.hidden = NO;
                [self.searchButton setBackgroundImage:image forState:UIControlStateNormal];
                
                [self loadMorePhotos];
            });
        }
        else {
            dispatch_async(dispatch_get_main_queue(), ^{
                [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
                UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Load photos alert" message:@"photos not found" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
            });
        }
    });
}

- (void)loadMorePhotos
{
    
    dispatch_queue_t downloadPhotosQueue = dispatch_queue_create("downloadPhotosQueue", nil);
    dispatch_async(downloadPhotosQueue, ^{
        
        for (int i = 0; i < [self.infoes count]; i++) {
            NSURL * url = [self.infoes[i] mediumQualityURL];
            NSData * data = [NSData dataWithContentsOfURL:url];
            UIImage * image = [UIImage imageWithData:data];
            [self.images replaceObjectAtIndex:i withObject:image];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
            [self.delegate addYKViewControllerDidLoadAllPhotos:self];
        });
    });
}

#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIButton *)sender
{
    YKPhotoViewController * pvc = [segue destinationViewController];
    self.delegate = pvc;
    pvc.navigationItem.title = [NSString stringWithFormat:@"\"%@\" photos", self.textField.text];
    pvc.images = self.images;
    pvc.infoes = self.infoes;
}

#pragma mark - Text field delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
