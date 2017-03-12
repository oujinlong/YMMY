//
//  POSAnimationButton
//  YGJPos
//
//  Created by mac on 17/1/10.
//  Copyright © 2017年 HD. All rights reserved.
//


#import <UIKit/UIKit.h>

@class POSAnimationButton;
@protocol POSAnimationButtonDelegate <NSObject>
/**
 *  动画开始回调
 *
 *  @param POSAnimationButton self
 */
-(void)POSAnimationButtonDidStartAnimation:(POSAnimationButton*)POSAnimationButton;

/**
 *  动画已经结束时回调
 *
 *  @param POSAnimationButton self
 */
-(void)POSAnimationButtonDidFinishAnimation:(POSAnimationButton *)POSAnimationButton;

/**
 *  动画将要结束时回调  即 结束动画未执行时
 *
 *  @param POSAnimationButton self
 */
-(void)POSAnimationButtonWillFinishAnimation:(POSAnimationButton *)POSAnimationButton;

@end
@interface POSAnimationButton : UIButton
/**
 *  创建对象
 *
 *  @param frame
 *
 *  @return 对象
 */
+(instancetype)buttonWithFrame:(CGRect)frame;
/**
 *  边缘色
 *
 *  @param color
 */
-(void)setborderColor:(UIColor*)color;
/**
 *  边缘宽度
 *
 *  @param width
 */
-(void)setborderWidth:(CGFloat)width;
/**
 *  手动调用执行动画  一般在 button 的响应里调用  调用后会走代理进行回调
 */
-(void)startAnimation;
/**
 *  手动停止动画 停止前和停止后会走代理回调
 */
-(void)stopAnimation;
/**
 *  代理对象
 */
@property (nonatomic, weak) id <POSAnimationButtonDelegate> delegate;
@end
