//
//  JWHomeViewContronller.h
//  Memo
//
//  Created by jasonwu on 4/22/16.
//  Copyright © 2016 jasonwu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JWContentVIewController;

@interface JWHomeViewContronller : UITableViewController

@property (nonatomic,strong) JWContentVIewController *contentViewController;
@property (nonatomic) NSString *dataFileName;//存取文件的绝对路径名称
@property (nonatomic) NSInteger  selectedIndex;

-(void)storeDataToFile;

@end
