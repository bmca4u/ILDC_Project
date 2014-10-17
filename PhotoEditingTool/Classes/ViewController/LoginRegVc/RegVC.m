//
//  RegVC.m


//  PhotoEditingTool
//
//  Created by indianic on 16/10/14.
//  Copyright (c) 2014 ILDC. All rights reserved.
//

#import "RegVC.h"

@interface RegVC ()

@end

@implementation RegVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (BOOL)textFieldShouldReturn:(UITextField *)textField

{
    
    [textField resignFirstResponder];
    
    return YES;
    
}



- (IBAction)btnResisterme:(UIButton *)sender {
    
    NSString *aStrQueryInsert = [NSString stringWithFormat:@"INSERT INTO Registration_Form (Nickname,Email,password) VALUES ('%@','%@','%@')",_txtNickname,_txtEmail,_txtPassword];
    
    
    
    [[database shareDatabase]dataBaseQuery:aStrQueryInsert];
    

}
@end
