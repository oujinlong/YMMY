//
//  YMProfileTableViewController.m
//  YMMY
//
//  Created by apple on 2017/3/11.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "YMProfileTableViewController.h"
#import "StoresinformationViewController.h"
#import "EmployeesViewController.h"
#import "MybillViewController.h"
@interface YMProfileTableViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *tableView;

@end

@implementation YMProfileTableViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.tabBarController.tabBar.hidden = NO;
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
    
}


-(void)setUI{
    self.view.backgroundColor = colorWithRGB(246, 247, 248);

    self.tableView = [PosTool tableViewWithStyle:UITableViewStyleGrouped dataSource:self delegate:self];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.top.mas_equalTo(0);
    }];
    
    
    
    
    
}



#pragma mark UITableViewDataSource/delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 1;
    }
    return 12;
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
    if (indexPath.section==0) {
        return 80;
    }
    return 60;
}


#pragma mark Cell
-(void)setCellWithIndexPath:(NSIndexPath*)indexPath cell:(UITableViewCell*)cell{
    cell.selectionStyle = UITableViewCellSeparatorStyleNone;
    if (indexPath.section==0) {
        if (indexPath.row==0) {
            
            UIImageView* imageView = [PosTool imageViewWithImageName:@"icon_di"];
            [cell.contentView addSubview:imageView];
            [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.top.right.mas_equalTo(0);
                make.center.mas_equalTo(cell);
            }];
            UIButton* iconButton = [UIButton buttonWithType:UIButtonTypeCustom];
            [iconButton setBackgroundImage:[UIImage imageNamed:@"home_icon"] forState:UIControlStateNormal];
            [imageView addSubview:iconButton];
            [iconButton mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(20);
                make.centerY.mas_equalTo(0);
                make.size.mas_equalTo(CGSizeMake(50, 50));
            }];
            
            UILabel* titleLB = [PosTool labelWithTextColr:@"FFFFFF" fontName:@"PingFangSC-Regular" fontSize:16 defaultText:@"云猫美业服务"];
            [imageView addSubview:titleLB];
            [titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(iconButton.mas_right).offset(8);
                make.top.mas_equalTo(10);
            }];
            
            UILabel* sbuTitleLB = [PosTool labelWithTextColr:@"ffffff" fontName:@"PingFangSC-Regular" fontSize:14 defaultText:@"当前登录人： 王泽亚"];
            [imageView addSubview:sbuTitleLB];
            [sbuTitleLB mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(titleLB);
                make.top.mas_equalTo(titleLB.mas_bottom).offset(2);
            }];
            UILabel* phoneLB = [PosTool labelWithTextColr:@"ffffff" fontName:@"PingFangSC-Regular" fontSize:14 defaultText:@"账号：18888888888"];
            [imageView addSubview:phoneLB];
            [phoneLB mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(titleLB);
                make.top.mas_equalTo(sbuTitleLB.mas_bottom).offset(2);
            }];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

            
        }
        
    }if (indexPath.section==1) {
        if (indexPath.row<12) {
            NSArray* imageNames = @[@"icon_name6",@"icon_name5",@"icon_name4",@"icon_name12",@"icon_name11",@"icon_name3",@"icon_name10",@"icon_name9",@"icon_name8",@"icon_name2",@"icon_name7",@"icon_name1"];
            UIImageView* imageView = [PosTool imageViewWithImageName:imageNames[indexPath.row]];
            [cell.contentView addSubview:imageView];
            [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(20);
                make.centerY.mas_equalTo(0);
            }];
            
            NSArray* holders = @[@"门店信息",@"门店员工",@"我的账单",@"我的银行卡",@"修改密码",@"意见反馈",@"我的二维码",@"我的评价",@"我的收藏",@"工作总结",@"清楚缓存",@"关于我们"];
            UILabel* nameLB=[PosTool labelWithTextColr:@"0D0D0F" fontName:@"STHeitiSC-Light"fontSize:16 defaultText:holders[indexPath.row]];
            [cell.contentView addSubview:nameLB];
            [nameLB mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(imageView.mas_right).offset(20);
                make.centerY.mas_equalTo(0);
            }];
            
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            
        }
    }
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section==0) {
        
    }else{
        if (indexPath.section==1) {
            if (indexPath.row==0) {
                StoresinformationViewController *vc=[[StoresinformationViewController alloc]init];
                [self.navigationController pushViewController:vc animated:YES];
                
            }else if (indexPath.row==1){
                EmployeesViewController *VC=[[EmployeesViewController alloc]init];
                [self.navigationController pushViewController:VC animated:YES];
            }else if (indexPath.row==2){
                MybillViewController *vc=[[MybillViewController alloc]init];
//                vc.navigationController.navigationBarHidden = YES;
                [self.navigationController pushViewController:vc animated:YES];
            }
        }
    }
    self.tabBarController.tabBar.hidden = YES;

    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
