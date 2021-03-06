//
//  MPAppDelegate.m
//  PhotoEditingTool
//
//  Created by indianic on 13/10/14.
//  Copyright (c) 2014 ILDC. All rights reserved.
//

#import "MPAppDelegate.h"

@implementation MPAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [self awakeFromNib];
    return YES;
}

-(void)awakeFromNib {
    BOOL Success;
	NSError *error;
	NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *docDir=[paths objectAtIndex:0];
	NSString *writableDBPath=[docDir stringByAppendingPathComponent:@"myPhotoEditingToolSqllite"];
	Success = [[NSFileManager defaultManager] fileExistsAtPath:writableDBPath];
	
	if(Success)
		return;
	NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"myPhotoEditingToolSqllite"];
	Success=[[NSFileManager defaultManager] copyItemAtPath:defaultDBPath toPath:writableDBPath error:&error];
    
	if(!Success) {
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error " message:@"Filed To Create Writable DataBase" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
		[alert show];
	}
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
