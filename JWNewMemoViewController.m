//
//  JWNewMemoViewController.m
//  Memo
//
//  Created by jasonwu on 4/25/16.
//  Copyright © 2016 jasonwu. All rights reserved.
//

#import "JWNewMemoViewController.h"
//#import "JWMemoDetail.m"  //"JWNewMemoProtocol.h"已经import

//需要实现UITextViewDelegate协议。
@interface JWNewMemoViewController () <UITextViewDelegate> {
    UITextView *_textView;
}
@end

@implementation JWNewMemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    _textView.delegate  = self;
    [self.view addSubview:_textView];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(addDone)];
 //   [_textView becomeFirstResponder];

}

//点击"完成" 完成新建
- (void)addDone {
    [self.navigationController popViewControllerAnimated:YES];
    //空的内容，不添加s
    if ([_textView.text isEqualToString:@""]) {
        return;
    }
    //获取当前添加的时间
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy/MM/dd HH:mm"];
    NSString *createTime = [formatter stringFromDate:[NSDate date]];
    //获取标题和内容
    NSString *detail = _textView.text;
    NSArray *stringArray = [detail componentsSeparatedByString:@"\n"];
    NSString *title = [stringArray objectAtIndex:0];
    
    JWMemoDetail *memoDetail = [JWMemoDetail memoDetailWithTitle:title andCreateTime:createTime andDetail:detail];
    [self.delegate addNewMemo:memoDetail];
    _textView.text = @"";// 由于只加载一遍页面（viewDidLoad）所以防止下次进入页面还有以前的数据

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
