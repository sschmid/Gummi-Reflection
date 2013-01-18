//
// Created by Simon Schmid
//
// contact@sschmid.com
//

#import <Foundation/Foundation.h>

@class Wheel;
@protocol Motor;

@interface Car : NSObject
@property (nonatomic, strong) Wheel *wheel;
@property (nonatomic, strong) id <Motor> motor;
@end