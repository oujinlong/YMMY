//
//  YMBaseViewController.h
//  YMMY
//
//  Created by apple on 2017/3/11.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PosConst.h"
#import "Masonry.h"
#import "PosTool.h"
#import "YMNavgatinController.h"
@interface YMBaseViewController : UIViewController
-(void)addRightItemWithImage:(UIImage*)image selector:(SEL)selector;

-(void)addRightItemWithTitle:(NSString*)title selector:(SEL)selector color:(UIColor*)color;

@end
