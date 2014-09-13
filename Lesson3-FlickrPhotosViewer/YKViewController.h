//
//  YKViewController.h
//  Lesson3-FlickrPhotosViewer
//
//  Created by admin on 05.09.14.
//  Copyright (c) 2014 Yuri Kudrinetskiy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YKViewController;

@protocol YKViewControllerDelegate <NSObject>
- (void)addYKViewControllerDidLoadAllPhotos:(YKViewController *)controller;
@end

@interface YKViewController : UIViewController

@property (weak, nonatomic) id <YKViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;
@property (weak, nonatomic) IBOutlet UIButton *showButton;

- (IBAction)searchPhotos:(id)sender;
- (IBAction)dismissKeyboard:(id)sender;

@end
