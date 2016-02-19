//
//  UIViewController+AppLocale.m
//  Pods
//
//  Created by Yeung Yiu Hung on 19/2/16.
//
//

#import <objc/runtime.h>
#import "UIViewController+AppLocale.h"

static void * SetupLocalizedStringWithKeyPropertKey = &SetupLocalizedStringWithKeyPropertKey;

@implementation UIViewController (AppLocale)

- (void)setIsSetupLocaleByXib:(BOOL) property{
    NSNumber *number = [NSNumber numberWithBool: property];
    objc_setAssociatedObject(self, SetupLocalizedStringWithKeyPropertKey, number , OBJC_ASSOCIATION_RETAIN);
}

- (BOOL)isSetupLocaleByXib{
    NSNumber *number = objc_getAssociatedObject(self, SetupLocalizedStringWithKeyPropertKey);
    return [number boolValue];
}

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        SEL originalSelector = @selector(viewDidLoad);
        SEL swizzledSelector = @selector(applocale_viewDidLoad);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        // When swizzling a class method, use the following:
        // Class class = object_getClass((id)self);
        // ...
        // Method originalMethod = class_getClassMethod(class, originalSelector);
        // Method swizzledMethod = class_getClassMethod(class, swizzledSelector);
        
        BOOL didAddMethod =
        class_addMethod(class,
                        originalSelector,
                        method_getImplementation(swizzledMethod),
                        method_getTypeEncoding(swizzledMethod));
        
        if (didAddMethod) {
            class_replaceMethod(class,
                                swizzledSelector,
                                method_getImplementation(originalMethod),
                                method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

- (void)setUpLocalizationString{
    if ([self respondsToSelector:@selector(isSetupLocaleByXib)] && self.isSetupLocaleByXib) {
        for (UIView *subview in self.view.subviews) {
            [self setUpLocalizationStringForView:subview];
        }
    }
}

- (void)setUpLocalizationStringForView:(UIView *)aView{
    [aView setLocalizedString];
    
    for (UIView *subview in aView.subviews) {
        [self setUpLocalizationStringForView:subview];
    }
}

- (void)applocale_viewDidLoad{
    [self applocale_viewDidLoad];
    [self setUpLocalizationString];
}

@end
