//
//  PosConst.h
//  YGJPos
//
//  Created by mac on 17/1/9.
//  Copyright © 2017年 HD. All rights reserved.
//
// 弱引用
#import <UIKit/UIKit.h>
#define MJWeakSelf __weak typeof(self) weakSelf = self;

// 日志输出
#ifdef DEBUG
#define POSLog(...) NSLog(__VA_ARGS__)
#else
#define POSLog(...)
#endif

// 过期提醒
#define POSDeprecated(instead) NS_DEPRECATED(2_0, 2_0, 2_0, 2_0, instead)

// 运行时objc_msgSend
#define POSMsgSend(...) ((void (*)(void *, SEL, UIView *))objc_msgSend)(__VA_ARGS__)
#define POSMsgTarget(target) (__bridge void *)(target)

// RGB颜色
#define POSColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define colorWithRGB(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]

// 文字颜色
#define POSLabelTextColor POSColor(90, 90, 90)

// 字体大小
#define POSLabelFont [UIFont boldSystemFontOfSize:14]



// 常量
//UIKIT_EXTERN const CGFloat POSScreenWidth;

//屏幕
#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height
#define SCREEN_BOUNDS [[UIScreen mainScreen] bounds]

//颜色设定
#define COLOR_WHITE POSColor(255, 255, 255)

// 状态检查
#define POSCheckState \
POSState oldState = self.state; \
if (state == oldState) return; \
[super setState:state];
