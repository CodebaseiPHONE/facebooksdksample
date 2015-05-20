//
//  FacebookManager.m
//  FacebookSample
//
//  Created by Aromal S on 18/05/15.
//  Copyright (c) 2015 Codebase. All rights reserved.
//

#import "FacebookManager.h"
#import "FBSDKLoginManagerLoginResult.h"
@implementation FacebookManager

+ (id)sharedManager {
    static FacebookManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

-(void)openSessionWithReadPermissions:(NSArray*) permissions
{
    
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    
    permissions = @ [@"email", @"user_location",@"user_friends",@"public_profile"];
    [login logInWithReadPermissions:permissions handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
        if (error) {
            // Process error
        } else if (result.isCancelled) {
            // Handle cancellations
        } else {
            // If you ask for multiple permissions at once, you
            // should check if specific permissions missing
            if ([result.grantedPermissions containsObject:@"email"]) {
                // Do work
            }
        }
    }];
    
}

-(void)openSessionWithWritePermissions:(NSArray*) permissions
{
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];

    permissions = @[@"publish_actions"]
    [login logInWithPublishPermissions:permissions handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
        if (error) {
            // Process error
        } else if (result.isCancelled) {
            // Handle cancellations
        } else {
            // If you ask for multiple permissions at once, you
            // should check if specific permissions missing
            if ([result.grantedPermissions containsObject:@"publish_actions"]) {
                // Do work
            }
        }
    }];
}
+(void)openSessionWithWritePermissions:(NSArray*) permissions
{
    FacebookManager* fbmanger = [FacebookManager sharedManager];
    
    [fbmanger openSessionWithWritePermissions:permissions];
}
+(void)openSessionWithReadPermissions:(NSArray*) permissions
{
    FacebookManager* fbmanger = [FacebookManager sharedManager];
    
    [fbmanger openSessionWithReadPermissions:permissions];
}
+(void)handleDidFinish:(UIApplication*) application andLaunchOptions:(NSDictionary *)launchOptions
{
    [[FBSDKApplicationDelegate sharedInstance] application:application
                             didFinishLaunchingWithOptions:launchOptions];
}



+(void)activateApp
{
    
    //should be called in applicationDidBecomeActive
    [FBSDKAppEvents activateApp];
}
+ (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return [[FBSDKApplicationDelegate sharedInstance] application:application
                                                          openURL:url
                                                sourceApplication:sourceApplication
                                                       annotation:annotation];
}
@end
