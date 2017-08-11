/*********************************************************************
 *         Copyright © 2015年 NetDragon. All rights reserved.
 *                  Date                Name
 *                  14/3/1             GT-ruan
 **********************************************************************
 * @文件名称: GTServiceFactory.m
 * @文件描述: 无
 * @补充说明: 无
 *********************************************************************/

#import "GTServiceFactory.h"
#import "GTService.h"

// anjuke
//#import "GTServiceAnjuke.h"
//#import "GTServiceAnjukeREST_4.h"
//#import "GTServiceAnjukeCorp.h"
//#import "GTServiceAnjukeRest.h"
//#import "GTServiceAnjukeV5.h"
//
//// x
//#import "GTServiceXRest.h"
//#import "GTServiceXAudioRest.h"
//#import "GTServiceXPublicRest.h"
//#import "GTServiceXUnread.h"
//
//// broker
//#import "GTServiceBrokerRest.h"
//#import "GTServiceBrokerCorp.h"
//#import "GTServiceBroker.h"
//
//// haozu
//#import "GTServiceHaozu.h"
//#import "GTServiceHaozuCorp.h"
//
//// xinfang
//#import "GTServiceXinfang.h"
//
//// jinpu
//#import "GTServiceJinpuRest.h"
//
//// other
//#import "GTServiceCoordinatorChannel.h"
//#import "GTServiceMarket.h"
//#import "GTServiceMember.h"
//#import "GTServiceNotification.h"
//#import "GTServiceTrace.h"
//#import "GTServiceURLChange.h"
//
//// Google Map API
//#import "GTServiceGoogleMapDirections.h"


////demo
//#import "FeedBackService.h"
/*************************************************************************/

// anjuke
NSString * const kGTServiceAnjuke = @"kAXServiceAnjuke";
NSString * const kGTServiceAnjukeREST_4 = @"kAXServiceAnjukeREST_4";
NSString * const kGTServiceAnjukeCorp = @"kAXServiceAnjukeCorp";
NSString * const kGTServiceAnjukeRest = @"kGTServiceAnjukeRest";
NSString * const kGTServiceAnjukeV5 = @"kGTServiceAnjukeV5";

// x
NSString * const kGTServiceXRest = @"kGTServiceXRest";
NSString * const kGTServiceXAudioRest = @"kGTServiceXAudioRest";
NSString * const kGTServiceXPublicRest = @"kGTServiceXPublicRest";
NSString * const kGTServiceXUnread = @"kGTServiceXUnread";

// broker
NSString * const kGTServiceBrokerRest = @"kGTServiceBrokerRest";
NSString * const kGTServiceBrokerCorp = @"kGTServiceBrokerCorp";
NSString * const kGTServiceBroker = @"kGTServiceBroker";

// haozu
NSString * const kGTServiceHaozu = @"kGTServiceHaozu";
NSString * const kGTServiceHaozuCorp = @"kGTServiceHaozuCorp";

// xinfang
NSString * const kGTServiceXinfang = @"kGTServiceXinfang";

// jinpu
NSString * const kGTServiceJinpuRest = @"kGTServiceJinpuRest";

// other
NSString * const kGTServiceCoordinatorChannel = @"kGTServiceCoordinatorChannel";
NSString * const kGTServiceMarket = @"kGTServiceMarket";
NSString * const kGTServiceMember = @"kGTServiceMember";
NSString * const kGTServiceNotification = @"kGTServiceNotification";
NSString * const kGTServiceTrace = @"kGTServiceTrace";
NSString * const kGTServiceURLChange = @"kGTServiceURLChange";

// Google Map API
NSString * const kGTServiceGoogleMapAPIDirections = @"kGTServiceGoogleMapAPIDirections";

//demo
NSString * const kGTServiceFeedBackRest = @"kGTServiceFeedBackRest";
@interface GTServiceFactory ()

@property (nonatomic, strong) NSMutableDictionary *serviceStorage;

@end

@implementation GTServiceFactory

#pragma mark - getters and setters
- (NSMutableDictionary *)serviceStorage
{
    
    if (_serviceStorage == nil) {
        _serviceStorage = [[NSMutableDictionary alloc] init];
    }
    return _serviceStorage;
}

