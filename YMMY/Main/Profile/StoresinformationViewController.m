//
//  StoresinformationViewController.m
//  YGJPos
//
//  Created by apple on 2017/3/10.
//  Copyright © 2017年 HD. All rights reserved.
//

#import "StoresinformationViewController.h"

@interface StoresinformationViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@end

@implementation StoresinformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"门店信息"];
    [self setUI];
    
}
-(void)setUI{
    
    UIView* headerView =[[UIView alloc]init];
    [self.view addSubview:headerView];
    headerView.backgroundColor=[UIColor colorWithHexString:@"F1F1F1" alpha:1];
    [headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(40);
    }];
    
    UILabel *nurLB=[[UILabel alloc]init];
    nurLB.text=@" 基本信息";
    nurLB.textColor=[UIColor colorWithHexString:@"0D0D0F" alpha:1];
    nurLB.font=[UIFont systemFontOfSize:14];
    [headerView addSubview:nurLB];
    [nurLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(25);
        make.centerY.mas_equalTo(headerView);
        
    }];
    
    
    self.tableView = [PosTool tableViewWithStyle:UITableViewStyleGrouped dataSource:self delegate:self];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.top.mas_equalTo(headerView.mas_bottom);
    }];

}

#pragma mark UITableViewDataSource/delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 7;
    }
    
    return 4;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* identifier = @"cell";
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        
        cell.separatorInset = UIEdgeInsetsMake(0, -20, 0, 0);
        
    }
    
    [self setCellWithIndexPath:indexPath cell:cell];
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section==1) {
        if (indexPath.row==1) {
            return 150;
        }if (indexPath.row==3) {
            return 80;
        }
    }
    return 60;
    
    
}

#pragma mark Cell
-(void)setCellWithIndexPath:(NSIndexPath*)indexPath cell:(UITableViewCell*)cell{
    cell.selectionStyle = UITableViewCellSeparatorStyleNone;
    if (indexPath.section==0) {
        if (indexPath.row<7) {
            

            NSArray* titleNames = @[@"门店名称",@"店铺简称",@"店铺城市",@"店铺地图选点",@"店铺详细地址",@"店铺电话",@"店铺面积"];
            UILabel* nameLB=[PosTool labelWithTextColr:@"0D0D0F" fontName:@"STHeitiSC-Light"fontSize:16 defaultText:titleNames[indexPath.row]];
             [cell.contentView addSubview:nameLB];
            [nameLB mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(20);
                make.centerY.mas_equalTo(0);
            }];
            
            
            NSArray* taoNames = @[@"某某某美容院",@"男 >",@"",@"请站在店内选点 >",@"星火路25号",@"18888888888",@"100 平方米"];
            UILabel* addLB=[PosTool labelWithTextColr:@"858585" fontName:@"STHeitiSC-Light"fontSize:16 defaultText:taoNames[indexPath.row]];
            [cell.contentView addSubview:addLB];
            [addLB mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(cell.mas_right).offset(-20);
                make.centerY.mas_equalTo(0);
            }];

        }
        
        
    }if (indexPath.section==1) {
        if (indexPath.row==0) {
            UILabel *nameLB=[[UILabel alloc]init];
            nameLB.text=@"营业执照正面";
            nameLB.textColor=[UIColor colorWithHexString:@"0D0D0F" alpha:1];
            nameLB.font=[UIFont systemFontOfSize:16];
            [cell.contentView addSubview:nameLB];
            [nameLB mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(20);
                make.centerY.mas_equalTo(cell);
            }];
            
            
            
        }if (indexPath.row==1) {
            UIButton *okButton=[UIButton buttonWithType:UIButtonTypeCustom];
            [okButton setBackgroundImage:[UIImage imageNamed:@"icon_q"] forState:UIControlStateNormal];
            [okButton addTarget:self action:@selector(okClick) forControlEvents:UIControlEventTouchUpInside];
            [cell.contentView addSubview:okButton];
            [okButton mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.centerY.mas_equalTo(cell);
                
            }];
        }if (indexPath.row==2) {
            UILabel *nubLB=[[UILabel alloc]init];
            nubLB.text=@"营业执照号";
            nubLB.textColor=[UIColor colorWithHexString:@"0D0D0F" alpha:1];
            nubLB.font=[UIFont systemFontOfSize:16];
            [cell.contentView addSubview:nubLB];
            [nubLB mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(20);
                make.centerY.mas_equalTo(cell);
            }];
            UILabel *nubLB2=[[UILabel alloc]init];
            nubLB2.text=@"******************";
            nubLB2.textColor=[UIColor colorWithHexString:@"858585" alpha:1];
            nubLB2.font=[UIFont systemFontOfSize:14];
            [cell.contentView addSubview:nubLB2];
            [nubLB2 mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(-20);
                make.centerY.mas_equalTo(cell);
            }];
            

        }if (indexPath.row==3) {
            UIButton *getoutButton=[UIButton buttonWithType:UIButtonTypeCustom];
            [getoutButton setBackgroundImage:[UIImage imageNamed:@"icon_but"] forState:UIControlStateNormal];
            [getoutButton addTarget:self action:@selector(getoutClick) forControlEvents:UIControlEventTouchUpInside];
            [cell.contentView addSubview:getoutButton];
            [getoutButton mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.centerY.mas_equalTo(cell);
                
            }];

        }
    }


}




-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    
    
}

-(void)okClick{
    POSLog(@"拍照");
}


-(void)getoutClick{
    POSLog(@"退出");
}

@end
