//
//  JWNewMemoViewController.h
//  Memo
//
//  Created by jasonwu on 4/25/16.
//  Copyright © 2016 jasonwu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JWNewMemoProtocol.h"

@interface JWNewMemoViewController : UIViewController

//实现NewMemoProtocol协议的代理，上一级的viewController
@property (nonatomic) id<NewMemoProtocol> delegate;

@end
