//
//  ClockViewController.m
//  Timer Application
//
//  Created by Arthur Pan on 11/2/15.
//  Copyright © 2015 Arthur Pan. All rights reserved.
//

#import "ClockViewController.h"

@interface ClockViewController ()

@property (weak, nonatomic) IBOutlet UIButton *StartButton;

@property (weak, nonatomic) IBOutlet UIButton *HourButton;
@property (weak, nonatomic) IBOutlet UIButton *MinuteButton;
@property (weak, nonatomic) IBOutlet UIButton *SecondButton;

@property (strong, nonatomic) IBOutlet UIView *ProgessBar;

@property (weak, nonatomic) IBOutlet UILabel *HourLabel;
@property (weak, nonatomic) IBOutlet UILabel *MinuteLabel;
@property (weak, nonatomic) IBOutlet UILabel *SecondLabel;

@property (weak, nonatomic) IBOutlet UIButton *InfoButton;

@end

@implementation ClockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (instancetype)initWithProgressViewStyle:(UIProgressViewStyle)style{
//
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)badgeButtonPressed:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://github.com/arthurpan24/Timer-Application"]];
}

@end
