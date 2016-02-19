//
//  LVRootViewController.m
//  LocalizedView
//
//  Created by Yeung Yiu Hung on 19/2/16.
//  Copyright © 2016 Yeung Yiu Hung. All rights reserved.
//

#import "LVRootViewController.h"

@interface LVRootViewController ()

@end

@implementation LVRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeButtonPressed:(id)sender {
    NSString * currentLocale = LocalizationGetLanguage;
    if ([currentLocale isEqualToString:@"en"]) {
        LocalizationSetLanguage(@"zh-Hant");
    }else{
        LocalizationSetLanguage(@"en");
    }
    [self setUpLocalizationString];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
