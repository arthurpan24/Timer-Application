//
//  ClockViewController.h
//  Timer Application
//
//  Created by Arthur Pan on 11/2/15.
//  Copyright © 2015 Arthur Pan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClockViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property(nonatomic) int totalTime;

-(void)refreshTime;
-(void)refreshProgressBar;
-(void)refreshAlarmTime;
-(void)refreshTimeAfter;
-(void)changeToStop;
-(void)changeToStart;
//-(void)changeToWarning; //IMPLEMENT THIS

@end
