//
//  JWDetailViewController.h
//  Memo
//
//  Created by jasonwu on 4/25/16.
//  Copyright © 2016 jasonwu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JWUpdateMemoProtocol.h"

@interface JWDetailViewController : UIViewController

//文本， 备忘录内容
@property (nonatomic, strong) NSString *detail;
//顶部，创建时间
@property (nonatomic, strong) NSString *createTime;
//顶部，创建时间
@property (nonatomic, strong) UILabel *timeLabel;
//UITextView
@property (nonatomic, strong) UITextView *textView;
//实现UpdateMemoProtocol协议的代理，上一级的viewController
@property (nonatomic) id<UpdateMemoProtocol> delegate;

@end
