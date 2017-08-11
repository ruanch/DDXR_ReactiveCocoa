/*********************************************************************
 *           Copyright © 2017年 NightElf. All rights reserved.
 *                  Date                Name
 *                 17/2/4             Ruancanghui
 **********************************************************************
 * @文件名称: DDHomePageTableCellViewModel.h
 * @文件描述: 包含view中变化的元素
 * @补充说明: 无
 *********************************************************************/

#import <UIKit/UIKit.h>
#import "DDViewModel.h"
@class Recipe;

@interface DDHomePageTableCellViewModel : DDViewModel

@property (strong, nonatomic) NSString *avatarURL;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) UIColor *titleColor;
@property (strong, nonatomic) NSString *desc;

/**
 *  根据相应的食谱返回相应的ViewModel
 *
 *  @param recipe 食谱
 *
 *  @return 单个食谱的ViewModel
 */
+ (DDHomePageTableCellViewModel *)viewModelWithRecipe:(Recipe *)recipe;

@end
