//
//  SettingsStore.h
//  Timer Application
//
//  Created by Arthur Pan on 11/3/15.
//  Copyright © 2015 Arthur Pan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SettingsStore : NSObject

+(instancetype)sharedStore;

@property(nonatomic) int hours;
@property(nonatomic) int minutes;
@property(nonatomic) int seconds;
@property(nonatomic) int secondsLeft;

@property(nonatomic) int warningTime; //this is in minutes

@end
