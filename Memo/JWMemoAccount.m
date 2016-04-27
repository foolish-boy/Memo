//
//  JWMemoAccount.m
//  Memo
//
//  Created by jasonwu on 4/25/16.
//  Copyright © 2016 jasonwu. All rights reserved.
//

#import "JWMemoAccount.h"


@implementation JWMemoAccount

- (JWMemoAccount *)initWithAccountName:(NSString *)accountName andDetail:(NSMutableArray *)detail {
    if (self = [super init]) {
        self.accountName = accountName;
        self.memoDetail = detail;
    }
    return  self;
}

+ (JWMemoAccount *)memoAccountWithAccountName:(NSString *)accountName andDetail:(NSMutableArray *)detail  {
    JWMemoAccount *acc = [[JWMemoAccount alloc] initWithAccountName:accountName andDetail:detail];
    return acc;
}

@end
