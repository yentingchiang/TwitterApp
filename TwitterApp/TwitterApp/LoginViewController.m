//
//  LoginViewController.m
//  TwitterApp
//
//  Created by Tim Chiang on 2015/6/27.
//  Copyright (c) 2015年 Tim Chiang. All rights reserved.
//

#import "LoginViewController.h"
#import "TweetsViewController.h"
#import "TwitterClient.h"

@interface LoginViewController ()

@property (nonatomic, strong) User *user;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)viewDidAppear:(BOOL)animated {
 //   [self viewDidAppear:animated];
    NSLog(@"viewDiApper");
   
    self.user = [User currentUser];
    if (self.user != nil) {
        NSLog(@"had login");
        
        NSLog(@"%@", self.user);
        UINavigationController *navController = [self.storyboard instantiateViewControllerWithIdentifier:@"TimelineNavigation"];
        [self presentViewController:navController animated:YES completion:nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onLogin:(id)sender {
   
    [[TwitterClient sharedInstance] loginWithCompletion:^(User *user, NSError *error) {
        if (user != nil ) {
           // Modally present tweets view
            UINavigationController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"TimelineNavigation"];
            [self presentViewController:controller animated:YES completion:nil];
            
            NSLog(@"welcome to %@", user.name);
        } else {
           // present erro view
        }
    }];
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
