//
//  YMTabbarVC.m
//  YMMY
//
//  Created by apple on 2017/3/11.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "YMTabbarVC.h"
#import "YMChatViewController.h"
#import "YMLessonViewController.h"
#import "YMProfileTableViewController.h"
#import "YMBaseViewController.h"
#import "YMHomeViewController.h"
#import "YMNavgatinController.h"
#import "YMScoreViewController.h"
#import "PosTool.h"
#import "PosConst.h"
#import "UIColor+PosColor.h"
@interface YMTabbarVC ()

@end

@implementation YMTabbarVC

-(instancetype)init{
    if(self = [super init]){
        YMNavgatinController* home = [[YMNavgatinController alloc] initWithRootViewController:[[YMHomeViewController alloc] init]];
        
        YMNavgatinController* chat = [[YMNavgatinController alloc] initWithRootViewController:[[YMChatViewController alloc] init]];

        YMNavgatinController* score = [[YMNavgatinController alloc] initWithRootViewController:[[YMScoreViewController alloc] init]];

        
        YMNavgatinController* lesson = [[YMNavgatinController alloc] initWithRootViewController:[[YMLessonViewController alloc] init]];
        
        
        
        YMNavgatinController* profile = [[YMNavgatinController alloc] initWithRootViewController:[[YMProfileTableViewController alloc] init]];
        
        [self addChildViewController:home];
        [self addChildViewController:chat];
        [self addChildViewController:score];
        [self addChildViewController:lesson];
        [self addChildViewController:profile];
        
        NSArray* images = @[[UIImage imageNamed:@"home"],[UIImage imageNamed:@"chatting-2"],[UIImage imageNamed:@"achive"],[UIImage imageNamed:@"booke1"],[UIImage imageNamed:@"mine"]];
        NSArray* selectImages = @[[[UIImage imageNamed:@"home1"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal],[[UIImage imageNamed:@"chatting1"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal],[[UIImage imageNamed:@"achive1"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal],[[UIImage imageNamed:@"booke1"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal],[[UIImage imageNamed:@"mine1"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        NSArray* titles = @[@"首页",@"美聊",@"业绩",@"美课堂",@"我的"];
        for (NSInteger i = 0; i<self.childViewControllers.count; i++) {
            UITabBarItem* item = self.childViewControllers[i].tabBarItem;
            [item setImage:images[i]];
            [item setSelectedImage:selectImages[i]];
            [item setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12],NSForegroundColorAttributeName : [UIColor grayColor]} forState:UIControlStateNormal];
            [item setTitleTextAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:12],NSForegroundColorAttributeName : colorWithRGB(89, 220,224)} forState:UIControlStateSelected];
            [item setTitle:titles[i]];
        }

        
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
