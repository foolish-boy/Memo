//
//  AppDelegate.h
//  Memo
//
//  Created by jasonwu on 4/22/16.
//  Copyright © 2016 jasonwu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JWHomeViewContronller;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *navViewController;
@property (strong, nonatomic) JWHomeViewContronller *homeViewController;


@end

