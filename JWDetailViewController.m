//
//  JWDetailViewController.m
//  Memo
//
//  Created by jasonwu on 4/25/16.
//  Copyright © 2016 jasonwu. All rights reserved.
//

#import "JWDetailViewController.h"

// 需要实现UITextViewDelegate和UIAlertViewDelegate协议
@interface JWDetailViewController () <UITextViewDelegate,UIAlertViewDelegate> {

    bool textHasChanged;//标记文本是否更改过
}
@end

//Label的大小
#define TIMELABEL_WIDTH 120
#define TIMELABLE_HEIGHT 10
@implementation JWDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //显示创建时间的Label ，顶部 居中
    self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width - TIMELABEL_WIDTH)/2, 80, TIMELABEL_WIDTH, TIMELABLE_HEIGHT)];
    [self.timeLabel setFont:[UIFont boldSystemFontOfSize:10.0]];
    self.timeLabel.backgroundColor = [UIColor whiteColor];
    self.timeLabel.textColor = [UIColor grayColor];
    self.timeLabel.text = self.createTime;
    //textView的区域
    self.view.backgroundColor = [UIColor whiteColor];
    self.textView = [[UITextView alloc] initWithFrame:CGRectMake(0,90, self.view.frame.size.width, self.view.frame.size.height)];
    self.textView.delegate  = self;
    self.textView.text = self.detail;
    [self.view addSubview:self.timeLabel];
    [self.view addSubview:self.textView];
    
    //为了响应返回的事件，不用默认的backBarButtonItem,用leftBarButtonItem
    //并调用goBack方法。
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(goBack)];

}

#pragma mark 返回上级ViewController前该做的事
- (void)goBack {
    NSString *newMemoDetail = self.textView.text;
    //不能为空
    if ([newMemoDetail isEqualToString:@""]) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"警告" message:@"备忘录不能为空" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleCancel
                                                             handler:^(UIAlertAction * action) {}];
        [alert addAction:cancelAction];
        [self presentViewController:alert animated:YES completion:nil];
        return;
    }
    if (textHasChanged) {//更新了文本才做
        //获取当前添加的时间
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy/MM/dd HH:mm"];
        NSString *createTime = [formatter stringFromDate:[NSDate date]];
        //获取标题和内容
        NSString *detail = _textView.text;
        NSArray *stringArray = [detail componentsSeparatedByString:@"\n"];
        NSString *title = [stringArray objectAtIndex:0];
        
        JWMemoDetail *memoDetail = [JWMemoDetail memoDetailWithTitle:title andCreateTime:createTime andDetail:detail];
        //由代理调用updateMemo方法，
        //据此，ContentViewController更新了它的memoDetails数组，
        //以此类推，HomeViewController也更新了_memoAccout的memoDetails内容。
        [self.delegate updateMemo:memoDetail];
    }
    //退出焦点和键盘
    [self.textView resignFirstResponder];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    self.textView.text = self.detail;
    self.timeLabel.text = self.createTime;
    textHasChanged = false;
}
#pragma mark - 代理方法 -
- (void)textViewDidChange:(UITextView *)textView {
    textHasChanged = true;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
