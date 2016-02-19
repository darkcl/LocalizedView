//
//  UIViewController+AppLocale.h
//  Pods
//
//  Created by Yeung Yiu Hung on 19/2/16.
//
//

#import <UIKit/UIKit.h>

@interface UIViewController (AppLocale)

- (void)setUpLocalizationString NS_REQUIRES_SUPER;

@property (readwrite) IBInspectable BOOL isSetupLocaleByXib;

@end
