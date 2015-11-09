//
//  SettingsStore.m
//  Timer Application
//
//  Created by Arthur Pan on 11/3/15.
//  Copyright © 2015 Arthur Pan. All rights reserved.
//

#import "SettingsStore.h"

@interface SettingsStore ()

@end

@implementation SettingsStore

+ (instancetype)sharedStore {
    static SettingsStore* sharedStore = nil;
    
    if (!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }
    return sharedStore;
}

- (instancetype)init {
    @throw [NSException exceptionWithName:@"Singleton"
                                   reason:@"Use +[SettingsStore sharedStore]"
                                 userInfo:nil];
    return nil;
}

-(instancetype)initPrivate {
    
    self = [super init];
    if (self) {
        _warningTime = _secondsLeft = _hours = _minutes = _seconds = 0;

    }
    return self;
}




@end
