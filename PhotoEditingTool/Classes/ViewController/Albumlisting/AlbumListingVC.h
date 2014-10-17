//
//  AlbumListingVC.h
//  PhotoEditingTool
//
//  Created by indianic on 17/10/14.
//  Copyright (c) 2014 ILDC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlbumListingVC : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NSMutableArray *AlbumList;
@end
