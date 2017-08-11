/*********************************************************************
 *           Copyright © 2017年 NightElf. All rights reserved.
 *                  Date                Name
 *                 17/2/4             Ruancanghui
 **********************************************************************
 * @文件名称: DDHomePageTableView.h
 * @文件描述: 首页的列表视图控件
 * @补充说明: 无
 *********************************************************************/

#import <UIKit/UIKit.h>
@class DDHomePageTableViewModel;
@class DDHomePageTableView;

@protocol DDHomePageTableViewDelegate <NSObject>

/**
 *  点击row时的操作
 *
 *  @param tableView tableView
 *  @param indexPath inddexPath
 */
- (void)homePageTableView:(DDHomePageTableView *)tableView didSelectedRowAtIndexPath:(NSIndexPath *)indexPath;

@end
@interface DDHomePageTableView : UIView

@property (strong, nonatomic) DDHomePageTableViewModel *tableViewModel;
@property (weak, nonatomic) id<DDHomePageTableViewDelegate> delegate;

- (void)bindDataWithViewModel:(DDHomePageTableViewModel *)viewModel;

@end
