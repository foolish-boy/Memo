//
//  JWUpdateMemoProtocol.h
//  Memo
//
//  Created by jasonwu on 4/25/16.
//  Copyright © 2016 jasonwu. All rights reserved.
//

#ifndef JWUpdateMemoProtocol_h
#define JWUpdateMemoProtocol_h
#import <Foundation/Foundation.h>
#import "JWMemoDetail.h"
//这个协议在更新备忘录时调用
//由JWDetailMemoViewController指定，
//由JWContentViewController实现,
//两者之间保持一个委托的关系。
@protocol UpdateMemoProtocol

- (void) updateMemo:(JWMemoDetail *)memoData;

@end


#endif /* JWUpdateMemoProtocol_h */
