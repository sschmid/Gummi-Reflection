//
// Created by Simon Schmid
//
// contact@sschmid.com
//

#import <Foundation/Foundation.h>

// Objective-C Runtime Programming Guide - Property Introspection
// https://developer.apple.com/library/mac/#documentation/Cocoa/Conceptual/ObjCRuntimeGuide/Articles/ocrtPropertyIntrospection.html

// Objective-C Runtime Reference
// http://developer.apple.com/library/ios/#documentation/Cocoa/Reference/ObjCRuntimeRef/Reference/reference.html

@interface GRReflection : NSObject

+ (NSArray *)getAllPropertyNamesOfClass:(Class)aClass;
+ (id)getTypeForProperty:(NSString *)propertyName ofClass:(Class)aClass;

+ (BOOL)isProtocol:(id)object;
+ (BOOL)isClass:(id)object;
+ (BOOL)isBlock:(id)object;
+ (BOOL)isInstance:(id)object;

@end