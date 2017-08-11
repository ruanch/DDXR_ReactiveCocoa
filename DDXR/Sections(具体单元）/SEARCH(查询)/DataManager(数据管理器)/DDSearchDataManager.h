/*********************************************************************
 *           Copyright © 2017年 NightElf. All rights reserved.
 *                  Date                Name
 *                 17/2/4             Ruancanghui
 **********************************************************************
 * @文件名称: DDSearchDataManager.h
 * @文件描述: 处理查询页面的所有数据相关的处理
 * @补充说明: 无
 *********************************************************************/

#import <Foundation/Foundation.h>
#import "DDDataManager.h"
@class Recipe;

@interface DDSearchDataManager : DDDataManager

@property (strong, nonatomic) NSArray<Recipe *> *recipes;
 
@end
