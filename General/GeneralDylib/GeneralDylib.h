//  weibo: http://weibo.com/xiaoqing28
//  blog:  http://www.alonemonkey.com
//
//  GeneralDylib.h
//  GeneralDylib
//
//  Created by David.Dai on 2019/7/5.
//  Copyright (c) 2019 david. All rights reserved.
//

#import <Foundation/Foundation.h>

#define INSERT_SUCCESS_WELCOME "               🎉!!！congratulations!!！🎉\n👍----------------insert dylib success----------------👍\n"

@interface CustomViewController

@property (nonatomic, copy) NSString* newProperty;

+ (void)classMethod;

- (NSString*)getMyName;

- (void)newMethod:(NSString*) output;

@end
