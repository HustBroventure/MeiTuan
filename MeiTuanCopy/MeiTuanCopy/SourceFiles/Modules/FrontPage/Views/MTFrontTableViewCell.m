//
//  MTFrontTableViewCell.m
//  MeiTuanCopy
//
//  Created by wangfeng on 16/1/27.
//  Copyright © 2016年 HustBroventure. All rights reserved.
//

#import "MTFrontTableViewCell.h"
#define  CELL_HEIGHT  (80.0)
@implementation MTFrontTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initSubView];
        [self testData];
        
    }
    return self;
}

-(void)initSubView
{
    [self.contentView addSubview:self.leftImageView];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.descLabel];
    [self.contentView addSubview:self.distanceLabel];
    [self.contentView addSubview:self.priceLabel];
    [self.contentView addSubview:self.soldLabel];
    
    [self.contentView addSubview:self.priceInfolabel];
    [self.contentView addSubview:self.priceNormalLabel];

    [self.leftImageView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(5);
        make.top.equalTo(self.contentView).offset(5);
        make.bottom.equalTo(self.contentView).offset(-5);
        make.width.equalTo(CELL_HEIGHT - 10);
    }];
    [self.distanceLabel makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-10);
        make.top.equalTo(self.contentView).offset(8);
        
    }];
    [self.titleLabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.leftImageView.right).offset(5);
        make.top.equalTo(self.contentView).offset(8);
        make.right.equalTo(self.distanceLabel).offset(-3);
        make.height.equalTo(17.5);

    }];
    
    [self.soldLabel makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-10);
        make.bottom.equalTo(self.contentView).offset(-8);
        
    }];
    
    [self.priceLabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.leftImageView.right).offset(5);
        make.bottom.equalTo(self.contentView).offset(-8);
        make.width.equalTo(60);
        make.height.equalTo(14.5);
        
    }];
    [self.descLabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.leftImageView.right).offset(5);
        make.top.equalTo(self.titleLabel.bottom).offset(3);
        make.bottom.equalTo(self.priceLabel.top).offset(-3);
        make.right.equalTo(self.contentView).offset(-10);

    }];
//    [self.priceNormalLabel makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.leftImageView.right).offset(5);
//        make.bottom.equalTo(self.contentView).offset(-8);
//        make.width.equalTo(60);
//        make.height.equalTo(14.5);
//
//    }];
    [self.priceInfolabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.priceLabel.right).offset(5);
        make.bottom.equalTo(self.contentView).offset(-8);
        
    }];

    

    
}
-(void)testData
{
    self.leftImageView.backgroundColor = [UIColor redColor];
    self.titleLabel.text = @"向阳居资助烤肉";
    self.distanceLabel.text = @"<500m";
    self.descLabel.text = @"[西丽]自主晚餐，提供免费Wifi";
    self.priceLabel.text = @"68.8";
    self.soldLabel.text = @"已售2123";
}
-(UIImageView *)leftImageView
{
    if (!_leftImageView) {
        _leftImageView = [UIImageView new];
    }
    return _leftImageView;
}
-(UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _titleLabel;
}

-(UILabel *)descLabel
{
    if (!_descLabel) {
        _descLabel = [UILabel new];
        _descLabel.font = [UIFont systemFontOfSize:12];
        _descLabel.textColor = TOP_ITEM_TITLE_COLOR;
        _descLabel.textAlignment = NSTextAlignmentLeft;
        _descLabel.numberOfLines = 0;
    }
    return _descLabel;
}
-(UILabel *)distanceLabel
{
    if (!_distanceLabel) {
        _distanceLabel = [UILabel new];
        _distanceLabel.font = [UIFont systemFontOfSize:12];
        _distanceLabel.textColor = TOP_ITEM_TITLE_COLOR;
        _distanceLabel.textAlignment = NSTextAlignmentRight;
        _distanceLabel.text = @"<500km";
        [_distanceLabel sizeToFit];
    }
    return _distanceLabel;
}
-(UILabel *)priceLabel
{
    if (!_priceLabel) {
        _priceLabel = [UILabel new];
        _priceLabel.font = [UIFont systemFontOfSize:14];
        _priceLabel.textColor = BASE_STYLE_COLOR;
        _priceLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _priceLabel;
}
-(UILabel *)soldLabel
{
    if (!_soldLabel) {
        _soldLabel = [UILabel new];
        _soldLabel.font = [UIFont systemFontOfSize:11];
        _soldLabel.textColor = TOP_ITEM_TITLE_COLOR;
        _soldLabel.textAlignment = NSTextAlignmentRight;
        _soldLabel.text = @"      已售出0";
        [_soldLabel sizeToFit];
    }
    return _soldLabel;
}

-(UILabel *)priceInfolabel
{
    if (!_priceInfolabel) {
        _priceInfolabel = [UILabel new];
        _priceInfolabel.font = [UIFont systemFontOfSize:9];
        _priceInfolabel.textColor = [UIColor brownColor];
        _priceInfolabel.textAlignment = NSTextAlignmentCenter;
        _priceInfolabel.layer.cornerRadius  = 2;
        _priceInfolabel.layer.masksToBounds = YES;
        _priceInfolabel.layer.borderWidth = 1;
        _priceInfolabel.layer.borderColor =  _priceInfolabel.textColor.CGColor;
        _priceInfolabel.text = @"立减100";
        [_priceInfolabel sizeToFit];
    }
    return _priceInfolabel;
}
-(UILabel *)priceNormalLabel
{
    if (!_priceNormalLabel) {
        _priceNormalLabel = [UILabel new];
        _priceNormalLabel.font = [UIFont systemFontOfSize:11];
        _priceNormalLabel.textColor = TOP_ITEM_TITLE_COLOR;
        _priceNormalLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _priceNormalLabel;
}
@end
