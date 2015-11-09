//
//  ClockViewController.m
//  Timer Application
//
//  Created by Arthur Pan on 11/2/15.
//  Copyright © 2015 Arthur Pan. All rights reserved.
//

#import "ClockViewController.h"
#import "RootViewController.h"
#import "TemplateView.h"
#import "SettingsStore.h"

#import <AudioToolbox/AudioToolbox.h>

@interface ClockViewController ()

@property (weak, nonatomic) IBOutlet UIButton *StartButton;

@property (weak, nonatomic) IBOutlet UIProgressView *progressBar;

@property (weak, nonatomic) IBOutlet UILabel *HourLabel;
@property (weak, nonatomic) IBOutlet UILabel *MinuteLabel;
@property (weak, nonatomic) IBOutlet UILabel *SecondLabel;
@property NSDateFormatter *dateFormatter;
@property (weak, nonatomic) IBOutlet UILabel *currentTime;
@property (weak, nonatomic) IBOutlet UILabel *timeAfter;

@property (weak, nonatomic) IBOutlet UIButton *InfoButton;

@property(nonatomic) float progress;
@property(nonatomic) BOOL timerRunning;
@property NSTimer* timer;

@end

@implementation ClockViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    _dateFormatter=[[NSDateFormatter alloc] init];
    [_dateFormatter setDateFormat:@"hh:mm:ss"];
    _progress = 0.00;
    _totalTime = 0;
    [self refreshTime];
    [SettingsStore sharedStore];
    _timerRunning = false;
    [self refreshTimeAfter];
    
    NSLog(@"Enter");
    [TemplateView backgroundStatus].backgroundColor = [UIColor greenColor]; //doesn't do jack
    NSLog(@"Reached here");
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateCounter:(NSTimer *)theTimer {
    if ([SettingsStore sharedStore].secondsLeft == 0){
        self.view.backgroundColor = [UIColor redColor];
        [self changeToStop];
    }
    if([SettingsStore sharedStore].secondsLeft > 0 ) {
        [SettingsStore sharedStore].secondsLeft -- ;
        [self refreshAlarmTime];
    } else {
        [SettingsStore sharedStore].secondsLeft = 0;
    }
}
-(void)refreshProgressBar {
    if (_timerRunning) {
        _progress = (float)(_totalTime - [SettingsStore sharedStore].secondsLeft)/(float)_totalTime;
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
        [SettingsStore sharedStore].secondsLeft += 3600;
        [self refreshAlarmTime];
        [self refreshTimeAfter];
    }
}

- (IBAction)minuteButtonPressed:(id)sender {
    if (!_timerRunning){
        [SettingsStore sharedStore].secondsLeft += 60*5;
        [self refreshAlarmTime];
        [self refreshTimeAfter];
    }
}

- (IBAction)secondButtonPressed:(id)sender {
    if (!_timerRunning){
        [SettingsStore sharedStore].secondsLeft += 5;
        [self refreshAlarmTime];
        [self refreshTimeAfter];
    }
}
-(void)refreshAlarmTime {
    [SettingsStore sharedStore].hours = [SettingsStore sharedStore].secondsLeft/3600;
    [SettingsStore sharedStore].minutes = ([SettingsStore sharedStore].secondsLeft % 3600) / 60;
    [SettingsStore sharedStore].seconds = ([SettingsStore sharedStore].secondsLeft %3600) % 60;
    _HourLabel.text = [NSString stringWithFormat:@"%02d", [SettingsStore sharedStore].hours];
    _MinuteLabel.text = [NSString stringWithFormat:@"%02d", [SettingsStore sharedStore].minutes];
    _SecondLabel.text = [NSString stringWithFormat:@"%02d", [SettingsStore sharedStore].seconds];
}

- (IBAction)resetButtonPressed:(id)sender {
    [SettingsStore sharedStore].hours = 0;
    [SettingsStore sharedStore].minutes = 0;
    [SettingsStore sharedStore].seconds = 0;
    [SettingsStore sharedStore].secondsLeft = 0;
    _timerRunning = false;
    
    [self countdownTimer];
    [self refreshProgressBar];
    [self refreshAlarmTime];
    [self refreshTimeAfter];
    //[[RootViewController backgroundStatus]setBackgroundColor:[UIColor purpleColor]];
    
    [_StartButton setTitle:@"START" forState:UIControlStateNormal];
}

- (IBAction)startButtonPressed:(id)sender {
    if (!_timerRunning && [SettingsStore sharedStore].secondsLeft == 0){
        self.view.backgroundColor = [UIColor blueColor];
        //do nothing
    }
    else if (!_timerRunning){
        self.view.backgroundColor = [UIColor blueColor];
        [self changeToStart];
    }
    else {
        [self changeToStop];
    }
    
}
-(void)changeToStart {
    _timerRunning = true;
    _totalTime = [SettingsStore sharedStore].secondsLeft;
    [self countdownTimer];
    [self refreshProgressBar];
    [_StartButton setTitle:@"STOP" forState:UIControlStateNormal];
}
-(void)changeToStop {
    _timerRunning = false;
    [_StartButton setTitle:@"START" forState:UIControlStateNormal];
    [self countdownTimer];
    [self refreshProgressBar];
    [self refreshTimeAfter];
}

-(void)refreshTime {
    _currentTime.text = [_dateFormatter stringFromDate:[NSDate date]];

    [self performSelector:(@selector(refreshTime)) withObject:self afterDelay:0.0]; //MUST FIX
}

-(void)refreshTimeAfter {
    NSDate *delayDate = [[NSDate alloc]init];
    delayDate = [NSDate dateWithTimeIntervalSinceNow:[SettingsStore sharedStore].secondsLeft];
    _timeAfter.text = [_dateFormatter stringFromDate:delayDate];

    if (!_timerRunning){
        [self performSelector:(@selector(refreshTimeAfter)) withObject:self afterDelay:0.0]; //MUST FIX

    }
    else {
        [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(refreshTimeAfter) object:nil];
    }
}

- (IBAction)badgeButtonPressed:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://github.com/arthurpan24/Timer-Application"]];
}

@end
