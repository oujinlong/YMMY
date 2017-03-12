//
//  PosHomeViewController.m
//  YGJPos
//
//  Created by mac on 17/1/9.
//  Copyright © 2017年 HD. All rights reserved.
//
#import "YMHomeViewController.h"
#import "YMHomeCollectionView.h"
#import "YMHomeCollectionViewCell.h"
#import "AFNetworking.h"


@interface YMHomeViewController () <UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong) YMHomeCollectionView * collectionView;
@end
static  NSString* identifier = @"homeCell";
@implementation YMHomeViewController

-(instancetype)init{
    if(self = [super init ]){
        
    }
    
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

    self.tabBarController.tabBar.hidden = NO;
    
    
}


-(void)viewDidLoad{
    [super viewDidLoad];
    
    [self setupMain];
}


-(void)setupMain{
    self.title = @"云猫美业";
    
    self.view.backgroundColor = colorWithRGB(246, 247, 248);
    
    [self addRightItemWithImage:[[UIImage imageNamed:@"nav_message"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selector:@selector(messageClick)];
    
    
    
    UIImageView* topBgImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_di"]];
    [self.view addSubview:topBgImageView];
    [topBgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(0);
        make.height.mas_equalTo(86);
    }];
    
    
    UIButton* iconButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [iconButton setBackgroundImage:[UIImage imageNamed:@"home_icon"] forState:UIControlStateNormal];
    [self.view addSubview:iconButton];
    [iconButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.top.mas_equalTo(17);
        make.size.mas_equalTo(CGSizeMake(54, 54));
    }];
    
    UILabel* nameLB = [PosTool labelWithTextColr:@"FFFFFF" fontName:@"PingFangSC-Regular" fontSize:16 defaultText:@"云猫美业服务"];
    [self.view addSubview:nameLB];
    [nameLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(iconButton.mas_right).offset(8);
        make.top.mas_equalTo(iconButton.mas_top).offset(4);
    }];
    
    UILabel* sbuTitleLB = [PosTool labelWithTextColr:@"FFFFFF" fontName:@"PingFangSC-Regular" fontSize:14 defaultText:@"王泽亚： 老板  账号： 138138138138138"];
    [self.view addSubview:sbuTitleLB];
    [sbuTitleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(nameLB);
        make.top.mas_equalTo(nameLB.mas_bottom).offset(2);
    }];
    
    
    self.collectionView = [YMHomeCollectionView getViewWithNumberOfCols:3 panding:15 margin:15 rowMargin:25 topMargin:15 itemHeight:80 delegate:self dataSource:self];
    [self.view addSubview:self.collectionView];
    [self.collectionView registerNib:[UINib nibWithNibName:@"UICollectionViewDelegate" bundle:nil] forCellWithReuseIdentifier:identifier];

    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(topBgImageView.mas_bottom).offset(10);
        make.bottom.mas_equalTo(0);
    }];
    
}
#pragma mark action
-(void)messageClick{
    NSLog(@"%@",@"messageClick");
}

#pragma mark collectionView data source delegate
#pragma mark UICollectionViewDelegate
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 9;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    YMHomeCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    NSArray* imageNameArray = @[@"Group news",@"icon_2",@"icon_3",@"icon_4",@"icon_5",@"icon_10",@"icon_7",@"icon_8",@"icon_9",@"Group news"];
    
    NSArray* titleArray = @[@"今日上班员工",@"今日0单员工",@"员工日报",@"本月已完成",@"本月未完成",@"本店日程",@"目标计划",@"档案管理",@"收入报表"];
    
    [cell setupWithImageName:imageNameArray[indexPath.item] title:titleArray[indexPath.item]];
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    POSLog(@"%zd", indexPath.item);
    UIViewController* vc = nil;

//    if (indexPath.item == 0){
//        vc = [[PosCommdityViewController alloc] init];
//        
//    }else if (indexPath.item == 1){
//        vc = [[PosQuickCashViewController alloc] init];
//        
//        
//    }else if (indexPath.item == 2){
//        vc = [[PosActivityViewController alloc] init];
//        
//    }else if (indexPath.item == 3){
//        vc = [[PosVipRegistViewController alloc] init];
//        
//    }else if (indexPath.item == 4){
//        vc = [[PosOrderRefundViewController alloc] init];
//        
//    }else if (indexPath.item == 5){
//        vc = [[PosDayCashViewController alloc] init];
//        
//    }else if (indexPath.item == 6){
//        vc = [[PosVipQueryViewController alloc] init];
//    }else if (indexPath.item == 7){
//        vc = [[PosHandoverViewController alloc] init];
//    }else{
//        vc = [[PosSystemSetViewController alloc] init];
//    }
    
    
    if(vc){
        [self.navigationController pushViewController:vc animated:YES];
        self.tabBarController.tabBar.hidden = YES;
    }
    
}
@end
