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

@property (weak, nonatomic) IBOutlet UIProgressView *progressBar;

@property (weak, nonatomic) IBOutlet UILabel *HourLabel;
@property (weak, nonatomic) IBOutlet UILabel *MinuteLabel;
@property (weak, nonatomic) IBOutlet UILabel *SecondLabel;

@property (weak, nonatomic) IBOutlet UIButton *InfoButton;

@property(nonatomic) float progress;
@property(nonatomic) UIProgressViewStyle progressViewStyle;

@end

@implementation ClockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _progress = 0.00;
    [_progressBar setProgress:_progress animated:YES];
    [self refreshTime];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Right now, it updates the time to current time
- (IBAction)startButtonPressed:(id)sender {
    NSDateFormatter *hourFormatter=[[NSDateFormatter alloc] init];
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    NSDateFormatter *minuteFormatter=[[NSDateFormatter alloc] init];
    NSDateFormatter *secondFormatter=[[NSDateFormatter alloc] init];

    [dateFormatter setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
    [hourFormatter setDateFormat:@"hh"];
    [minuteFormatter setDateFormat:@"mm"];
    [secondFormatter setDateFormat:@"ss"];
    
    _HourLabel.text = [hourFormatter stringFromDate:[NSDate date]];
    _MinuteLabel.text = [minuteFormatter stringFromDate:[NSDate date]];
    _SecondLabel.text = [secondFormatter stringFromDate:[NSDate date]];
    
    NSLog(@"%@",[dateFormatter stringFromDate:[NSDate date]]);
    NSLog(@"Button Pressed");
}

-(void)refreshTime {
    NSLog(@"Time has been refreshed");
    NSDateFormatter *hourFormatter=[[NSDateFormatter alloc] init];
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    NSDateFormatter *minuteFormatter=[[NSDateFormatter alloc] init];
    NSDateFormatter *secondFormatter=[[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
    [hourFormatter setDateFormat:@"hh"];
    [minuteFormatter setDateFormat:@"mm"];
    [secondFormatter setDateFormat:@"ss"];
    
    _HourLabel.text = [hourFormatter stringFromDate:[NSDate date]];
    _MinuteLabel.text = [minuteFormatter stringFromDate:[NSDate date]];
    _SecondLabel.text = [secondFormatter stringFromDate:[NSDate date]];

}

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
