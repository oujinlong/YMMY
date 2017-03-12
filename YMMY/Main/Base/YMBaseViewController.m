//
//  YMBaseViewController.m
//  YMMY
//
//  Created by apple on 2017/3/11.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "YMBaseViewController.h"

@interface YMBaseViewController ()

@end

@implementation YMBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)addRightItemWithImage:(UIImage *)image selector:(SEL)selector{
    UIBarButtonItem* item = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStyleDone target:self action:selector];
    self.navigationItem.rightBarButtonItem = item;
}

-(void)addRightItemWithTitle:(NSString *)title selector:(SEL)selector color:(UIColor *)color{
    UIBarButtonItem* item = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStyleDone target:self action:selector];
    self.navigationItem.rightBarButtonItem = item;
    item.tintColor = color;
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
