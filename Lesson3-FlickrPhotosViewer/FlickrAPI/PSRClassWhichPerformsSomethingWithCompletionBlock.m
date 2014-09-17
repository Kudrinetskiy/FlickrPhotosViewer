//
//  PSRClassWhichPerformsSomethingWithCompletionBlock.m
//  PhotosViewer
//
//  Created by n.shubenkov on 31/08/14.
//  Copyright (c) 2014 n.shubenkov. All rights reserved.
//

#import "PSRClassWhichPerformsSomethingWithCompletionBlock.h"


@interface PSRClassWhichPerformsSomethingWithCompletionBlock()

@end

@implementation PSRClassWhichPerformsSomethingWithCompletionBlock

- (void)performSomeOperationWithCompletion:(PSRCompletionBlock)completion
{
    //make copy of block, which was passed to you
    PSRCompletionBlock copiedCompletion = [completion copy];
    
    //do some long task.
    //make performing this task in background
    NSString *result = [self calculateLongTask];
    
    if (copiedCompletion){
        copiedCompletion(result);
    }
    
}

- (NSString *)calculateLongTask
{
    //some long task
    [NSThread sleepForTimeInterval:5];
    
    return @"Task finished";
}

@end
