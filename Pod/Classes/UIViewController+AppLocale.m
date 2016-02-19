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

@end
