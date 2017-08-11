/*********************************************************************
 *         Copyright © 2015年 NetDragon. All rights reserved.
 *                  Date                Name
 *                  14/3/1             GT-ruan
 **********************************************************************
 * @文件名称: GTCityListManager.h
 * @文件描述: 无
 * @补充说明: 无
 *********************************************************************/
#import "GTAPIBaseManager.h"
#import <CoreLocation/CoreLocation.h>
#import <UIKit/UIKit.h>
@interface GTCityListManager : GTAPIBaseManager<GTAPIManager, GTAPIManagerApiCallBackDelegate, GTAPIManagerParamSourceDelegate, GTAPIManagerValidator>

- (NSDictionary *)cityWithLocation:(CLLocation *)location;
- (NSDictionary *)cityInfoWithCityId:(NSString *)cityId;
- (NSDictionary *)cityInfoWithCityName:(NSString *)cityName;

- (NSArray *)cities;
- (CLLocation *)cityLocationWithCityId:(NSString *)cityId;
- (CGPoint)cityOffsetWithCityId:(NSString *)cityId;
- (NSString *)cityNameWithCityId:(NSString *)cityId;

- (NSDictionary *)cityIsOpenWithCityId:(NSString *)cityId;

- (BOOL)isLocation:(CLLocation *)location inCity:(NSString *)cityId;

//在程序进入后台的时候会把当前城市数据保存起来，用于下次打开的时候显示上次关闭时候的城市。
- (void)saveCityToPlistWithData:(NSDictionary *)cityData;
- (NSDictionary *)loadCurrentCityDataFromPlist;

@end
