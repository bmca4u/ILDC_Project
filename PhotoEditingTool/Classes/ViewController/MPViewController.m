//
//  MPViewController.m
//  PhotoEditingTool
//
//  Created by indianic on 13/10/14.
//  Copyright (c) 2014 ILDC. All rights reserved.
//

#import "MPViewController.h"
#import "database.h"
@interface MPViewController ()

@end

@implementation MPViewController
@synthesize txtPassword;
@synthesize txtUsername;
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBarHidden=NO;
    self.navigationItem.hidesBackButton=YES;
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    //
    // Dispose of any resources that can be recreated.
}





- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [ textField resignFirstResponder];
    
    return YES;
    
}
- (IBAction)btnSubmit:(UIButton *)sender {
      NSString *aStrQuery = [NSString stringWithFormat: @"SELECT * FROM Users WHERE username='%@' AND password ='%@'",txtUsername.text,txtPassword.text];
    
   NSMutableArray *userArray= [[database shareDatabase]getAllDataForQuery:aStrQuery];
    
    if([userArray count]){
        
        NSLog(@"%@d",userArray);
        
        // Save User details to session for future use
        id userid=[[userArray objectAtIndex:0] objectForKey:@"id"];
        [[NSUserDefaults standardUserDefaults] setObject:txtUsername.text forKey:@"USERNAME"];
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"AUTOLOGIN"];
        [[NSUserDefaults standardUserDefaults] setObject:userid forKey:@"USERID"];
        [[NSUserDefaults standardUserDefaults] synchronize];
         //     [self.navigationController pushViewController:objProfile animated:YES];

        [self performSegueWithIdentifier:@"LoginToTabBar" sender:self];
    }else{
        NSLog(@"NO	%d",[userArray count]);
      message =@"Invalid User";

        UIAlertView *alertSingle =[[UIAlertView alloc]initWithTitle:@"Photo Editing Tool" message:message delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        alertSingle.tag=1;
        [alertSingle show];

    }
  }
@end
