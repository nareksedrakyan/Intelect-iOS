//
//  Settings.m
//  Intelect
//
//  Created by Narek Sedrakyan on 10/31/17.
//  Copyright © 2017 Narek Sedrakyan. All rights reserved.
//

#import "Settings.h"

@implementation Settings

+ (Settings *)sharedInstance {
    static Settings *_sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[Settings alloc] init];
    });
    return _sharedInstance;
}

@end
