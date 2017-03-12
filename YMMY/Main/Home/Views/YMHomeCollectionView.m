//
//  PosHomeCollectionView.m
//  YGJPos
//
//  Created by mac on 17/1/9.
//  Copyright © 2017年 HD. All rights reserved.
//

#import "YMHomeCollectionView.h"
#import "PosConst.h"
@implementation YMHomeCollectionView

+(instancetype)getViewWithNumberOfCols:(NSInteger)numberOfCols panding:(CGFloat)panding margin:(CGFloat)margin rowMargin:(CGFloat)rowMargin topMargin:(CGFloat)topMargin itemHeight:(CGFloat)itemHeight delegate:(id<UICollectionViewDelegate>)delegate dataSource:(id<UICollectionViewDataSource>)dataSource{
    
    UICollectionViewFlowLayout* layout = [[UICollectionViewFlowLayout alloc] init];
    YMHomeCollectionView *collectionView = [[YMHomeCollectionView alloc] initWithFrame:SCREEN_BOUNDS collectionViewLayout:layout];
    
    CGFloat itemWidth = (SCREEN_WIDTH - 2 * panding - (numberOfCols - 1) * margin) / numberOfCols;
    
    layout.itemSize = CGSizeMake(itemWidth, itemHeight);
    
    layout.minimumLineSpacing = rowMargin;
    
    layout.sectionInset = UIEdgeInsetsMake(topMargin, panding, margin, topMargin);
    
    collectionView.delegate = delegate;
    
    collectionView.dataSource = dataSource;
    
    collectionView.showsVerticalScrollIndicator = NO;
    
    collectionView.backgroundColor = COLOR_WHITE;
    
    return collectionView;
}




@end
