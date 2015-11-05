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

@property (weak, nonatomic) IBOutlet UILabel *currentTime;
@property (weak, nonatomic) IBOutlet UILabel *timeAfter;

@property (weak, nonatomic) IBOutlet UIButton *InfoButton;

@property(nonatomic) float progress;
@property(nonatomic) BOOL timerRunning;

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
    _timerRunning = false;
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
        
        _HourLabel.text = [NSString stringWithFormat:@"%02d", _hours];
        _MinuteLabel.text = [NSString stringWithFormat:@"%02d", _minutes];
        _SecondLabel.text = [NSString stringWithFormat:@"%02d", _seconds];

        
    } else {
        _secondsLeft = 0;
    }
}
-(void)refreshProgressBar {
    if (_timerRunning) {
        _progress = (float)(_totalTime - _secondsLeft)/(float)_totalTime;
        [_progressBar setProgress:_progress animated:YES];
        [self performSelector:(@selector(refreshProgressBar)) withObject:self afterDelay:1.0];
    }
    else {
        [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(refreshProgressBar) object:nil];
    }

}
-(void)countdownTimer {
    if (_timerRunning){
        _timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(updateCounter:) userInfo:nil repeats:YES];
    }
    else{
        [_timer invalidate];
        _timer = nil;
    }
}

- (IBAction)hourButtonPressed:(id)sender {
    if (!_timerRunning){
        _secondsLeft += 3600;
        [self refreshAlarmTime];
    }
}

- (IBAction)minuteButtonPressed:(id)sender {
    if (!_timerRunning){
        _secondsLeft += 60*5;
        [self refreshAlarmTime];
    }
}

- (IBAction)secondButtonPressed:(id)sender {
    if (!_timerRunning){
        _secondsLeft += 30;
        [self refreshAlarmTime];
    }
}
-(void)refreshAlarmTime {
    _hours = _secondsLeft/3600;
    _minutes = (_secondsLeft % 3600) / 60;
    _seconds = (_secondsLeft %3600) % 60;
    _HourLabel.text = [NSString stringWithFormat:@"%02d", _hours];
    _MinuteLabel.text = [NSString stringWithFormat:@"%02d", _minutes];
    _SecondLabel.text = [NSString stringWithFormat:@"%02d", _seconds];
}

- (IBAction)resetButtonPressed:(id)sender {
    _hours = 0;
    _minutes = 0;
    _seconds = 0;
    _secondsLeft = 0;
    _timerRunning = false;
    [self countdownTimer];
    [self refreshProgressBar];
    [self refreshAlarmTime];
    [_StartButton setTitle:@"START" forState:UIControlStateNormal];
}

- (IBAction)startButtonPressed:(id)sender {
    if (!_timerRunning){
         _timerRunning = true;
        _totalTime = _secondsLeft;
        [self countdownTimer];
        [self refreshProgressBar];
        [_StartButton setTitle:@"STOP" forState:UIControlStateNormal];
    }
    else {
        _timerRunning = false;
        [_StartButton setTitle:@"START" forState:UIControlStateNormal];
        [self countdownTimer];
        [self refreshProgressBar];
    }
        
    NSLog(@"Start Button Pressed");
}

-(void)refreshTime {
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"hh:mm:ss"];
   
    _currentTime.text = [dateFormatter stringFromDate:[NSDate date]];

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
