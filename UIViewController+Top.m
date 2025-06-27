//
//  UIViewController+Top.m
//  spooferxsl
//
//  Created by spooferx on 11/21/19.
//

#import "UIViewController+Top.h"

@implementation UIViewController (Top)


- (UINavigationController *)embeddedInNavigationControllerWithNavigationBarClass:(Class)navigationBarClass
{
    UINavigationController *navigationController = [[UINavigationController alloc] initWithNavigationBarClass:navigationBarClass toolbarClass:nil];
    [navigationController pushViewController:self animated:NO];
    return navigationController;
}

+ (UIViewController*)topMostController {
    return [UIViewController topViewControllerWithRootViewController:[UIApplication sharedApplication].delegate.window.rootViewController];
}

+ (UIViewController*)topViewControllerWithRootViewController:(UIViewController*)rootViewController {
    if ([rootViewController isKindOfClass:[UITabBarController class]]) {
        UITabBarController* tabBarController = (UITabBarController*)rootViewController;
        return [self topViewControllerWithRootViewController:tabBarController.selectedViewController];
    } else if ([rootViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController* navigationController = (UINavigationController*)rootViewController;
        return [self topViewControllerWithRootViewController:navigationController.visibleViewController];
    } else if (rootViewController.presentedViewController) {
        UIViewController* presentedViewController = rootViewController.presentedViewController;
        return [self topViewControllerWithRootViewController:presentedViewController];
    } else {
        return rootViewController;
    }
}

@end
