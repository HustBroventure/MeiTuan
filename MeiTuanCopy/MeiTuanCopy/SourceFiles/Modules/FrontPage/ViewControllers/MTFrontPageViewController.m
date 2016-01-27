//
//  MTFrontPageViewController.m
//  MeiTuanCopy
//
//  Created by wangfeng on 16/1/27.
//  Copyright © 2016年 HustBroventure. All rights reserved.
//

#import "MTFrontPageViewController.h"
#import "MTTopCollectionView.h"
#import "MTConteView.h"
#import "MTFrontBottomView.h"
#import "MTFrontTableViewCell.h"

@interface MTFrontPageViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, strong) MTTopCollectionView* topCollectionView;
@property (nonatomic, strong) MTFrontBottomView* bottomView;

@end

@implementation MTFrontPageViewController

#pragma mark - vc-life-circle
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self.view addSubview:self.tableView];
    self.tableView.tableHeaderView = self.topCollectionView ;
    self.tableView.tableFooterView = self.bottomView;

}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}
#pragma mark - public methords

#pragma mark - private-tools methords

#pragma mark - event methords

#pragma mark - delegate methords
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row < 5) {
        UITableViewCell* cell =[tableView cellForRowAtIndexPath:indexPath];
    
        if (indexPath.row == 0) {
            if (!cell) {
                cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                MTConteView* contentView = [[MTConteView alloc]initWithType:0];
                [cell.contentView addSubview:contentView];
                [contentView makeConstraints:^(MASConstraintMaker *make) {
                    make.left.right.bottom.equalTo(cell.contentView);
                    make.top.equalTo(cell.contentView).offset(15);
                }];

            }
           
        }else if(indexPath.row == 1){
            if (!cell) {
                cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
                MTConteView* contentView = [[MTConteView alloc]initWithType:1];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                [cell.contentView addSubview:contentView];
                [contentView makeConstraints:^(MASConstraintMaker *make) {
                    make.left.right.bottom.equalTo(cell.contentView);
                    make.top.equalTo(cell.contentView).offset(15);

                }];
            }
        }
        else if(indexPath.row == 2 || indexPath.row == 4){
            if (!cell) {
                cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
                           }
        }else{
            if (!cell) {
                cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
                MTConteView* contentView = [[MTConteView alloc]initWithType:2];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                [cell.contentView addSubview:contentView];
                [contentView makeConstraints:^(MASConstraintMaker *make) {
                    make.edges.equalTo(cell.contentView);
                }];
            }
        }
        return cell;
    }else{
        MTFrontTableViewCell* cell = [[MTFrontTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        return cell;
    }
   

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row < 4) {
        if (indexPath.row ==2 ) {
            return 44;
        }
        return 210;
    }
    if (indexPath.row == 4) {
        return 44;
    }
    return 80;
}
#pragma mark - property-setter-getter
-(UITableView *)tableView
{
    if(!_tableView){
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64 - 49)
                                                 style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.backgroundColor = [UIColor lightTextColor];
        
    }
    return _tableView;
}
-(MTTopCollectionView *)topCollectionView
{
    if (!_topCollectionView) {
        _topCollectionView = [MTTopCollectionView new];
    }
    return _topCollectionView;
}
-(MTFrontBottomView *)bottomView
{
    if (!_bottomView) {
        _bottomView = [[MTFrontBottomView alloc]init];
    }
    return _bottomView;
}

@end
