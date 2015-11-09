//
//  SettingsViewController.m
//  Timer Application
//
//  Created by Arthur Pan on 11/2/15.
//  Copyright © 2015 Arthur Pan. All rights reserved.
//

#import "SettingsViewController.h"
#import "ClockViewController.h"
#import "SettingsStore.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UIPickerView *timeDisplay;
@property (weak, nonatomic) IBOutlet UILabel *testTime;
@property(nonatomic, readonly) NSInteger numberOfComponents;
@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _testTime.text = [NSString stringWithFormat:@"%d", [SettingsStore sharedStore].seconds];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
