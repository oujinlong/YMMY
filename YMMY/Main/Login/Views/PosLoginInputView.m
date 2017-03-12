//
//  PosLoginInputView.m
//  YGJPos
//
//  Created by mac on 17/1/10.
//  Copyright © 2017年 HD. All rights reserved.
//

#import "PosLoginInputView.h"
@interface PosLoginInputView () <UITextFieldDelegate>
@property (nonatomic, strong) UITextField* TF;
@property (nonatomic, assign) BOOL isPassword;

@end
@implementation PosLoginInputView

+(instancetype)inputViewWithImage:(NSString *)imageName placeHolder:(NSString *)placeHolder isPassword:(BOOL)isPassword{
    
    PosLoginInputView* view = [[PosLoginInputView alloc] init];
    view.isPassword = isPassword;
    
    UIImageView* imageView = [PosTool imageViewWithImageName:imageName addOnSuperView:view];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(18, 18));
    }];
    
    
    UIImageView* lineImageView = [PosTool imageViewWithImageName:@"verticalline_login" addOnSuperView:view];
    [lineImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(imageView.mas_right).offset(15);
        make.top.bottom.mas_equalTo(imageView);
        make.width.mas_equalTo(1);
    }];
    
    
    view.TF = [PosTool textFieldWithTextColor:@"FFFFFF" font:@"STHeitiSC-Light" fontSize:14 placeHolder:placeHolder];
    view.TF.text = placeHolder;
    view.TF.tintColor = [UIColor colorWithHexString:@"FFFFFF" alpha:1.0];
    view.TF.delegate = view;
    view.TF.clearButtonMode = UITextFieldViewModeWhileEditing;
    [view addSubview:view.TF];
    [view.TF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(lineImageView.mas_right).offset(15);
        make.right.mas_equalTo(0);
        make.centerY.mas_equalTo(lineImageView);
    }];
    
    UIView* lineImageView2 = [PosTool imageViewWithImageName:@"verticalline_line_" addOnSuperView:view];
    [lineImageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(1);
    }];
    
    return view;

}

-(UITextField*)getTextField{
    return self.TF;
}
#pragma mark UITextFieldDelegate
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    if ([textField.text isEqualToString:textField.placeholder]) {
        textField.text = @"";
    }
    
    if (self.isPassword){
        textField.secureTextEntry = YES;
    }
    
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    if (textField.text.length == 0 || textField.text == nil){
        textField.text = textField.placeholder;
        if (self.isPassword){
            textField.secureTextEntry = NO;
        }
    }
}
@end
