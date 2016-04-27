//
//  JWMemoAccount.h
//  Memo
//
//  Created by jasonwu on 4/25/16.
//  Copyright © 2016 jasonwu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JWMemoDetail;

@interface JWMemoAccount : NSObject

#pragma mark 账户名称
@property (nonatomic,strong) NSString *accountName;
#pragma mark 具体内容(标题、时间、内容)
@property (nonatomic,strong) NSMutableArray *memoDetail;

#pragma mark 初始化方法
- (JWMemoAccount *)initWithAccountName:(NSString *)accountName andDetail:(NSMutableArray *)detail;

#pragma mark 静态初始化方法
+ (JWMemoAccount *)memoAccountWithAccountName:(NSString *)accountName andDetail:(NSMutableArray *)detail;

@end
