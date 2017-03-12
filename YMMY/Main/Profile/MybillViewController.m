//
//  MybillViewController.m
//  YGJPos
//
//  Created by apple on 2017/3/10.
//  Copyright © 2017年 HD. All rights reserved.
//

#import "MybillViewController.h"

@interface MybillViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@end

@implementation MybillViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.backgroundColor = [UIColor greenColor];
    
    
    [self setTitle:@"我的账单"];
    [self setUI];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    self.navigationController.navigationBarHidden = YES;

}

-(void)setUI{
    
    self.tableView = [PosTool tableViewWithStyle:UITableViewStyleGrouped dataSource:self delegate:self];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.top.mas_equalTo(0);
    }];
   
    
    
}

#pragma mark UITableViewDataSource/delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return 7;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* identifier = @"cell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
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
    if (indexPath.row==0) {
        return 200;
    }
    return 60;
}


#pragma mark Cell
-(void)setCellWithIndexPath:(NSIndexPath*)indexPath cell:(UITableViewCell*)cell{
    cell.selectionStyle = UITableViewCellSeparatorStyleNone;
    if (indexPath.row==0) {
        UIImageView* imageView = [PosTool imageViewWithImageName:@"icon11_p"];
        [cell.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.mas_equalTo(0);
            make.height.mas_equalTo(200);
        }];
        
        
        UILabel *nameLB=[[UILabel alloc]init];
        nameLB.text=@"可体现金额 （元）";
        nameLB.textColor=[UIColor colorWithHexString:@"ffffff" alpha:1];
        nameLB.font=[UIFont systemFontOfSize:18];
        [imageView addSubview:nameLB];
        [nameLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(20);
            make.top.mas_equalTo(40);
        }];
        UILabel *moneyLB=[[UILabel alloc]init];
        moneyLB.text=@"100.00";
        moneyLB.textColor=[UIColor colorWithHexString:@"ffffff" alpha:1];
        moneyLB.font=[UIFont systemFontOfSize:40];
        [imageView addSubview:moneyLB];
        [moneyLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(20);
            make.centerY.mas_equalTo(0);
        }];
        
        UIImageView* imageView2 = [PosTool imageViewWithImageName:@"icon_yin"];
        [imageView addSubview:imageView2];
        [imageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(0);
            
        }];
        
        UIButton *tiButton=[UIButton buttonWithType:UIButtonTypeCustom];
        [tiButton setBackgroundImage:[UIImage imageNamed:@"icon_noe"] forState:UIControlStateNormal];
        [tiButton addTarget:self action:@selector(tiButtonClick) forControlEvents:UIControlEventTouchUpInside];
        imageView.userInteractionEnabled = YES;
        [imageView addSubview:tiButton];
        [tiButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(imageView.mas_right).offset(-20);
            make.centerY.mas_equalTo(0);
            
        }];
        
        
        UILabel *carryLB=[[UILabel alloc]init];
        carryLB.text=@"余额 （元）";
        carryLB.textColor=[UIColor colorWithHexString:@"#FFD6E1" alpha:1];
        carryLB.font=[UIFont systemFontOfSize:14];
        [imageView addSubview:carryLB];
        [carryLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(nameLB);
            make.bottom.mas_equalTo(-30);
        }];

        UILabel *withdrawalLB=[[UILabel alloc]init];
        withdrawalLB.text=@"可提现余额 （元）";
        withdrawalLB.textColor=[UIColor colorWithHexString:@"#FFD6E1" alpha:1];
        withdrawalLB.font=[UIFont systemFontOfSize:14];
        [imageView addSubview:withdrawalLB];
        [withdrawalLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-50);
            make.bottom.mas_equalTo(-30);
        }];

        UILabel *numberLB=[[UILabel alloc]init];
        numberLB.text=@"60000";
        numberLB.textColor=[UIColor colorWithHexString:@"#ffffff" alpha:1];
        numberLB.font=[UIFont systemFontOfSize:18];
        [imageView addSubview:numberLB];
        [numberLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(carryLB).offset(-30);
            make.top.mas_equalTo(carryLB.mas_bottom).offset(5);
        }];
        
        
        UILabel *withdrawlLB=[[UILabel alloc]init];
        withdrawlLB.text=@"1000";
        withdrawlLB.textColor=[UIColor colorWithHexString:@"#ffffff" alpha:1];
        withdrawlLB.font=[UIFont systemFontOfSize:18];
        [imageView addSubview:withdrawlLB];
        [withdrawlLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(withdrawalLB).offset(-30);
            make.top.mas_equalTo(withdrawalLB.mas_bottom).offset(5);
        }];
        
    }else if (indexPath.row==1){
        UILabel* detailLB=[[UILabel alloc]init];
        detailLB.text=@"所有明细";
        detailLB.textColor=[UIColor colorWithHexString:@"0D0D0F" alpha:1];
        detailLB.font=[UIFont systemFontOfSize:14];
        [cell.contentView addSubview:detailLB];
        [detailLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.centerY.mas_equalTo(0);
        }];
        
        UILabel *nubLB=[[UILabel alloc]init];
        nubLB.text=@"2016-05";
        nubLB.textColor=[UIColor colorWithHexString:@"0D0D0F" alpha:1];
        nubLB.font=[UIFont systemFontOfSize:14];
        [cell.contentView addSubview:nubLB];
        [nubLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-20);
            make.centerY.mas_equalTo(0);
        }];

        
        UIImageView* lieimageView = [PosTool imageViewWithImageName:@"icon_liebiao"];
        [cell.contentView addSubview:lieimageView];
        [lieimageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(nubLB.mas_left).offset(-10);
            make.centerY.mas_equalTo(0);

        }];
        
        
    }else if (indexPath.row<6){
        
        
        NSArray* titleNames = @[@"",@"",@"收入",@"提现",@"收入",@"提现"];
        UILabel* nameLB=[PosTool labelWithTextColr:@"0D0D0F" fontName:@"STHeitiSC-Light"fontSize:16 defaultText:titleNames[indexPath.row]];
        [cell.contentView addSubview:nameLB];
        [nameLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(20);
            make.top.mas_equalTo(10);
        }];
        
        NSArray* timeNames = @[@"",@"",@"2013-03-08 12:03",@"2013-03-08 12:03",@"2013-03-08 12:03",@"2013-03-08 12:03"];
        UILabel* timeLB=[PosTool labelWithTextColr:@"929292" fontName:@"STHeitiSC-Light"fontSize:14 defaultText:timeNames[indexPath.row]];
        [cell.contentView addSubview:timeLB];
        [timeLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(20);
            make.bottom.mas_equalTo(cell.mas_bottom).offset(-5);
        }];

        
        
        NSArray* taoNames = @[@"",@"",@"+100.00",@"-100.00",@"+100.00",@"-100.00"];
        UILabel* addLB=[PosTool labelWithTextColr:@"0D0D0F" fontName:@"STHeitiSC-Light"fontSize:16 defaultText:taoNames[indexPath.row]];
        [cell.contentView addSubview:addLB];
        [addLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(cell.mas_right).offset(-20);
            make.centerY.mas_equalTo(0);
        }];
        

        
        
    }
    
    
    
    
   
    
    
    
}



-(void)tiButtonClick{
    POSLog(@"立即提现");
    
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction * action = [UIAlertAction actionWithTitle:@"收入" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    
    }];
    [alert addAction:action];
    UIAlertAction * action1= [UIAlertAction actionWithTitle:@"提现" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alert addAction:action1];
    UIAlertAction * action2 = [UIAlertAction actionWithTitle:@"所有明细" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alert addAction:action2];
    UIAlertAction * action3 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alert addAction:action3];
    [self presentViewController:alert animated:YES completion:^{
        
    }];
    
}
@end
