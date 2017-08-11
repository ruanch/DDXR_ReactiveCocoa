/*********************************************************************
 *         Copyright © 2015年  All rights reserved.
 *                  Date                Name
 *                  14/3/1             Ruancanghui
 **********************************************************************
 * @文件名称: SearchAPI.h
 * @文件描述: 用于查询请求配置文件
 * @补充说明: 无
 *********************************************************************/

#import <Foundation/Foundation.h>
#import "RequestBase.h"
@interface SearchAPI: RequestBase

- (id)initWithKey:(NSString *)key andMenu:(NSString *)menu;
@end
