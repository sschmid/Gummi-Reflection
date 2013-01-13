## Gummi Reflection
![Gummi Reflection Logo](http://sschmid.com/Libs/Gummi-Reflection/Gummi-Reflection-128.png)

Gummi Reflection is a set of methods to easily inspect objects in Objective-C.

#### Inspect an object
```objective-c
id object = [SomeObject class];
BOOL isClass = [GRReflection isClass:object];
BOOL isProtocol = [GRReflection isProtocol:object];
BOOL isInstance = [GRReflection isInstance:object];
```

#### Get the type of a property of a given class
```objective-c
id class = [GRReflection getTypeForProperty:@"leftFrontWheel" ofClass:[Car class]]; // returns class 'Wheel'
id protocol = [GRReflection getTypeForProperty:@"motor" ofClass:[Car class]]; // returns protocol <Motor>
```

#### TODO
Implement methods for all other types.

## Use Gummi Reflection in your project
You find the source files you need in Gummi-Reflection/Classes.

## CocoaPods
Create a Podfile and put it into your root folder of your project

#### Edit your Podfile
```
platform :ios, '5.0'
pod 'Gummi-Reflection'
```

#### Setup [CocoaPods], if not done already
```
$ sudo gem install cocoapods
$ pod setup
```

#### Add this remote
```
$ pod repo add sschmid-cocoapods-specs https://github.com/sschmid/cocoapods-specs
```

#### Install Gummi
```
$ cd path/to/project
$ pod install
```

## Other projects using Gummi Reflection

* [Gummi Injection] (https://github.com/sschmid/Gummi-Injection) A lightweight dependency injection framework for Objective-C.

[cocoapods]: http://cocoapods.org/
[Gummi Injection]: https://github.com/sschmid/Gummi-Injection/
