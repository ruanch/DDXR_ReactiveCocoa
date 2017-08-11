/*********************************************************************
 *         Copyright © 2015年 NetDragon. All rights reserved.
 *                  Date                Name
 *                  14/3/1             GT-ruan
 **********************************************************************
 * @文件名称: GTServiceGoogleMapDirections.m
 * @文件描述: 无
 * @补充说明: 无
 *********************************************************************/
#import "GTServiceGoogleMapDirections.h"

@implementation GTServiceGoogleMapDirections

#pragma mark - GTServiceProtocal
- (BOOL)isOnline
{
    return YES;
}

- (NSString *)onlineApiBaseUrl
{
    return @"http://maps.googleapis.com/maps/api/";
}

- (NSString *)onlineApiVersion
{
    return @"directions/json";
}

- (NSString *)onlinePrivateKey
{
    return @"";
}

- (NSString *)onlinePublicKey
{
    return @"";
}

- (NSString *)offlineApiBaseUrl
{
    return self.onlineApiBaseUrl;
}

- (NSString *)offlineApiVersion
{
    return self.onlineApiVersion;
}

- (NSString *)offlinePrivateKey
{
    return self.onlinePrivateKey;
}

- (NSString *)offlinePublicKey
{
    return self.onlinePublicKey;
}

@end
