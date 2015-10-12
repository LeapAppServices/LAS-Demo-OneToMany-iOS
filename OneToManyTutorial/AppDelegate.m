//

#import "AppDelegate.h"
#import "BlogTableViewController.h"

#import <MaxLeap/MaxLeap.h>

@implementation AppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // ****************************************************************************
    // Uncommit and fill in with your MaxLeap credentials:
    // ****************************************************************************
#warning Please fill in with your MaxLeap credentials
    // [MaxLeap setApplicationId:@"APPLICATION_ID_HERE" clientKey:@"CLIENT_KEY_HERE"];
    
    BlogTableViewController *rootVC = [[BlogTableViewController alloc] initWithStyle:UITableViewStylePlain];
    
    // ****************************************************************************
    // Create or Login a user
    // ****************************************************************************
    /*
     Feel free to modify this section or extend the application to include a login and register screen.
     This little piece of code will create a new user called Matt. If this user already exists, it will simply
     log Matt into the app. This is not the typical behaviour you would want, but it will allow you to play
     with object relationships without having to worry too much about user management. To learn more about
     the MLUser class take a look at the documentation here https://leap.as/en_us/guide/devguide/ios.html#users
     */
    MLUser *user = [MLUser user];
    user.username = @"Matt";
    user.password = @"password";
    user.email = @"Matt@example.com";
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        NSLog(@"user sign up succeeded %d, error: %@", succeeded, error);
        if (!error) {
            // Hooray! Let them use the app now.
            [rootVC refreshButtonHandler:nil];
        } else {
            [MLUser logInWithUsernameInBackground:@"Matt" password:@"password" block:^(MLUser *user, NSError *error) {
                if (user) {
                    NSLog(@"user log in, user: %@", user);
                    [rootVC refreshButtonHandler:nil];
                } else {
                    NSLog(@"user log in failed, error: %@", error);
                }
            }];
        }
    }];
    
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:rootVC];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

@end
