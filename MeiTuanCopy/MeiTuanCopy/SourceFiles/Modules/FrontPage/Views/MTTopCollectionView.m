//
//  MTTopCollectionView.m
//  MeiTuanCopy
//
//  Created by wangfeng on 16/1/27.
//  Copyright © 2016年 HustBroventure. All rights reserved.
//

#import "MTTopCollectionView.h"

@implementation MTTopCollectionView
{
    CGFloat _width;
    CGFloat _height;

}
-(instancetype)init
{
    if (self = [super init]) {
        _width =  [UIScreen mainScreen].bounds.size.width;
        _height = _width/5*2 + 20;
        self.bounds = CGRectMake(0, 0, _width, _height);
        [self addSubview:self.collectionView];
        [self addSubview:self.page];
        [self addSubview:self.lineView];
    }
    return self;
}



-(UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = CGSizeMake(_width / 5, _width / 5);
        flowLayout.minimumLineSpacing = 0;
        flowLayout.minimumInteritemSpacing= 0;
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, _width, _width / 5 * 2) collectionViewLayout:flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[HBCollectionViewCell class] forCellWithReuseIdentifier:@"CELL"];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.pagingEnabled = YES;
        _collectionView.showsHorizontalScrollIndicator = NO;
        
    }
    return _collectionView;
}
-(UIPageControl *)page
{
    if (!_page) {
        _page = [[UIPageControl alloc]initWithFrame:CGRectMake(0, _height - 20, _width, 20)];
        _page.numberOfPages = 2;
        _page.currentPageIndicatorTintColor = BASE_STYLE_COLOR;
        _page.pageIndicatorTintColor = [UIColor grayColor];
        [_page addTarget:self action:@selector(pageChange) forControlEvents:UIControlEventValueChanged];
    }
    return _page;
}
- (UIView*)lineView{
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor =[UIColor colorWithRed:223 /255.0 green:223/255.0 blue:210 alpha:1];
        _lineView.frame = CGRectMake(0, _height-0.5, _width, 0.5);

    }
    return _lineView;
}
-(void)pageChange
{
    NSInteger count = _page.currentPage;
    [self.collectionView setContentOffset:CGPointMake(count * _width, 0) animated:YES];
    
}
#pragma mark - delegate methords
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HBCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CELL" forIndexPath:indexPath];
    cell.topImageView.backgroundColor = [UIColor redColor];
    cell.bottomLabel.text = @"测试一下";
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%s     %zi",__func__,indexPath.row);
    if (self.clickBlock) {
        self.clickBlock(indexPath.row);
    }
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat offset = scrollView.contentOffset.x;
    _page.currentPage = offset / _width;
}
@end
@implementation HBCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.topImageView];
        [self addSubview:self.bottomLabel];
    }
    return self;
}
-(UIImageView *)topImageView
{
    if (!_topImageView) {
        _topImageView = [UIImageView new];
        _topImageView.contentMode =UIViewContentModeCenter;
        
    }
    return _topImageView;
}
-(UILabel *)bottomLabel
{
    if (!_bottomLabel) {
        _bottomLabel = [UILabel new];
        _bottomLabel.textAlignment  = NSTextAlignmentCenter;
        _bottomLabel.font = [UIFont systemFontOfSize:12];
        _bottomLabel.textColor = TOP_ITEM_TITLE_COLOR;
    }
    return _bottomLabel;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    self.topImageView.frame  = CGRectMake(10, 10, self.frame.size.width - 20, self.frame.size.height - 30);
    self.bottomLabel.frame = CGRectMake(0, self.frame.size.height - 20, self.frame.size.width, 20);

    

}
@end