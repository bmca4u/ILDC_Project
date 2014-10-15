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
    
    NSLog(@"%@",txtUsername.text);
    
    
    
    NSString *aStrQuery = [NSString stringWithFormat: @"SELECT * FROM Users WHERE username='%@' AND password ='%@'",txtUsername.text,txtPassword.text];
    
   NSMutableArray *userArray= [[database shareDatabase]getAllDataForQuery:aStrQuery];
    
    if([userArray count]){
    
        NSLog(@"yes%d",[userArray count]);
    }else{
        
     NSLog(@"NO	%d",[userArray count]);
    
    }
    
}
@end
