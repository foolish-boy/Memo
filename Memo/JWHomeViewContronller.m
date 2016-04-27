//
//  JWHomeViewContronller.m
//  Memo
//
//  Created by jasonwu on 4/22/16.
//  Copyright © 2016 jasonwu. All rights reserved.
//

#import "JWHomeViewContronller.h"
#import "JWMemoAccount.h"
#import "JWMemoDetail.h"
#import "JWContentVIewController.h"


@interface JWHomeViewContronller() {
    NSMutableArray *_memoAccount;
}

@end

@implementation JWHomeViewContronller

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    self.navigationItem.title = @"账户";
    self.contentViewController = [[JWContentVIewController alloc] init];
 }

#pragma  mark 加载数据
- (void) initData {
    //这里要根据plist的存储格式来
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:self.dataFileName];
    
    _memoAccount = [[NSMutableArray alloc] init];
    //遍历所有的帐户，并给每个账户的所有备忘录结构体赋值。
    for (NSString *key in dict) {
        NSMutableArray *arr = [dict objectForKey:key];
        NSMutableArray *details1 = [[NSMutableArray alloc] init];
        [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSDictionary *dict2 = [arr objectAtIndex:idx];
            NSString *title = dict2[@"title"];
            NSString *createTime = dict2[@"createTime"];
            NSString *detail = dict2[@"detail"];
            JWMemoDetail *memoDetail = [JWMemoDetail memoDetailWithTitle:title andCreateTime:createTime andDetail:detail];
            [details1 addObject:memoDetail];
        }];
        JWMemoAccount *account1 = [JWMemoAccount memoAccountWithAccountName:key andDetail:details1];
        [_memoAccount addObject:account1];
    }
}

#pragma mark - UITableView的DataSource协议实现
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _memoAccount.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = @"homeCellIdentifier";
    UITableViewCell *cell;
    cell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell =  [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = [_memoAccount[indexPath.row] accountName];//首页显示账户名称
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

#pragma mark - UITableView的Delegate协议实现
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    JWMemoAccount *account = [_memoAccount objectAtIndex:indexPath.row];
    self.selectedIndex = indexPath.row;
    //第一次进入contentViewController才分配内存
    //以后直接复用。但是这里不要用initWithArray,
    //要显示赋值，才能使account的memoDetail与contentViewController的
    //memoDetails指向同一块内存，才能使两者保持实时一致性。
    if (self.contentViewController.memoDetails == nil) {
        self.contentViewController.memoDetails = [[NSMutableArray alloc] init];
        self.contentViewController.memoDetails = [account memoDetail];
    } else {
        self.contentViewController.memoDetails = [account memoDetail];
    }
    //显示contentViewController，既指定账户的所有备忘信息
    [self.navigationController pushViewController:self.contentViewController animated:YES];
}

#pragma mark 数据持久化
//由于plist只能存储特定的几种数据结构，所以这里需要将_memoAccount中的memoDetails
//转化为NSDictionary类型
- (void)storeDataToFile {
    NSMutableDictionary *dataToStore = [[NSMutableDictionary alloc] init];
    for (JWMemoAccount *account in _memoAccount) {
        NSString *accoutName = [account accountName];
        NSMutableArray *accountDetails = [account memoDetail];
        NSMutableArray *tmpArr = [[NSMutableArray alloc] init];
        for (JWMemoDetail *md in accountDetails) {
            NSMutableDictionary *tmpDic = [[NSMutableDictionary alloc] init];
            [tmpDic setValue:[md title] forKey:@"title"];
            [tmpDic setValue:[md createTime] forKey:@"createTime"];
            [tmpDic setValue:[md detail] forKey:@"detail"];
            [tmpArr addObject:tmpDic];
        }
        [dataToStore setObject:tmpArr forKey:accoutName];
    }
    [dataToStore writeToFile:self.dataFileName atomically:YES];
}

@end
