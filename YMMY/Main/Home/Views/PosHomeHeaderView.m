//
//  PosHomeHeaderView.m
//  YGJPos
//
//  Created by mac on 17/1/9.
//  Copyright © 2017年 HD. All rights reserved.
//

#import "PosHomeHeaderView.h"
#import "PosTool.h"
@implementation PosHomeHeaderView

-(instancetype)init{
    if (self == [super init]){
    
        
        
        UIImageView* bgImageView = [PosTool imageViewWithImageName:@"Rectangle 4"];

        [self addSubview:bgImageView];
        
        [bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.bottom.mas_equalTo(0);
        }];
        
        
    
        
        
        UIImageView* iconImageView = [PosTool imageViewWithImageName:@"logo_home"];
        [self addSubview:iconImageView];
        [iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(120);
            make.left.mas_offset(15);
            make.size.mas_equalTo(CGSizeMake(100, 100));
        }];
        
        [iconImageView layoutIfNeeded];
        iconImageView.layer.cornerRadius = iconImageView.bounds.size.width/2;
        iconImageView.layer.masksToBounds = YES;
        
    
        UILabel* nameLB = [PosTool labelWithTextColr:@"#FFFFFF" fontName:@"STHeitiSC-Medium" fontSize:18 defaultText:@"王泽亚：老板  账号：17714836975"];
        [self addSubview:nameLB];
        
        [nameLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(180);
            make.left.mas_equalTo(iconImageView.mas_right).offset(5);
        }];
        
        UILabel *titelLB=[[UILabel alloc]init];
        titelLB.text=@"羽西服务机构";
        titelLB.font=[UIFont systemFontOfSize:20];
        titelLB.textColor=[UIColor colorWithHexString:@"FFFFFF" alpha:1];
        [self addSubview:titelLB];
        [titelLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(iconImageView.mas_right).offset(5);
            make.bottom.mas_equalTo(nameLB.mas_top).offset(-20);
        }];
        
        UIView* locationView = [PosTool viewWithBackgroundColor:@"" alpha:0.15];
        [self addSubview:locationView];
        [locationView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.top.mas_equalTo(nameLB.mas_bottom).offset(5);
            make.size.mas_equalTo(CGSizeMake(85, 19));
        }];
        locationView.layer.cornerRadius = 8;
        locationView.layer.masksToBounds = YES;
        
        
        UIImageView* locationImageView = [PosTool imageViewWithImageName:@""];
        [locationView addSubview:locationImageView];
        [locationImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.top.mas_equalTo(4);
            make.bottom.mas_equalTo(-4);
            make.width.mas_equalTo(12);
        }];
        
        UILabel* locationLB = [PosTool labelWithTextColr:@"FFFFFF" fontName:@"STHeitiSC-Light" fontSize:11 defaultText:@""];
        [locationView addSubview:locationLB];
        
        [locationLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(locationImageView);
            make.left.mas_equalTo(locationImageView.mas_right).offset(5);
        }];
    }
    return self;
}
@end
