//
//  MTTopCollectionView.h
//  MeiTuanCopy
//
//  Created by wangfeng on 16/1/27.
//  Copyright © 2016年 HustBroventure. All rights reserved.
//

#import "BaseView.h"

@interface MTTopCollectionView : BaseView <UICollectionViewDelegate,UICollectionViewDataSource>


@property (nonatomic, copy) ClickBlock clickBlock;

@property (nonatomic, strong) UIPageControl* page;
@property (nonatomic, strong) UICollectionView* collectionView;
@property (nonatomic, strong) UIView* lineView;
@property (nonatomic, strong) NSArray* titleArray;
@property (nonatomic, strong) NSArray* imageArray;

@end
@interface HBCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UIImageView* topImageView;
@property (nonatomic, strong) UILabel* bottomLabel;
@end