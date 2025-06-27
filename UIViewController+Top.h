//
//  UIViewController+Top.h
//  spooferxsl
//
//  Created by spooferx on 11/21/19.
//
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (Top)

+ (UIViewController*)topMostController;
- (UINavigationController *)embeddedInNavigationControllerWithNavigationBarClass:(Class)navigationBarClass;

@end

NS_ASSUME_NONNULL_END
