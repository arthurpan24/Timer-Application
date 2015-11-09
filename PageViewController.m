//
//  PageViewController.m
//  Timer Application
//
//  Created by Arthur Pan on 11/4/15.
//  Copyright © 2015 Arthur Pan. All rights reserved.
//

#import "PageViewController.h"
#import "ClockViewController.h"
#import "SettingsViewController.h"

@interface PageViewController ()

@property (nonatomic, copy) NSArray *viewControllerRestorationIndentifiers;

@end

@implementation PageViewController


- (instancetype)init {
    self = [super init];
    if (self) {
        _viewControllerRestorationIndentifiers = @[@"ClockViewController",@"SettingsViewController"];
    }
    return self;
}

- (UIViewController *)viewControllerAtIndex:(NSUInteger)index
                                 storyboard:(UIStoryboard *)storyboard {
    // Create a new view controller and pass suitable data.
    if (index == 0) {
        ClockViewController *clockVC = [storyboard instantiateViewControllerWithIdentifier:@"ClockViewController"];
        return clockVC;
    } else if (index == 1) {
        SettingsViewController *settingsVC = [storyboard instantiateViewControllerWithIdentifier:@"SettingsViewController"];
        return settingsVC;
    } else {
        return nil;
    }
}

- (NSUInteger)indexOfViewController:(UIViewController *)viewController {
    // Return the index of the given data view controller.
    NSString *identifier = viewController.restorationIdentifier;
    return [self.viewControllerRestorationIndentifiers indexOfObject:identifier];
    
}


- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController
      viewControllerBeforeViewController:(UIViewController *)viewController {
    
    NSUInteger index = [self indexOfViewController:viewController];
    if (index == 1) {
        ClockViewController *clockVC = [viewController.storyboard instantiateViewControllerWithIdentifier:@"ClockViewController"];
        return clockVC;
    }
    return nil;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController
       viewControllerAfterViewController:(UIViewController *)viewController {
    
    NSUInteger index = [self indexOfViewController:viewController];
    if (index == 0) {
        SettingsViewController *settingsVC = [viewController.storyboard instantiateViewControllerWithIdentifier:@"SettingsViewController"];
        return settingsVC;
    }
    return nil;
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    return 2;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    return 0;
}


@end
