//
//  ViewController.m
//  TouchID
//
//  Created by James Harnett on 6/2/14.
//  Copyright (c) 2014 James Harnett. All rights reserved.
//

#import "ViewController.h"
#import <LocalAuthentication/LocalAuthentication.h>

@interface ViewController ()

@end

@implementation ViewController
            
- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)authenticationButton
{
    LAContext *myContext = [[LAContext alloc] init];
    NSError *authError = nil;
    NSString *myLocalizedReasonString = @"Please scan your fingerprint to continue.";
    
    if ([myContext canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&authError]) {
        [myContext evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics
                  localizedReason:myLocalizedReasonString
                            reply:^(BOOL success, NSError *error) {
                                if (success) {
                                    // User authenticated successfully, take appropriate action
                                    NSLog(@"authentication success");
                                    if (!success) {
                                        NSLog(@"%@", error);
                                    }
                                } else {
                                    // User did not authenticate successfully, look at error and take appropriate action
                                    NSLog(@"authentication failed");
                                    if (!success) {
                                        NSLog(@"%@", error);
                                    }
                                }
                            }];
    } else {
        // Could not evaluate policy; look at authError and present an appropriate message to user
        NSLog(@"an error occured");
        if (!success) {
            NSLog(@"%@", error);
        }
    }
}

@end
