//
//  TemplateView.m
//  Timer Application
//
//  Created by Arthur Pan on 11/8/15.
//  Copyright © 2015 Arthur Pan. All rights reserved.
//

#import "TemplateView.h"

@implementation TemplateView

+ (instancetype)backgroundStatus {
    static TemplateView* backgroundStatus = nil;
    
    if (!backgroundStatus) {
        backgroundStatus = [[self alloc] initPrivate];
    }
    return backgroundStatus;
}

- (instancetype)init {
    @throw [NSException exceptionWithName:@"Singleton"
                                   reason:@"Use +[RootViewController backgroundStatus]"
                                 userInfo:nil];
    return nil;
}

-(instancetype)initPrivate {

    self = [super init];
    if (self) {
        NSLog(@"About to set color");
        self.backgroundColor = [UIColor greenColor];
        [self setBackgroundColor:[UIColor greenColor]];
        NSLog(@"Has set color");
    }
    return self;
}


@end
