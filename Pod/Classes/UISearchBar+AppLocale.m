//
//  UISearchBar+AppLocale.m
//  Pods
//
//  Created by Yeung Yiu Hung on 20/2/2016.
//
//

#import <objc/runtime.h>
#import "UISearchBar+AppLocale.h"

static void * LocalizedSearchBarPlaceHolderPropertyKey = &LocalizedSearchBarPlaceHolderPropertyKey;
static void * LocalizedSearchBarPromptPropertyKey = &LocalizedSearchBarPromptPropertyKey;

@implementation UISearchBar (AppLocale)

- (NSString *)localizedPlaceHolderKey {
    return objc_getAssociatedObject(self, LocalizedSearchBarPlaceHolderPropertyKey);
}

- (void)setLocalizedPlaceHolderKey:(NSString *)key {
    objc_setAssociatedObject(self, LocalizedSearchBarPlaceHolderPropertyKey, key, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)localizedPromptKey {
    return objc_getAssociatedObject(self, LocalizedSearchBarPromptPropertyKey);
}

- (void)setLocalizedPromptKey:(NSString *)key {
    objc_setAssociatedObject(self, LocalizedSearchBarPromptPropertyKey, key, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setLocalizedString{
    if ([self respondsToSelector:@selector(localizedKey)] && self.localizedKey.length != 0) {
        self.text = AMLocalizedString(self.localizedKey, nil);
    }
    
    if ([self respondsToSelector:@selector(localizedPlaceHolderKey)] && self.localizedPlaceHolderKey.length != 0) {
        self.placeholder = AMLocalizedString(self.localizedPlaceHolderKey, nil);
    }
    
    if ([self respondsToSelector:@selector(localizedPromptKey)] && self.localizedPromptKey.length != 0) {
        self.prompt = AMLocalizedString(self.localizedPromptKey, nil);
    }
}

@end
