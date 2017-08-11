/*********************************************************************
 *           Copyright © 2017年 NightElf. All rights reserved.
 *                  Date                Name
 *                 17/2/4             Ruancanghui
 **********************************************************************
 * @文件名称: DDHomePageDataManager.h
 * @文件描述: 处理主页上的所有数据相关的处理
 * @补充说明: 无
 *********************************************************************/

#import <Foundation/Foundation.h>
#import "HomeAPIManager.h"
#import "DDDataManager.h"
@class Recipe;

@interface DDHomePageDataManager : DDDataManager

@property (strong, nonatomic) NSArray<Recipe *> *recipes;
 
@end
