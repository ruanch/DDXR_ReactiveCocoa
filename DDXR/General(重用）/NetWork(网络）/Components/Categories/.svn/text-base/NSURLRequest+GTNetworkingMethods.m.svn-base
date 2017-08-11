/*********************************************************************
 *         Copyright © 2015年 NetDragon. All rights reserved.
 *                  Date                Name
 *                  14/3/1             GT-ruan
 **********************************************************************
 * @文件名称: NSURLRequest+GTNetworkingMethods.m
 * @文件描述: 无
 * @补充说明: 无
 *********************************************************************/
#import "NSURLRequest+GTNetworkingMethods.h"
#import <objc/runtime.h>

static void *GTNetworkingRequestParams;

@implementation NSURLRequest (GTNetworkingMethods)

- (void)setRequestParams:(NSDictionary *)requestParams
{
    objc_setAssociatedObject(self, &GTNetworkingRequestParams, requestParams, OBJC_ASSOCIATION_COPY);
}

- (NSDictionary *)requestParams
{
    return objc_getAssociatedObject(self, &GTNetworkingRequestParams);
}

@end
