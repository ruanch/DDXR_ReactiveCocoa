/*********************************************************************
 *         Copyright © 2015年 NetDragon. All rights reserved.
 *                  Date                Name
 *                  14/3/1             GT-ruan
 **********************************************************************
 * @文件名称: GTNetworkingConfiguration.h
 * @文件描述: 无
 * @补充说明: 无
 *********************************************************************/
#ifndef GTNetworking_GTNetworkingConfiguration_h
#define GTNetworking_GTNetworkingConfiguration_h

typedef NS_ENUM(NSInteger, GTAppType) {
    GTAppTypeAnjuke,
    GTAppTypeBroker,
    GTAppTypeGTang,
    GTAppTypeErShouFang,
    GTAppTypeHaozu
};

typedef NS_ENUM(NSUInteger, GTURLResponseStatus)
{
    GTURLResponseStatusSuccess, //作为底层，请求是否成功只考虑是否成功收到服务器反馈。至于签名是否正确，返回的数据是否完整，由上层的RTApiBaseManager来决定。
    GTURLResponseStatusErrorTimeout,
    GTURLResponseStatusErrorNoNetwork // 默认除了超时以外的错误都是无网络错误。
};

static NSTimeInterval kGTNetworkingTimeoutSeconds = 20.0f;

static NSString *GTKeychainServiceName = @"com.anjukeApps";
static NSString *GTUDIDName = @"anjukeAppsUDID";
static NSString *GTPasteboardType = @"anjukeAppsContent";

static BOOL kGTShouldCache = NO;
static NSTimeInterval kGTCacheOutdateTimeSeconds = 300; // 5分钟的cache过期时间
static NSUInteger kGTCacheCountLimit = 1000; // 最多1000条cache

// anjuke
extern NSString * const kGTServiceAnjuke;
extern NSString * const kGTServiceAnjukeREST_4;
extern NSString * const kGTServiceAnjukeCorp;
extern NSString * const kGTServiceAnjukeRest;
extern NSString * const kGTServiceAnjukeV5;

// x
extern NSString * const kGTServiceXRest;
extern NSString * const kGTServiceXAudioRest;
extern NSString * const kGTServiceXPublicRest;
extern NSString * const kGTServiceXUnread;

// broker
extern NSString * const kGTServiceBrokerRest;
extern NSString * const kGTServiceBrokerCorp;
extern NSString * const kGTServiceBroker;

// haozu
extern NSString * const kGTServiceHaozu;
extern NSString * const kGTServiceHaozuCorp;

// xinfang
extern NSString * const kGTServiceXinfang;

// jinpu
extern NSString * const kGTServiceJinpuRest;

// other
extern NSString * const kGTServiceCoordinatorChannel;
extern NSString * const kGTServiceMarket;
extern NSString * const kGTServiceMember;
extern NSString * const kGTServiceNotification;
extern NSString * const kGTServiceTrace;
extern NSString * const kGTServiceURLChange;

// Google Map API
extern NSString * const kGTServiceGoogleMapAPIDirections;

//demo
extern NSString * const kGTServiceFeedBackRest;
#endif
