//
//  LocalizedViewTests.m
//  LocalizedViewTests
//
//  Created by Yeung Yiu Hung on 02/19/2016.
//  Copyright (c) 2016 Yeung Yiu Hung. All rights reserved.
//

// https://github.com/kiwi-bdd/Kiwi

#import <LocalizedView/LocalizedView.h>
#import "LVRootViewController.h"

SPEC_BEGIN(InitialTests)

describe(@"My initial tests", ^{
    context(@"will pass", ^{
        LVRootViewController *viewController = [[LVRootViewController alloc] initWithNibName:@"LVRootViewController" bundle:nil];
        
        
        it(@"should be set localized string with xib", ^{
            NSLog(@"Testing : %@", AMLocalizedString(@"setting_detail_title", nil));
            [[[NSNumber numberWithBool:viewController.isSetupLocaleByXib] should] beYes];
        });
        
        it(@"can read", ^{
            [[@"team" shouldNot] containString:@"I"];
        });
    });
    
});

SPEC_END

