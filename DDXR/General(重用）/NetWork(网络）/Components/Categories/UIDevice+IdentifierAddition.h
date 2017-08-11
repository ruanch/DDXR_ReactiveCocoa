/*********************************************************************
 *         Copyright © 2015年 NetDragon. All rights reserved.
 *                  Date                Name
 *                  14/3/1             GT-ruan
 **********************************************************************
 * @文件名称: UIDevice(Identifier).h
 * @文件描述: 无
 * @补充说明: 无
 *********************************************************************/
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIDevice (IdentifierAddition)

/*
 * @method uuid
 * @description apple identifier support iOS6 and iOS5 below
 */

- (NSString *) GT_uuid;
- (NSString *) GT_udid;
- (NSString *) GT_macaddress;
- (NSString *) GT_macaddressMD5;
- (NSString *) GT_machineType;
- (NSString *) GT_ostype;//显示“ios6，ios5”，只显示大版本号
- (NSString *) GT_createUUID;

//兼容旧版本
- (NSString *) uuid;
- (NSString *) udid;
- (NSString *) macaddress;
- (NSString *) macaddressMD5;
- (NSString *) machineType;
- (NSString *) ostype;//显示“ios6，ios5”，只显示大版本号
- (NSString *) createUUID;
@end
