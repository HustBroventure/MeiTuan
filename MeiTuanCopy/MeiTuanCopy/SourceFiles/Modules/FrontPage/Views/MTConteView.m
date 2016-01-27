//
//  MTConteView.m
//  MeiTuanCopy
//
//  Created by wangfeng on 16/1/27.
//  Copyright © 2016年 HustBroventure. All rights reserved.
//

#import "MTConteView.h"

@implementation MTConteView
{
    CGFloat _width;
    CGFloat _height;
}
-(instancetype)initWithType:(NSInteger)type{
    if (self = [super init]) {
        _width  = [UIScreen mainScreen].bounds.size.width;
        _height = 200;
        self.bounds = CGRectMake(0, 0, _width, _height);
        switch (type) {
            case 0:
                 [self initSubViewType1];
                break;
            case 1:
                [self initSubViewType2];
                break;
            case 2:
                [self initSubViewType3];
                break;
            default:
                break;
        }
       
    }
    return self;
}

-(void)initSubViewType1
{
    UIButton* left = [self getButtonItem];
    UIButton* rightTop = [self getButtonItem];
    UIButton* rightBottom = [self getButtonItem];
    [self addSubview:left];
    [self addSubview:rightTop];
    [self addSubview:rightBottom];
    left.frame = CGRectMake(0, 0,_width / 2 , _height);
    rightTop.frame = CGRectMake(_width / 2, 0, _width / 2, _height / 2);
    rightBottom.frame = CGRectMake(_width / 2, _height / 2, _width / 2, _height / 2);
    
    UIView* topLine = [self getLineView];
    UIView* midLine = [self getLineView];
    UIView* bottomLine = [self getLineView];
    UIView* center = [self getLineView];
    [self addSubview:topLine];
    [self addSubview:midLine];
    [self addSubview:bottomLine];
    [self addSubview:center];
    center.frame = CGRectMake(_width / 2 - 0.5, 0, 0.5, _height);
    topLine.frame = CGRectMake(0, 0, _width, 0.5);
    bottomLine.frame = CGRectMake(0, _height - 0.5, _width, 0.5);
    midLine.frame = CGRectMake(_width / 2, _height / 2, _width / 2, 0.5);

}
-(void)initSubViewType2
{
    UIButton* top = [self getButtonItem];
    UIButton* leftTop = [self getButtonItem];
    UIButton* leftBottom = [self getButtonItem];
    UIButton* rightTop = [self getButtonItem];
    UIButton* rightBottom = [self getButtonItem];
    [self addSubview:top];
    [self addSubview:leftTop];
    [self addSubview:leftBottom];
    [self addSubview:rightTop];
    [self addSubview:rightBottom];
    top.frame = CGRectMake(0, 0,_width , _height / 3);
    
    leftTop.frame = CGRectMake(0, _height / 3, _width / 2, _height / 3);
    leftBottom.frame = CGRectMake(0, _height / 3 * 2, _width / 2, _height / 3);
    rightTop.frame = CGRectMake(_width / 2, _height / 3, _width / 2, _height / 3);
    rightBottom.frame = CGRectMake(_width / 2, _height / 3 * 2, _width / 2, _height / 3);
    
    UIView* topLine = [self getLineView];
    UIView* midLine1 = [self getLineView];
    UIView* midLine2 = [self getLineView];
    UIView* bottomLine = [self getLineView];
    UIView* center = [self getLineView];
    
    [self addSubview:topLine];
    [self addSubview:midLine1];
    [self addSubview:midLine2];
    [self addSubview:bottomLine];
    [self addSubview:center];
    center.frame = CGRectMake(_width / 2 - 0.5, _height / 3, 0.5, _height / 3 * 2);
    
    topLine.frame = CGRectMake(0, 0, _width, 0.5);
    bottomLine.frame = CGRectMake(0, _height - 0.5, _width, 0.5);
    midLine1.frame = CGRectMake(0, _height / 3, _width , 0.5);
    midLine2.frame = CGRectMake(0, _height / 3 * 2, _width , 0.5);

    
}
-(void)initSubViewType3
{
    UIButton* topLeft = [self getButtonItem];
    UIButton* topRight = [self getButtonItem];
    UIButton* bottom1 = [self getButtonItem];
    UIButton* bottom2 = [self getButtonItem];
    UIButton* bottom3 = [self getButtonItem];
    UIButton* bottom4 = [self getButtonItem];
    
    [self addSubview:topLeft];
    [self addSubview:topRight];
    [self addSubview:bottom1];
    [self addSubview:bottom2];
    [self addSubview:bottom3];
    [self addSubview:bottom4];
   
    [topLeft makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(2);
        make.top.equalTo(self);
        make.right.equalTo(self.centerX).offset(-1);
        make.height.equalTo(80);
    }];
    [topRight makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-2);
        make.top.equalTo(self);
        make.left.equalTo(self.centerX).offset(1);
        make.height.equalTo(80);
    }];
    
    [bottom1 makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(2);
        make.top.equalTo(topLeft.bottom).offset(2);
        make.width.equalTo((_width -10) / 4);
        make.bottom.equalTo(self).offset(-2);

    }];
    [bottom2 makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bottom1.right).offset(2);
        make.top.equalTo(bottom1.top);
        make.width.equalTo(bottom1.width);
        make.bottom.equalTo(bottom1.bottom);
        
    }];
    [bottom3 makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bottom2.right).offset(2);
        make.top.equalTo(bottom1.top);
        make.width.equalTo(bottom1.width);
        make.bottom.equalTo(bottom1.bottom);
        
    }];
    [bottom4 makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bottom3.right).offset(2);
        make.top.equalTo(bottom1.top);
        make.width.equalTo(bottom1.width);
        make.bottom.equalTo(bottom1.bottom);
        
    }];
   

    
    
}

-(UIButton*)getButtonItem
{
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor orangeColor];
    return button;

}
-(UIView*)getLineView
{
    UIView* line = [UIView new];
    line.backgroundColor = [UIColor lightGrayColor];
    return line;
}
@end
