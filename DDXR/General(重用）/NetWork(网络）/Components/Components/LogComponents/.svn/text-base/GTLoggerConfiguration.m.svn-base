/*********************************************************************
 *         Copyright © 2015年 NetDragon. All rights reserved.
 *                  Date                Name
 *                  14/3/1             GT-ruan
 **********************************************************************
 * @文件名称: GTLoggerConfiguration.m
 * @文件描述: 无
 * @补充说明: 无
 *********************************************************************/
#import "GTLoggerConfiguration.h"
#import "GTServiceFactory.h"

@implementation GTLoggerConfiguration

- (void)configWithAppType:(GTAppType)appType
{
    switch (appType) {
        case GTAppTypeAnjuke:
            self.channelID = [GTAppContext sharedInstance].channelID;
            self.appKey = @"appKey";
            self.logAppName = [GTAppContext sharedInstance].appName;
            self.serviceType = kGTServiceAnjuke;
            self.sendLogMethod = @"admin.writeAppLog";
            self.sendActionMethod = @"admin.recordaction";
            self.sendLogKey = @"data";
            self.sendActionKey = @"action_note";
            break;
            
        case GTAppTypeBroker:
            self.channelID = [GTAppContext sharedInstance].channelID;
            self.appKey = @"appKey";
            self.logAppName = [GTAppContext sharedInstance].appName;
            self.serviceType = kGTServiceBrokerRest;
            self.sendLogMethod = @"admin.writeAppLog";
            self.sendActionMethod = @"nlog/";
            self.sendLogKey = @"data";
            self.sendActionKey = @"log";
            break;
            
        default:
            self.channelID = [GTAppContext sharedInstance].channelID;
            self.appKey = @"appKey";
            self.logAppName = [GTAppContext sharedInstance].appName;
            self.serviceType = kGTServiceAnjuke;
            self.sendLogMethod = @"admin.writeAppLog";
            self.sendActionMethod = @"admin.recordaction";
            self.sendLogKey = @"data";
            self.sendActionKey = @"action_note";
            break;
    }
}

@end
