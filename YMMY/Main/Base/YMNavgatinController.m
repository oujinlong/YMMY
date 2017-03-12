//
//  YMNavgatinController.m
//  YMMY
//
//  Created by apple on 2017/3/11.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "YMNavgatinController.h"
#import "PosConst.h"
@interface YMNavgatinController () <UINavigationControllerDelegate>

@end

@implementation YMNavgatinController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"icon_di"] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    self.delegate = self;
    
    self.navigationBar.shadowImage = [UIImage new];
}


-(void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (viewController != self.childViewControllers[0]){
        UIBarButtonItem* item = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"icon_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(back)];
        viewController.navigationItem.leftBarButtonItem = item;
    }
}

-(void)back{
    [self popViewControllerAnimated:YES];
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
