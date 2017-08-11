/*********************************************************************
 *           Copyright © 2017年 NightElf. All rights reserved.
 *                  Date                Name
 *                 17/2/4             Ruancanghui
 **********************************************************************
 * @文件名称: DDHomePageCellTableViewCell.h
 * @文件描述: 首页的列表选项cell控件
 * @补充说明: 无
 *********************************************************************/

#import <UIKit/UIKit.h>
@class DDHomePageTableCellViewModel;

@interface DDHomePageCellTableViewCell : UITableViewCell

@property (strong, nonatomic) DDHomePageTableCellViewModel *cellViewModel;

- (void)bindDataWithViewModel:(DDHomePageTableCellViewModel *)viewModel;

@end
