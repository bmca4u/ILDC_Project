//
//  MPViewController.h
//  PhotoEditingTool
//
//  Created by indianic on 13/10/14.
//  Copyright (c) 2014 ILDC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MPViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *txtUsername;

@property (strong, nonatomic) IBOutlet UITextField *txtPassword;
- (IBAction)btnSubmit:(UIButton *)sender;
@end
