//
//  YKPhotoViewController.m
//  Lesson3-FlickrPhotosViewer
//
//  Created by admin on 06.09.14.
//  Copyright (c) 2014 Yuri Kudrinetskiy. All rights reserved.
//

#import "YKPhotoViewController.h"
#import "YKPhotoCell.h"
#import "PSRFlickrPhoto.h"
#import "YKInfoViewController.h"

@interface YKPhotoViewController ()

@end

@implementation YKPhotoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UICollectionViewCell *)sender
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    NSIndexPath * indexPath = [self.collectionView indexPathForCell:sender];
    YKInfoViewController * ivc = [segue destinationViewController];
    ivc.navigationItem.title = [NSString stringWithFormat:@"Photo %d", 1 + indexPath.row];
    
    dispatch_queue_t downloadPhotoQueue = dispatch_queue_create("downloadPhotoQueue", nil);
    dispatch_async(downloadPhotoQueue, ^{
        PSRFlickrPhoto * photo = self.infoes[indexPath.row];
        NSString * info = [photo.info objectForKey:@"title"];
        NSURL * url = [photo highQualityURL];
        NSData * data = [NSData dataWithContentsOfURL:url];
        UIImage * image = [UIImage imageWithData:data];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
            self.delegate = ivc;
            [self.delegate addYKPhotoViewController:self didGetImage:image info:info];
        });
    });
}

#pragma mark - Collection view delegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"infoSegue" sender:[collectionView cellForItemAtIndexPath:indexPath]];
}

#pragma mark - Collection view data source

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.infoes count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    YKPhotoCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PhotoCell" forIndexPath:indexPath];
    
    if (self.images[indexPath.row] != [NSNull null]) {
        cell.imageView.image = self.images[indexPath.row];
        [cell.spinner stopAnimating];
    }
    else {
        [cell.spinner startAnimating];
    }
    
    if (self.infoes[indexPath.row] != [NSNull null]) {
        PSRFlickrPhoto * photo = self.infoes[indexPath.row];
        cell.label.text = [photo.info objectForKey:@"title"];
    }
    
    return cell;
}

#pragma mark - YKViewController delegate

- (void)addYKViewControllerDidLoadAllPhotos:(YKViewController *)controller
{
    [self.collectionView reloadData];
}

@end
