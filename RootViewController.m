//
//  RootViewController.m
//  Timer Application
//
//  Created by Arthur Pan on 11/4/15.
//  Copyright © 2015 Arthur Pan. All rights reserved.
//

#import "RootViewController.h"
#import "PageViewController.h"
#import "ClockViewController.h"
#import "TemplateView.h"

@interface RootViewController ()

@property (readonly, strong, nonatomic) PageViewController *modelController;

@end

@implementation RootViewController

@synthesize modelController = _modelController;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [TemplateView backgroundStatus].backgroundColor = [UIColor blueColor];

    // Do any additional setup after loading the view.
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    self.pageViewController = [storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
    self.pageViewController.delegate = self;
    
    UIViewController *startingViewController = [self.modelController viewControllerAtIndex:0 storyboard:self.storyboard];
    

    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    self.pageViewController.dataSource = self.modelController;
    
    [self.view addSubview:self.pageViewController.view];
    // Set the page view controller's bounds using an inset rect so that self's view is visible around the edges of the pages.
    /*
    CGRect pageViewRect = self.view.bounds;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        pageViewRect = CGRectInset(pageViewRect, 40.0, 40.0);
    }
    self.pageViewController.view.frame = pageViewRect;
    */
    
    [self.pageViewController didMoveToParentViewController:self];
    // Add the page view controller's gesture recognizers to the book view controller's view so that the gestures are started more easily.
    self.view.gestureRecognizers = self.pageViewController.gestureRecognizers;
}
/*******************************************/
//DOES NOT SEEM TO BE WORKING
/*******************************************/
-(void)viewDidAppear:(BOOL)animated {
    NSNumber *value = [NSNumber numberWithInt:UIInterfaceOrientationPortrait];
    [[UIDevice currentDevice] setValue:value forKey:@"orientation"];
}


- (PageViewController *)modelController {
    // Return the model controller object, creating it if necessary.
    // In more complex implementations, the model controller may be passed to the view controller.
    if (!_modelController) {
        _modelController = [[PageViewController alloc] init];
    }
    return _modelController;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