#pragma mark - life cycle
+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    static GTServiceFactory *sharedInstance;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[GTServiceFactory alloc] init];
    });
    return sharedInstance;
}

#pragma mark - public methods
- (GTService<GTServiceProtocal> *)serviceWithIdentifier:(NSString *)identifier
{
    if (self.serviceStorage[identifier] == nil) {
        self.serviceStorage[identifier] = [self newServiceWithIdentifier:identifier];
    }
    return self.serviceStorage[identifier];
}

#pragma mark - private methods
- (GTService<GTServiceProtocal> *)newServiceWithIdentifier:(NSString *)identifier
{
    // anjuke
//    if ([identifier isEqualToString:kGTServiceAnjuke]) {
//        return [[GTServiceAnjuke alloc] init];
//    }
//    if ([identifier isEqualToString:kGTServiceAnjukeREST_4]) {
//        return [[GTServiceAnjukeREST_4 alloc] init];
//    }
//    if ([identifier isEqualToString:kGTServiceAnjukeCorp]) {
//        return [[GTServiceAnjukeCorp alloc] init];
//    }
//    if ([identifier isEqualToString:kGTServiceAnjukeRest]) {
//        return [[GTServiceAnjukeRest alloc] init];
//    }
//    if ([identifier isEqualToString:kGTServiceAnjukeV5]) {
//        return [[GTServiceAnjukeV5 alloc] init];
//    }
//    
//    // x
//    if ([identifier isEqualToString:kGTServiceXRest]) {
//        return [[GTServiceXRest alloc] init];
//    }
//    if ([identifier isEqualToString:kGTServiceXAudioRest]) {
//        return [[GTServiceXAudioRest alloc] init];
//    }
//    if ([identifier isEqualToString:kGTServiceXPublicRest]) {
//        return [[GTServiceXPublicRest alloc] init];
//    }
//    if ([identifier isEqualToString:kGTServiceXUnread]) {
//        return [[GTServiceXUnread alloc] init];
//    }
//    
//    // broker
//    if ([identifier isEqualToString:kGTServiceBrokerRest]) {
//        return [[GTServiceBrokerRest alloc] init];
//    }
//    if ([identifier isEqualToString:kGTServiceBrokerCorp]) {
//        return [[GTServiceBrokerCorp alloc] init];
//    }
//    if ([identifier isEqualToString:kGTServiceBroker]) {
//        return [[GTServiceBroker alloc] init];
//    }
//    
//    // haozu
//    if ([identifier isEqualToString:kGTServiceHaozu]) {
//        return [[GTServiceHaozu alloc] init];
//    }
//    if ([identifier isEqualToString:kGTServiceHaozuCorp]) {
//        return [[GTServiceHaozuCorp alloc] init];
//    }
//    
//    // xinfang
//    if ([identifier isEqualToString:kGTServiceXinfang]) {
//        return [[GTServiceXinfang alloc] init];
//    }
//    
//    // jinpu
//    if ([identifier isEqualToString:kGTServiceJinpuRest]) {
//        return [[GTServiceJinpuRest alloc] init];
//    }
//    
//    // other
//    if ([identifier isEqualToString:kGTServiceCoordinatorChannel]) {
//        return [[GTServiceCoordinatorChannel alloc] init];
//    }
//    if ([identifier isEqualToString:kGTServiceMarket]) {
//        return [[GTServiceMarket alloc] init];
//    }
//    if ([identifier isEqualToString:kGTServiceMember]) {
//        return [[GTServiceMember alloc] init];
//    }
//    if ([identifier isEqualToString:kGTServiceNotification]) {
//        return [[GTServiceNotification alloc] init];
//    }
//    if ([identifier isEqualToString:kGTServiceTrace]) {
//        return [[GTServiceTrace alloc] init];
//    }
//    if ([identifier isEqualToString:kGTServiceURLChange]) {
//        return [[GTServiceURLChange alloc] init];
//    }
//    
//    // Google Map API
//    if ([identifier isEqualToString:kGTServiceGoogleMapAPIDirections]) {
//        return [[GTServiceGoogleMapDirections alloc] init];
//    }
      // Google Map API
//      if ([identifier isEqualToString:kGTServiceFeedBackRest]) {
//          return [[FeedBackService alloc] init];
//      }
    return nil;
}

@end
