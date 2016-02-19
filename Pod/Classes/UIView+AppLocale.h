//
//  UIView+AppLocale.h
//  Pods
//
//  Created by Yeung Yiu Hung on 19/2/16.
//
//

#import <UIKit/UIKit.h>

@interface UIView (AppLocale)

- (void)setLocalizedString;

@property (nonatomic, strong) IBInspectable NSString *localizedKey;

@end
