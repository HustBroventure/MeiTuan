//
//  MTFrontTableViewCell.h
//  MeiTuanCopy
//
//  Created by wangfeng on 16/1/27.
//  Copyright © 2016年 HustBroventure. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MTFrontTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView* leftImageView;
@property (nonatomic, strong) UILabel* titleLabel;
@property (nonatomic, strong) UILabel* distanceLabel;
@property (nonatomic, strong) UILabel* descLabel;
@property (nonatomic, strong) UILabel* priceLabel;
@property (nonatomic, strong) UILabel* soldLabel;
    //可选
@property (nonatomic, strong) UILabel* priceInfolabel;
@property (nonatomic, strong) UILabel* priceNormalLabel;

@end
