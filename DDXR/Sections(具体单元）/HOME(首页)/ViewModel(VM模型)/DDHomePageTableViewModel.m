/*********************************************************************
 *           Copyright © 2017年 NightElf. All rights reserved.
 *                  Date                Name
 *                 17/2/4             Ruancanghui
 **********************************************************************
 * @文件名称: DDHomePageTableViewModel.m
 * @文件描述: 包含view中变化的元素
 * @补充说明: 无
 *********************************************************************/

#import "DDHomePageTableViewModel.h"
#import "DDHomePageTableCellViewModel.h"

@implementation DDHomePageTableViewModel

+ (DDHomePageTableViewModel *)viewModelWithRecipes:(NSArray<Recipe *> *)recipes{
    DDHomePageTableViewModel *vm = [[DDHomePageTableViewModel alloc] init];
    NSMutableArray *cellViewModelArr = [[NSMutableArray alloc] init];
    for (Recipe *recipe in recipes) {
        DDHomePageTableCellViewModel *vm = [DDHomePageTableCellViewModel viewModelWithRecipe:recipe];
        [cellViewModelArr addObject:vm];
    }
    vm.cellViewModels = cellViewModelArr;
    vm.backgroundColor = [UIColor whiteColor];
    return vm;
}
@end
