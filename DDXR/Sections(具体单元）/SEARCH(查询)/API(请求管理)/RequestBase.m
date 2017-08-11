/*********************************************************************
 *         Copyright © 2015年  All rights reserved.
 *                  Date                Name
 *                  14/3/1             Ruancanghui
 **********************************************************************
 * @文件名称: RequestBase.h
 * @文件描述: 用于工程统一请求配置文件
 * @补充说明: 无
 *********************************************************************/

#import "RequestBase.h"
#import <objc/runtime.h>

@implementation RequestBase

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodGET;
}

- (YTKRequestSerializerType)requestSerializerType
{
    return YTKRequestSerializerTypeJSON;
}

- (NSDictionary *)requestHeaderFieldValueDictionary
{
    return @{@"apikey": @"61979cba44a3b9abb16c5127574dd2e5"};
}


@end
