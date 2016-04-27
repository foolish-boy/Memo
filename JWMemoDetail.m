//
//  JWMemoDetail.m
//  Memo
//
//  Created by jasonwu on 4/25/16.
//  Copyright © 2016 jasonwu. All rights reserved.
//

#import "JWMemoDetail.h"

@implementation JWMemoDetail

- (JWMemoDetail *)initWithTitle:(NSString *)title andCreateTime:(NSString *)createTime andDetail:(NSString *)detail {
    if (self = [super init]) {
        self.title = title;
        self.createTime = createTime;
        self.detail = detail;
    }
    return self;
}

+ (JWMemoDetail *) memoDetailWithTitle:(NSString *)title andCreateTime:(NSString *)createTime andDetail:(NSString *)detail {
    JWMemoDetail *memoDetail = [[JWMemoDetail alloc] initWithTitle:title andCreateTime:createTime andDetail:detail];
    return  memoDetail;
}

@end
