//
// Created by Simon Schmid
//
// contact@sschmid.com
//

#import "SimpleExample.h"
#import "Car.h"
#import "GRReflection.h"
#import "Engine.h"

@implementation SimpleExample

- (id)init {
    self = [super init];
    if (self) {

        @protocol(Engine);
        Car *car = [[Car alloc] init];

        // Check type
        BOOL isClass = [GRReflection isClass:car];
        BOOL isProtocol = [GRReflection isProtocol:car];
        BOOL isBlock = [GRReflection isBlock:car];
        BOOL isInstance = [GRReflection isInstance:car];

        NSLog(@"isClass = %d", isClass);
        NSLog(@"isProtocol = %d", isProtocol);
        NSLog(@"isBlock = %d", isBlock);
        NSLog(@"isInstance = %d", isInstance);


        // Get all property names
        NSArray *propertyNames = [GRReflection getAllPropertyNamesOfClass:[Car class]];
        NSLog(@"propertyNames = %@", propertyNames);


        // Get type of properties
        id wheelType = [GRReflection getTypeForProperty:@"wheel" ofClass:[Car class]];
        id engineType = [GRReflection getTypeForProperty:@"engine" ofClass:[Car class]];

        NSLog(@"wheelType = %@", NSStringFromClass(wheelType));
        NSLog(@"engineType = <%@>", NSStringFromProtocol(engineType));

    }

    return self;
}

@end