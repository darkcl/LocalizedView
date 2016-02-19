//
//  UITextField+AppLocale.m
//  Pods
//
//  Created by Yeung Yiu Hung on 19/2/2016.
//
//

#import <objc/runtime.h>
#import "UITextField+AppLocale.h"

static void * LocalizedTextFieldPlaceHolderPropertyKey = &LocalizedTextFieldPlaceHolderPropertyKey;

@implementation UITextField (AppLocale)

- (NSString *)localizedPlaceHolderKey {
    return objc_getAssociatedObject(self, LocalizedTextFieldPlaceHolderPropertyKey);
}

- (void)setLocalizedPlaceHolderKey:(NSString *)key {
    objc_setAssociatedObject(self, LocalizedTextFieldPlaceHolderPropertyKey, key, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setLocalizedString{
    if ([self respondsToSelector:@selector(localizedKey)] && self.localizedKey.length != 0) {
        self.text = AMLocalizedString(self.localizedKey, nil);
    }
    
    if ([self respondsToSelector:@selector(localizedPlaceHolderKey)] && self.localizedPlaceHolderKey.length != 0) {
        self.placeholder = AMLocalizedString(self.localizedPlaceHolderKey, nil);
    }
}

@end
