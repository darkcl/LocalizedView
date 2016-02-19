//
//  UITextView+AppLocale.m
//  Pods
//
//  Created by Yeung Yiu Hung on 19/2/2016.
//
//

#import "UITextView+AppLocale.h"

@implementation UITextView (AppLocale)

- (void)setLocalizedString{
    if ([self respondsToSelector:@selector(localizedKey)] && self.localizedKey.length != 0) {
        self.text = AMLocalizedString(self.localizedKey, nil);
    }
}

@end
