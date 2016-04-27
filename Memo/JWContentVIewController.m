//
//  JWContentVIewController.m
//  Memo
//
//  Created by jasonwu on 4/25/16.
//  Copyright © 2016 jasonwu. All rights reserved.
//

#import "JWContentVIewController.h"
#import "JWMemoDetail.h"
#import "JWDetailViewController.h"
#import "JWNewMemoViewController.h"
#import "JWNewMemoProtocol.h"
#import "JWUpdateMemoProtocol.h"

//需要实现NewMemoProtocol和UpdateMemoProtocol两个协议
@interface JWContentVIewController () <NewMemoProtocol,UpdateMemoProtocol>


@end

@implementation JWContentVIewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.detailViewController = [[JWDetailViewController alloc] init];
    self.neMemoViewController = [[JWNewMemoViewController alloc] init];
    //设置代理，才能在两者之间建立委托关系
    self.neMemoViewController.delegate = self;
    self.detailViewController.delegate = self;
    //修改下一个view返回时的显示文本为“返回”,默认是"Back"
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
    backItem.title = @"返回";
    self.navigationItem.backBarButtonItem = backItem;
    //创建"新建"按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"新建" style:UIBarButtonItemStylePlain target:self action:@selector(clickAdd)];
}

#pragma mark 页面重现
//DetailViewController是被大家共用的，只是数据源不同而已。
//由于viewDidLoad只执行一次，tableView不会自动再次刷新，
//所以这里在页面即将展示的时候需要主动刷新一次数据源。
- (void)viewWillAppear:(BOOL)animated {
  //  NSLog(@"content view will appear");
    [self.tableView reloadData];
}

#pragma mark - 新建备忘录方法 -
#pragma mark 展示新建备忘录的页面
- (void)clickAdd {
    [self.navigationController pushViewController:self.neMemoViewController animated:YES];
}
#pragma mark 完成新建
- (void) addNewMemo:(JWMemoDetail *)memoData {
    [self.memoDetails addObject:memoData];
}
#pragma mark - 更新备忘录方法 -
- (void) updateMemo:(JWMemoDetail *)memoData {
    [self.memoDetails replaceObjectAtIndex:self.selectedIndex withObject:memoData];
}

#pragma mark -数据源协议 -

#pragma mark 返回行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  //  NSLog(@"%lu",[self.memoDetails count]);
    return [self.memoDetails count];
}

#pragma mark 返回每行的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = @"contentCellIdentifier";
    UITableViewCell *cell;
    cell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell =  [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    JWMemoDetail *de = [self.memoDetails objectAtIndex:indexPath.row];
    cell.textLabel.text = [de title];
    //24小时之内只显示小时和分钟， 否则显示年月日
    NSString *strCreateTime = [de createTime];
    NSArray *timeArray = [strCreateTime componentsSeparatedByString:@" "];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy/MM/dd HH:mm"];
    NSDate *dateCreateTime = [formatter dateFromString:strCreateTime];
    NSTimeInterval interval = [dateCreateTime timeIntervalSinceNow];
    interval = -interval;
    if (interval >= 24 * 3600) {
        cell.detailTextLabel.text = timeArray[0];
    }else {
        cell.detailTextLabel.text = timeArray[1];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
#pragma mark - 代理协议 -
#pragma mark 选择某一行
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    JWMemoDetail *md = [_memoDetails objectAtIndex:indexPath.row];
    self.selectedIndex = indexPath.row;
    NSString *detail = [md detail];
    self.detailViewController.detail = detail;
    self.detailViewController.createTime = [md createTime];
    //展示详细的备忘录信息页面
    [self.navigationController pushViewController:self.detailViewController animated:YES];
}

#pragma mark 滑动删除
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if(editingStyle == UITableViewCellEditingStyleDelete) {
        [self.memoDetails removeObjectAtIndex:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationBottom];
    }
}

#pragma mark 更改滑动按钮文本
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"删除";
}


@end
