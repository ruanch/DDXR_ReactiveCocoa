/*********************************************************************
 *           Copyright © 2017年 NightElf. All rights reserved.
 *                  Date                Name
 *                 17/2/4             Ruancanghui
 **********************************************************************
 * @文件名称: DDHomePageTableViewModel.h
 * @文件描述: 包含view中变化的元素
 * @补充说明: 无
 *********************************************************************/

#import <UIKit/UIKit.h>
#import "DDViewModel.h"
@class DDHomePageTableCellViewModel;
@class Recipe;

@interface DDHomePageTableViewModel : DDViewModel

@property (strong, nonatomic) NSArray<DDHomePageTableCellViewModel *> *cellViewModels;

/**
 *  根据食谱集来创建相应的ViewModel
 *
 *  @param recipes 食谱集
 *
 *  @return 返回DDHomePageTableView对应的ViewModel
 */
+ (DDHomePageTableViewModel *)viewModelWithRecipes:(NSArray<Recipe *> *)recipes;

@end
