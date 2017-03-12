//
//  PosHomeCollectionView.h
//  YGJPos
//
//  Created by mac on 17/1/9.
//  Copyright © 2017年 HD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YMHomeCollectionView : UICollectionView

/**
 创建 CollectionView 对象

 @param numberOfCols 列数
 @param panding 左右外边距距离
 @param margin 左右内边距距离
 @param rowMargin 上下内边距距离
 @param topMargin 上下外边距距离
 @param itemHeight item高度
 @param delegate 代理
 @param dataSource 数据源代理
 @return collectionview 本类对象
 */
+(instancetype)getViewWithNumberOfCols:(NSInteger)numberOfCols panding:(CGFloat)panding margin:(CGFloat)margin rowMargin:(CGFloat)rowMargin topMargin:(CGFloat)topMargin itemHeight:(CGFloat)itemHeight delegate:(id<UICollectionViewDelegate>)delegate dataSource:(id<UICollectionViewDataSource>)dataSource;


@end
