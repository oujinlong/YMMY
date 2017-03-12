//
//  PosLoginInputView.h
//  YGJPos
//
//  Created by mac on 17/1/10.
//  Copyright © 2017年 HD. All rights reserved.
//

#import "PosBaseView.h"

@interface PosLoginInputView : PosBaseView
+(instancetype)inputViewWithImage:(NSString*)imageName placeHolder:(NSString*)placeHolder isPassword:(BOOL)isPassword;
-(UITextField*)getTextField;
@end
