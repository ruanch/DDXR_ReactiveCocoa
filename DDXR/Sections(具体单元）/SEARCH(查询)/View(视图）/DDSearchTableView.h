/*********************************************************************
 *           Copyright © 2017年 NightElf. All rights reserved.
 *                  Date                Name
 *                 17/2/4             Ruancanghui
 **********************************************************************
 * @文件名称: DDSearchTableView.h
 * @文件描述: 查询的列表视图控件
 * @补充说明: 无
 *********************************************************************/

#import <UIKit/UIKit.h>
@class DDSearchTableViewModel;
@class DDSearchTableView;

@protocol DDSearchTableViewDelegate <NSObject>

/**
 *  点击row时的操作
 *
 *  @param tableView tableView
 *  @param indexPath inddexPath
 */
- (void)SearchTableView:(DDSearchTableView *)tableView didSelectedRowAtIndexPath:(NSIndexPath *)indexPath;

@end
@interface DDSearchTableView : UIView

@property (strong, nonatomic) DDSearchTableViewModel *tableViewModel;
@property (weak, nonatomic) id<DDSearchTableViewDelegate> delegate;

- (void)bindDataWithViewModel:(DDSearchTableViewModel *)viewModel;

@end
