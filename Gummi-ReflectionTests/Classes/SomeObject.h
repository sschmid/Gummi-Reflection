//
// Created by Simon Schmid
//
// contact@sschmid.com
//


#import <Foundation/Foundation.h>

@class SomeOtherObject;
@protocol SomeProtocol;

@interface SomeObject : NSObject
@property (nonatomic) SomeOtherObject *otherObject;
@property (nonatomic) id <SomeProtocol> someProtocol;
@end