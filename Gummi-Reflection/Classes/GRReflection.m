//
// Created by Simon Schmid
//
// contact@sschmid.com
//

#import <objc/runtime.h>
#import "GRReflection.h"

static Class GRReflectionTypeProtocol;
static Class GRReflectionTypeBlock;

@implementation GRReflection

+ (void)initialize {
    GRReflectionTypeProtocol = object_getClass(@protocol(NSObject));
    GRReflectionTypeBlock = NSClassFromString(@"NSBlock");
}

+ (NSArray *)getAllPropertyNamesOfClass:(Class)aClass {
    NSMutableArray *propertyNames = [[NSMutableArray alloc] init];
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList(aClass, &outCount);
    for (i = 0; i < outCount; i++)
        [propertyNames addObject:@(property_getName(properties[i]))];

    return propertyNames;
}

+ (id)getTypeForProperty:(NSString *)propertyName ofClass:(Class)aClass {
    objc_property_t property = class_getProperty(aClass, [propertyName UTF8String]);
    if (!property)
        @throw [NSException exceptionWithName:[NSString stringWithFormat:@"%@Exception", NSStringFromClass([self class])]
                                       reason:[NSString stringWithFormat:@"'%@' does not have a property for '%@'",
                                                                         NSStringFromClass(aClass), propertyName]
                                     userInfo:nil];

    NSString *attributes = @(property_getAttributes(property));

    NSRange startRange = [attributes rangeOfString:@"T@\""];
    if (startRange.location == NSNotFound)
        @throw [NSException exceptionWithName:[NSString stringWithFormat:@"%@Exception", NSStringFromClass([self class])]
                   reason:[NSString stringWithFormat:@"Unable to determine class type for property '%@' of class '%@'",
                                                     propertyName, aClass]
                                     userInfo:nil];

    NSString *startOfClassName = [attributes substringFromIndex:startRange.length];

    NSRange endRange = [startOfClassName rangeOfString:@"\""];
    if (endRange.location == NSNotFound)
        @throw [NSException exceptionWithName:[NSString stringWithFormat:@"%@Exception", NSStringFromClass([self class])]
                   reason:[NSString stringWithFormat:@"Unable to determine class type for property '%@' of class '%@'",
                                                     propertyName, aClass]
                                     userInfo:nil];

    if ([[startOfClassName substringToIndex:1] isEqualToString:@"<"])
        return NSProtocolFromString([[startOfClassName substringFromIndex:1] substringToIndex:endRange.location - 2]);
    else
        return NSClassFromString([startOfClassName substringToIndex:endRange.location]);
}

+ (BOOL)isProtocol:(id)object {
    if (!object)
        return NO;

    return [object_getClass(object) isEqual:GRReflectionTypeProtocol];
}

+ (BOOL)isClass:(id)object {
    if (!object)
        return NO;

    return class_isMetaClass(object_getClass(object));
}

+ (BOOL)isBlock:(id)object {
    if (!object)
        return NO;

    return [object isKindOfClass:GRReflectionTypeBlock];
}

+ (BOOL)isInstance:(id)object {
    if (!object)
        return NO;

    return ![self isClass:object] &&
            ![self isProtocol:object] &&
            ![self isBlock:object];
}

@end