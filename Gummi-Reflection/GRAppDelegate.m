//
// Created by Simon Schmid
//
// contact@sschmid.com
//

#import "GRAppDelegate.h"
#import "SimpleExample.h"

@implementation GRAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor blackColor];
    [self.window makeKeyAndVisible];

    [self addIcon];

    SimpleExample *simpleExample = [[SimpleExample alloc] init];

    return YES;
}

- (void)addIcon {
    UIImage *image = [UIImage imageNamed:@"Gummi-Reflection-144.png"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    CGRect centerFrame = CGRectMake(self.window.center.x - imageView.frame.size.width / 2,
            self.window.center.y - imageView.frame.size.height / 2,
            imageView.frame.size.width,
            imageView.frame.size.height);

    imageView.frame = centerFrame;
    [self.window addSubview:imageView];
}

@end
