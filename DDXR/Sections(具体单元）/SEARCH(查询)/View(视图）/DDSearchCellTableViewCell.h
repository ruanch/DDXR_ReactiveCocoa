/*********************************************************************
 *           Copyright © 2017年 NightElf. All rights reserved.
 *                  Date                Name
 *                 17/2/4             Ruancanghui
 **********************************************************************
 * @文件名称: DDSearchCellTableViewCell.h
 * @文件描述: 查询的列表选项cell控件
 * @补充说明: 无
 *********************************************************************/

#import <UIKit/UIKit.h>
@class DDSearchTableCellViewModel;

@interface DDSearchCellTableViewCell : UITableViewCell

@property (strong, nonatomic) DDSearchTableCellViewModel *cellViewModel;

- (void)bindDataWithViewModel:(DDSearchTableCellViewModel *)viewModel;

@end
