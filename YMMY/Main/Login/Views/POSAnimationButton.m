//
//  PosLoginInputView.h
//  YGJPos
//
//  Created by mac on 17/1/10.
//  Copyright © 2017年 HD. All rights reserved.
//
#import "POSAnimationButton.h"
#import "POSCircleAnimationView.h"
static NSTimeInterval startDuration = 0.3;
static NSTimeInterval endDuration = 0.5;
@interface POSAnimationButton ()
@property (nonatomic, strong) POSCircleAnimationView* circleView;
@property (nonatomic, assign) CGRect origionRect;
@end
@implementation POSAnimationButton
- (POSCircleAnimationView *)circleView
{
    if (!_circleView) {
        _circleView = [POSCircleAnimationView viewWithButton:self];
        [self addSubview:_circleView];
    }
    return _circleView;
}

+(instancetype)buttonWithFrame:(CGRect)frame{
    POSAnimationButton* button = [POSAnimationButton buttonWithType:UIButtonTypeCustom];
    
    button.frame = frame;
    button.layer.cornerRadius = frame.size.height / 2;
    button.layer.masksToBounds = YES;
    button.clipsToBounds = NO;
    button.origionRect = button.frame;
    return button;
}


-(void)setborderColor:(UIColor *)color{
    self.layer.borderColor = color.CGColor;
}

-(void)setborderWidth:(CGFloat)width{
    self.layer.borderWidth = width;
}



-(void)startAnimation{
    CGPoint center = self.center;
    CGFloat width = self.layer.cornerRadius * 2;
    CGFloat height = self.frame.size.height;
    CGRect desFrame = CGRectMake(center.x - width / 2, center.y - height / 2, width, height);

    self.userInteractionEnabled = NO;
    
   

    [UIView animateWithDuration:startDuration animations:^{
        self.titleLabel.alpha = .0f;
        self.frame = desFrame;
    } completion:^(BOOL finished) {
        if ([self.delegate respondsToSelector:@selector(POSAnimationButtonDidStartAnimation:)]) {
            [self.delegate POSAnimationButtonDidStartAnimation:self];
        }
        [self.circleView startAnimation];
    }];
}

-(void)stopAnimation{
    self.userInteractionEnabled = YES;
    
    
        if ([self.delegate respondsToSelector:@selector(POSAnimationButtonWillFinishAnimation:)]) {
            [self.delegate POSAnimationButtonWillFinishAnimation:self];
        }
        
        [self.circleView removeFromSuperview];
        self.circleView = nil;
        [UIView animateWithDuration:endDuration animations:^{
            self.frame = self.origionRect;
            self.titleLabel.alpha = 1.0f;
        } completion:^(BOOL finished) {
            if ([self.delegate respondsToSelector:@selector(POSAnimationButtonDidFinishAnimation:)]) {
                [self.delegate POSAnimationButtonDidFinishAnimation:self];
            }
        }];
    
}
@end
