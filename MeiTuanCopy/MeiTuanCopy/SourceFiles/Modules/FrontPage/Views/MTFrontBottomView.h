//
//  MTFrontBottomView.h
//  MeiTuanCopy
//
//  Created by wangfeng on 16/1/27.
//  Copyright © 2016年 HustBroventure. All rights reserved.
//

#import "BaseView.h"

@interface MTFrontBottomView : BaseView
@property (nonatomic, copy) ClickBlock clickBlock;


@property (nonatomic, strong) UIButton* topButton;
@property (nonatomic, strong) UIButton* bottomButton;
@property (nonatomic, strong) UILabel* bottomLabel;
@end
