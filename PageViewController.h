//
//  PageViewController.h
//  Timer Application
//
//  Created by Arthur Pan on 11/4/15.
//  Copyright © 2015 Arthur Pan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageViewController : NSObject <UIPageViewControllerDataSource>

- (UIViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard;
- (NSUInteger)indexOfViewController:(UIViewController *)viewController;

@end
