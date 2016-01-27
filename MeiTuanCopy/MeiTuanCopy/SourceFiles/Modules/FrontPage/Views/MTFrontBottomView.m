//
//  MTFrontBottomView.m
//  MeiTuanCopy
//
//  Created by wangfeng on 16/1/27.
//  Copyright © 2016年 HustBroventure. All rights reserved.
//

#import "MTFrontBottomView.h"

@implementation MTFrontBottomView
{
    CGFloat _width;
    CGFloat _height;
    
}
- (instancetype)init
{
    if (self = [super init]) {
        _width = [UIScreen mainScreen].bounds.size.width;
        _height = 170;
        self.backgroundColor = [UIColor lightGrayColor];
            //tableViewde footView,不需要设置width
        self.bounds = CGRectMake(0, 0, 0, _height);
        [self initSubView];

    }
    return self;
}
-(void)initSubView
{
    [self addSubview:self.topButton];
    [self.topButton makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.right.equalTo(self).offset(-10);
        make.top.equalTo(self).offset(10);
        make.height.equalTo(35);

    }];
    UIView* contentView = [UIView new];
    contentView.backgroundColor = [UIColor whiteColor];
    contentView.layer.cornerRadius = 2;
    contentView.layer.masksToBounds = YES;
    [self addSubview:contentView];
    [contentView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.topButton.bottom).offset(10);
        make.right.equalTo(self).offset(-10);
        make.left.equalTo(self).offset(10);
        make.bottom.equalTo(self).offset(-10);

    }];
    
    [contentView addSubview:self.bottomLabel];
    [contentView addSubview:self.bottomButton];
    [self.bottomLabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(contentView).offset(10);
        make.right.equalTo(contentView).offset(-10);
        make.top.equalTo(contentView).offset(10);
        make.height.equalTo(40);

    }];
    [self.bottomButton makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(contentView).offset(10);
        make.right.equalTo(contentView).offset(-10);
        make.top.equalTo(self.bottomLabel.bottom).offset(10);
        make.height.equalTo(35);
    }];
}
- (void)buttonClicick:(UIButton*)sender
{
    
}
-(UIButton *)topButton
{
    if (!_topButton) {
        _topButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _topButton.backgroundColor = [UIColor whiteColor];
        [_topButton setTitle:@"查看全部团购" forState:UIControlStateNormal];
        [_topButton setTitleColor:BASE_STYLE_COLOR forState:UIControlStateNormal];
        _topButton.titleLabel.font = [UIFont systemFontOfSize:15];
        _topButton.layer.cornerRadius = 1.0f;
        _topButton.clipsToBounds = YES;
        [_topButton addTarget:self action:@selector(buttonClicick:) forControlEvents:UIControlEventTouchUpInside];
        _topButton.tag = 101;
    }
    return _topButton;
}
-(UIButton *)bottomButton
{
    if (!_bottomButton) {
        _bottomButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _bottomButton.backgroundColor = BASE_STYLE_COLOR;;
        [_bottomButton setTitle:@"我的美团DNA" forState:UIControlStateNormal];
        [_bottomButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _bottomButton.titleLabel.font = [UIFont systemFontOfSize:18];
        _bottomButton.layer.cornerRadius = 2.0f;
        _bottomButton.clipsToBounds = YES;
        [_bottomButton addTarget:self action:@selector(buttonClicick:) forControlEvents:UIControlEventTouchUpInside];
        _bottomButton.tag = 102;
    }
    return _bottomButton;
}
-(UILabel *)bottomLabel
{
    if (!_bottomLabel) {
        _bottomLabel = [UILabel new];
        _bottomLabel.font = [UIFont systemFontOfSize:14];
        _bottomLabel.textColor = TOP_ITEM_TITLE_COLOR;
        _bottomLabel.textAlignment = NSTextAlignmentCenter;
        _bottomLabel.text = @"愿意让我们更了解你吗\n让美团的推荐更符合你的胃口";
        _bottomLabel.numberOfLines = 0;
        [_bottomLabel sizeToFit ];
    }
    return _bottomLabel;
}

@end
