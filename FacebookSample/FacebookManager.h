//
//  FacebookManager.h
//  FacebookSample
//
//  Created by Aromal S on 18/05/15.
//  Copyright (c) 2015 Codebase. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import "FBSDKLoginManager.h"
@interface FacebookManager : NSObject
+ (id)sharedManager;

-(void)loginToFacebookWithPemissions:(NSArray*) permissions;

+(void)handleDidFinish:(UIApplication*) application andLaunchOptions:(NSDictionary *)launchOptions;
+(void)activateApp;
+ (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation;



@end
