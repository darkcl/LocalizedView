//
//  UIView+AppLocale.m
//  Pods
//
//  Created by Yeung Yiu Hung on 19/2/16.
//
//

#import <objc/runtime.h>
#import "UIView+AppLocale.h"

static void * LocalizedPropertKey = &LocalizedPropertKey;

@implementation UIView (AppLocale)

- (NSString *)localizedKey {
    return objc_getAssociatedObject(self, LocalizedPropertKey);
}

- (void)setLocalizedKey:(NSString *)key {
    objc_setAssociatedObject(self, LocalizedPropertKey, key, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
