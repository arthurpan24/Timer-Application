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

@property (weak, nonatomic) IBOutlet UIProgressView *progressBar;

@property (weak, nonatomic) IBOutlet UILabel *HourLabel;
@property (weak, nonatomic) IBOutlet UILabel *MinuteLabel;
@property (weak, nonatomic) IBOutlet UILabel *SecondLabel;

@property (weak, nonatomic) IBOutlet UILabel *alarmTime;
@property (weak, nonatomic) IBOutlet UIButton *InfoButton;

@property(nonatomic) float progress;

@property NSTimer* timer;
@property(nonatomic) int hours;
@property(nonatomic) int minutes;
@property(nonatomic) int seconds;

@property(nonatomic) int secondsLeft;
@property(nonatomic) int totalTime;

@property(nonatomic) UIProgressViewStyle progressViewStyle;

@end

@implementation ClockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _progress = 0.00;
    _totalTime = 0;
    [self refreshTime];
    _secondsLeft = _hours = _minutes = _seconds = 0;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)updateCounter:(NSTimer *)theTimer {
    if(_secondsLeft > 0 ) {
        _secondsLeft -- ;
        _totalTime ++;
        _hours = _secondsLeft / 3600;
        _minutes = (_secondsLeft % 3600) / 60;
        _seconds = (_secondsLeft %3600) % 60;
        _alarmTime.text = [NSString stringWithFormat:@"%02d:%02d:%02d", _hours, _minutes, _seconds];
    } else {
        _secondsLeft = 0;
    }
}
-(void)refreshProgressBar {
    _progress = (float)(_totalTime - _secondsLeft)/(float)_totalTime;
    [_progressBar setProgress:_progress animated:YES];
    [self performSelector:(@selector(refreshProgressBar)) withObject:self afterDelay:1.0];

}
-(void)countdownTimer {
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(updateCounter:) userInfo:nil repeats:YES];
}

- (IBAction)hourButtonPressed:(id)sender {
    _secondsLeft += 3600;
}

- (IBAction)minuteButtonPressed:(id)sender {
    _secondsLeft += 60*5;
}

- (IBAction)secondButtonPressed:(id)sender {
    _secondsLeft += 30;
}

- (IBAction)startButtonPressed:(id)sender {
    _totalTime = _secondsLeft;
    [self countdownTimer];
    [self refreshProgressBar];
    NSLog(@"Start Button Pressed");
}

-(void)refreshTime {
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

    [self performSelector:(@selector(refreshTime)) withObject:self afterDelay:1.0];
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
