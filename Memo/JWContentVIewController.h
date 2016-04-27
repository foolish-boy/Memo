//
//  JWContentVIewController.h
//  Memo
//
//  Created by jasonwu on 4/25/16.
//  Copyright © 2016 jasonwu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JWMemoDetail;
@class JWDetailViewController;
@class JWNewMemoViewController;

@interface JWContentVIewController : UITableViewController

@property (nonatomic,strong) NSMutableArray *memoDetails;
//在当前view下点击单元格，显示对应的详细信息，展示在detailViewController上
@property (nonatomic,strong) JWDetailViewController *detailViewController;
//在当前view下“新建”，添加新的备忘录，展示在neViewController上
@property (nonatomic, strong) JWNewMemoViewController *neMemoViewController;//貌似oc中不能以new开始的变量名

//当前选择的行数，便于在updateMemo方法中索引。
@property (nonatomic) NSInteger selectedIndex;

@end
