//
// Created by Simon Schmid
//
// contact@sschmid.com
//

#import "Kiwi.h"
#import "GRReflection.h"
#import "Car.h"
#import "Wheel.h"
#import "Engine.h"

SPEC_BEGIN(GRReflectionSpec)

        void (^isClass)(id) = ^(id object) {
            [[theValue([GRReflection isClass:object]) should] beYes];
            [[theValue([GRReflection isProtocol:object]) should] beNo];
            [[theValue([GRReflection isBlock:object]) should] beNo];
            [[theValue([GRReflection isInstance:object]) should] beNo];
        };

        void (^isProtocol)(id) = ^(id object) {
            [[theValue([GRReflection isClass:object]) should] beNo];
            [[theValue([GRReflection isProtocol:object]) should] beYes];
            [[theValue([GRReflection isBlock:object]) should] beNo];
            [[theValue([GRReflection isInstance:object]) should] beNo];
        };

        void (^isBlock)(id) = ^(id object) {
            [[theValue([GRReflection isClass:object]) should] beNo];
            [[theValue([GRReflection isProtocol:object]) should] beNo];
            [[theValue([GRReflection isBlock:object]) should] beYes];
            [[theValue([GRReflection isInstance:object]) should] beNo];
        };

        void (^isInstance)(id) = ^(id object) {
            [[theValue([GRReflection isClass:object]) should] beNo];
            [[theValue([GRReflection isProtocol:object]) should] beNo];
            [[theValue([GRReflection isBlock:object]) should] beNo];
            [[theValue([GRReflection isInstance:object]) should] beYes];
        };

        void (^isNothing)(id) = ^(id object) {
            [[theValue([GRReflection isClass:object]) should] beNo];
            [[theValue([GRReflection isProtocol:object]) should] beNo];
            [[theValue([GRReflection isBlock:object]) should] beNo];
            [[theValue([GRReflection isInstance:object]) should] beNo];
        };

        describe(@"Reflection", ^{

            it(@"gets the type of a property class", ^{
                id object = [GRReflection getTypeForProperty:@"wheel" ofClass:[Car class]];
                [[object should] equal:[Wheel class]];
            });

            it(@"gets the type of a property protocol", ^{
                id object = [GRReflection getTypeForProperty:@"engine" ofClass:[Car class]];
                [[object should] equal:@protocol(Engine)];
            });

            it(@"raises exeption for unknown property names", ^{
                [[theBlock(^{
                    [GRReflection getTypeForProperty:@"iDoNotExist" ofClass:[Car class]];
                }) should] raiseWithName:@"GIReflectorException"];
            });

            it(@"returns all property names", ^{
                NSArray *propertyNames = [GRReflection getAllPropertyNamesOfClass:[Car class]];
                [[theValue(propertyNames.count) should] equal:theValue(2)];
                [[propertyNames should] equal:@[@"wheel", @"engine"]];
            });

            it(@"is a class", ^{
                id object = [Car class];
                isClass(object);
            });

            it(@"is a protocol", ^{
                id object = @protocol(Engine);
                isProtocol(object);
            });

            it(@"is a block", ^{
                void (^object)() = ^{
                };

                isBlock(object);
            });

            it(@"is a block", ^{
                id (^object)(id someThing) = ^id(id someThing) {
                    return [[NSObject alloc] init];
                };

                isBlock(object);
            });

            it(@"is an instance", ^{
                id object = [[Car alloc] init];
                isInstance(object);
            });

            it(@"nil is handled correctly", ^{
                isNothing(nil);
            });

        });

        SPEC_END