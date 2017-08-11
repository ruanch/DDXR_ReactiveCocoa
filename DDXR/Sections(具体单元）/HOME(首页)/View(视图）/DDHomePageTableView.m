/*********************************************************************
 *           Copyright © 2017年 NightElf. All rights reserved.
 *                  Date                Name
 *                 17/2/4             Ruancanghui
 **********************************************************************
 * @文件名称: DDHomePageTableView.m
 * @文件描述: 首页的列表视图控件
 * @补充说明: 无
 *********************************************************************/

#import "DDHomePageTableView.h"
#import "DDHomePageCellTableViewCell.h"
#import "DDHomePageTableCellViewModel.h"
#import "DDHomePageTableViewModel.h"

@interface DDHomePageTableView()<UITableViewDataSource, UITableViewDelegate>{
    UITableView *_tableView;
}

@end
@implementation DDHomePageTableView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self addSubview:_tableView];
    }
    return self;
}

- (void)bindDataWithViewModel:(DDHomePageTableViewModel *)viewModel{
    self.tableViewModel = viewModel;
    self.backgroundColor = viewModel.backgroundColor;
    [_tableView reloadData];
    //更新UI约束
}

#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.tableViewModel.cellViewModels.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DDHomePageCellTableViewCell *cell = nil;
    static NSString *identifier = @"cell";
    cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[DDHomePageCellTableViewCell alloc] init];
    }
    DDHomePageTableCellViewModel *vm = self.tableViewModel.cellViewModels[indexPath.row];
    [cell bindDataWithViewModel:vm];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.delegate homePageTableView:self didSelectedRowAtIndexPath:indexPath];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 90.0f;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
