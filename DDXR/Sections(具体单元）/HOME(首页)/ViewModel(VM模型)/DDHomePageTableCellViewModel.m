/*********************************************************************
 *           Copyright © 2017年 NightElf. All rights reserved.
 *                  Date                Name
 *                 17/2/4             Ruancanghui
 **********************************************************************
 * @文件名称: DDHomePageTableCellViewModel.m
 * @文件描述: 包含view中变化的元素
 * @补充说明: 无
 *********************************************************************/

#import "DDHomePageTableCellViewModel.h"
#import "Recipe.h"

@implementation DDHomePageTableCellViewModel

+ (DDHomePageTableCellViewModel *)viewModelWithRecipe:(Recipe *)recipe{
    
    DDHomePageTableCellViewModel *vm = [[DDHomePageTableCellViewModel alloc] init];
    vm.avatarURL = recipe.recipeAlbum;
    vm.title = recipe.recipeTitle;
    vm.desc = recipe.recipeDesc;
    vm.titleColor = [UIColor redColor];
    return vm;
}
@end
