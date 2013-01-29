# Gummi Reflection
![Gummi Reflection Logo](http://sschmid.com/Libs/Gummi-Reflection/Gummi-Reflection-128.png)

## Description
Gummi Reflection is a set of class methods to easily inspect objects in Objective-C. It's a small subproject mainly used by [Gummi Injection] and [Gummi Commander].

## How to use Gummi Reflection

#### Inspect an object

```objective-c
Car *car = [[Car alloc] init];

BOOL isClass = [GRReflection isClass:car];
BOOL isProtocol = [GRReflection isProtocol:car];
BOOL isBlock = [GRReflection isBlock:car];
BOOL isInstance = [GRReflection isInstance:car];

NSLog(@"isClass = %d", isClass);        // NO
NSLog(@"isProtocol = %d", isProtocol);  // NO
NSLog(@"isBlock = %d", isBlock);        // NO
NSLog(@"isInstance = %d", isInstance);  // YES
```

#### Get all property names of a class

```objective-c
NSArray *propertyNames = [GRReflection getAllPropertyNamesOfClass:[Car class]];
NSLog(@"propertyNames = %@", propertyNames);  // (@"wheel", @"engine")
```

#### Get the property type of a class

```objective-c
// returns class 'Wheel'
id wheelType = [GRReflection getTypeForProperty:@"wheel"
                                        ofClass:[Car class]];

// returns protocol <Engine>
id engineType = [GRReflection getTypeForProperty:@"engine"
                                         ofClass:[Car class]];
```

## Install Gummi Reflection
You find the source files you need in Gummi-Reflection/Classes.

## CocoaPods
Install [CocoaPods](http://cocoapods.org) and add the Gummi Reflection reference to your Podfile

```
platform :ios, '5.0'
  pod 'Gummi-Reflection'
end
```

#### Add this remote

```
$ pod repo add sschmid-cocoapods-specs https://github.com/sschmid/cocoapods-specs
```

#### Install Gummi Reflection

```
$ cd path/to/project
$ pod install
```

Open the created Xcode Workspace file.

## Projects that use Gummi Reflection
* [Gummi Injection] - A lightweight dependency injection framework for Objective-C
* [Gummi Commander] - Event Command Mapping System for Objective-C

[Gummi Injection]: https://github.com/sschmid/Gummi-Injection
[Gummi Commander]: https://github.com/sschmid/Gummi-Commander