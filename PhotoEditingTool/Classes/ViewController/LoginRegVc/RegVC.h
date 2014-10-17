//
//  RegVC.h
//  PhotoEditingTool
//
//  Created by indianic on 16/10/14.
//  Copyright (c) 2014 ILDC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "database.h"

@interface RegVC : UIViewController

  @property (weak, nonatomic) IBOutlet UITextField *txtEmail;
  @property (weak, nonatomic) IBOutlet UITextField *txtNickname;
  @property (weak, nonatomic) IBOutlet UITextField *txtPassword;


- (IBAction)btnResisterme:(UIButton *)sender;


@end
