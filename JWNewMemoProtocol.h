//
//  JWNewMemoProtocol.h
//  Memo
//
//  Created by jasonwu on 4/25/16.
//  Copyright © 2016 jasonwu. All rights reserved.
//

#ifndef JWNewMemoProtocol_h
#define JWNewMemoProtocol_h
#import <Foundation/Foundation.h>
#import "JWMemoDetail.h"
//这个协议在新建备忘录时调用
//由JWNewMemoViewController指定，
//由JWContentViewController实现,
//两者之间保持一个委托的关系。
@protocol NewMemoProtocol

- (void) addNewMemo:(JWMemoDetail *)memoData;

@end

#endif /* JWNewMemoProtocol_h */
