//
//  AlbumListingVC.m
//  PhotoEditingTool
//
//  Created by indianic on 17/10/14.
//  Copyright (c) 2014 ILDC. All rights reserved.
//

#import "AlbumListingVC.h"
#import "database.h"
@interface AlbumListingVC ()

@end

@implementation AlbumListingVC
@synthesize AlbumList;
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
    self.navigationItem.hidesBackButton=YES;
    
    [self getAlbumList];
   
    // Do any additional setup after loading the view.
}


-(void) getAlbumList
{// user id condition - pending
    NSString *aStrQuery = [NSString stringWithFormat: @"SELECT * FROM Albums"];
    
    AlbumList=[[database shareDatabase]getAllDataForQuery:aStrQuery];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSLog(@"%d",[AlbumList  count]);
    return  [AlbumList  count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"albums" forIndexPath:indexPath];
    
    if(!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"albums"];
    }
    cell.textLabel.text=[[AlbumList objectAtIndex:indexPath.row] objectForKey:@"album_name"];;
    return cell;
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

@end
