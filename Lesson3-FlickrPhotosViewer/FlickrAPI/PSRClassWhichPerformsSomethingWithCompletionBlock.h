//
//  PSRClassWhichPerformsSomethingWithCompletionBlock.h
//  PhotosViewer
//
//  Created by n.shubenkov on 31/08/14.
//  Copyright (c) 2014 n.shubenkov. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef void(^PSRCompletionBlock)(id result);

@interface PSRClassWhichPerformsSomethingWithCompletionBlock: NSObject

- (void)performSomeOperationWithCompletion:(PSRCompletionBlock)completion;

@end
