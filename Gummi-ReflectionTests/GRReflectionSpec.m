//
// Created by Simon Schmid
//
// contact@sschmid.com
//


#import "Kiwi.h"
#import "GRReflection.h"
#import "SomeObject.h"
#import "SomeOtherObject.h"
#import "SomeProtocol.h"

SPEC_BEGIN(GRReflectionSpec)

        describe(@"Reflection", ^{

            it(@"gets the type of a property class", ^{
                id class = [GRReflection getTypeForProperty:@"otherObject" ofClass:[SomeObject class]];
                [[class should] equal:[SomeOtherObject class]];
            });

            it(@"gets the type of a property protocol", ^{
                id protocol = [GRReflection getTypeForProperty:@"someProtocol" ofClass:[SomeObject class]];
                [[protocol should] equal:@protocol(SomeProtocol)];
            });

            it(@"raises exeption for unknown property names", ^{
                [[theBlock(^{
                    [GRReflection getTypeForProperty:@"iDoNotExist" ofClass:[SomeObject class]];
                }) should] raiseWithName:@"GIReflectorException"];
            });

            it(@"is a class", ^{
                id o = [SomeObject class];

                [[theValue([GRReflection isClass:o]) should] beYes];
                [[theValue([GRReflection isProtocol:o]) should] beNo];
                [[theValue([GRReflection isInstance:o]) should] beNo];
            });

            it(@"is a protocol", ^{
                id o = @protocol(SomeProtocol);

                [[theValue([GRReflection isClass:o]) should] beNo];
                [[theValue([GRReflection isProtocol:o]) should] beYes];
                [[theValue([GRReflection isInstance:o]) should] beNo];
            });

            it(@"is an instance", ^{
                id o = [[SomeObject alloc] init];

                [[theValue([GRReflection isClass:o]) should] beNo];
                [[theValue([GRReflection isProtocol:o]) should] beNo];
                [[theValue([GRReflection isInstance:o]) should] beYes];
            });

            it(@"nil is handled correctly", ^{
                id o = nil;

                [[theValue([GRReflection isClass:o]) should] beNo];
                [[theValue([GRReflection isProtocol:o]) should] beNo];
                [[theValue([GRReflection isInstance:o]) should] beNo];
            });

        });

        SPEC_END