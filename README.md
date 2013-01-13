# Gummi Reflection
![Gummi Reflection Logo](http://sschmid.com/Libs/Gummi-Reflection/Gummi-Reflection-128.png)

## Description
Gummi Reflection is a set of methods to easily inspect objects in Objective-C.

## How to use Gummi Reflection
#### Inspect an object
```objective-c
id object = [SomeObject class];
BOOL isClass = [GRReflection isClass:object];
BOOL isProtocol = [GRReflection isProtocol:object];
BOOL isInstance = [GRReflection isInstance:object];
```
#### Get the type of a property of a given class
```objective-c
// returns class 'Wheel'
id class = [GRReflection getTypeForProperty:@"leftFrontWheel"
                                    ofClass:[Car class]];

// returns protocol <Motor>
id protocol = [GRReflection getTypeForProperty:@"motor"
                                       ofClass:[Car class]];
```

## Ideas / Roadmap
* Implement methods for all other types.

## Install Gummi Reflection
You find the source files you need in Gummi-Reflection/Classes.

## CocoaPods
Install [CocoaPods] (http://cocoapods.org) and add the Gummi Reflection reference to your Podfile
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
* [Gummi Injection] (https://github.com/sschmid/Gummi-Injection) A lightweight dependency injection framework for Objective-C.
