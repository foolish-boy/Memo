//
//  JWMemoDetail.h
//  Memo
//
//  Created by jasonwu on 4/25/16.
//  Copyright © 2016 jasonwu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JWMemoDetail : NSObject

#pragma mark 标题
@property (nonatomic, strong) NSString *title;
#pragma mark 创建时间
@property (nonatomic, strong) NSString *createTime;
#pragma mark 具体内容
@property (nonatomic,strong) NSString *detail;

#pragma mark 初始化方法
- (JWMemoDetail *)initWithTitle:(NSString *)title andCreateTime:(NSString *)createTime
                      andDetail:(NSString *)detail;
#pragma mark 静态初始化方法
+ (JWMemoDetail *)memoDetailWithTitle:(NSString *)title andCreateTime:(NSString *)createTime
                      andDetail:(NSString *)detail;

@end
