







#import "DDWSUtil.h"
#import "DDMacros.h"


static NSString *const kBaseServerAddressDevlopment       = @"Base Server Address Development";
static NSString *const kBaseServerAddressQualityAssurance = @"Base Server Address QA";
static NSString *const kBaseServerAddressDistribute       = @"Base Server Address Production";

static NSString *const kUATEnviromentOnRelease            = @"UAT Environment On Release";

static NSString *const kBaseServerSchema = @"Base Server Schema";
static NSString *const kTimeOutInterval  = @"Time Out Interval";

static NSString *const DD_CONFIG  = @"DDConfig";
static NSString *const PLIST      = @"plist";

@implementation DDWSUtil

#pragma mark - Public

+ (NSString *)baseURL
{

    NSString *baseUrlString = [NSString stringWithFormat:@"%@%@",
                               [DDWSUtil baseServerSchema],
                               [DDWSUtil baseServerAddressWithType:[DDWSUtil addressType]]];
    return baseUrlString;
}

+ (DDWSAddressType)addressType
{
//#if DEBUG
    DDWSAddressType type = DDWSAddressTypeDEV;
//#else
//    BOOL uatEnvironmentOnRelease = [[[DDWSUtil readConfig] objectForKey:kUATEnviromentOnRelease] boolValue];
//    DDWSAddressType type = uatEnvironmentOnRelease ? DDWSAddressTypeQA : DDWSAddressTypeDIS;
//#endif
    return type;
}

+ (NSString *)prefixOfAddressType:(DDWSAddressType)type
{
    switch (type)
    {
        case DDWSAddressTypeQA: return @"uat_";
        case DDWSAddressTypeDEV: return @"dev_";
        case DDWSAddressTypeDIS: return @"prod_";
    }
}

+ (NSURL *)urlWithPath:(NSString *)path
{
    NSString *urlString = [NSString stringWithFormat:@"%@%@",[DDWSUtil baseURL],path];
    return [NSURL URLWithString:urlString];
}


+ (NSTimeInterval)timeoutInterval
{
    return [[[DDWSUtil readConfig] objectForKey:kTimeOutInterval] doubleValue];
}

+ (NSString *)baseServerSchema;
{
    return [[DDWSUtil readConfig] objectForKey:kBaseServerSchema];
}

+ (NSString *)baseServerAddressWithType:(DDWSAddressType)type;
{
    switch (type)
    {
        case DDWSAddressTypeDEV: return [[DDWSUtil readConfig] objectForKey:kBaseServerAddressDevlopment];
        case DDWSAddressTypeQA: return [[DDWSUtil readConfig] objectForKey:kBaseServerAddressQualityAssurance];
        case DDWSAddressTypeDIS: return [[DDWSUtil readConfig] objectForKey:kBaseServerAddressDistribute];
    }
    return nil;
}

/**
 *  NSString值为Unicode格式的字符串编码(如\\u7E8C)转换成中文
 *
 *  @param unicodeStr
 *
 *  @return
 */
+ (NSString *)replaceUnicode:(NSString *)unicodeStr
{    
    if (!DD_IS_NULL(unicodeStr))
    {
        NSString *tempStr1 = [unicodeStr stringByReplacingOccurrencesOfString:@"\\u" withString:@"\\U"];
        NSString *tempStr2 = [tempStr1 stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
        NSString *tempStr3 = [[@"\"" stringByAppendingString:tempStr2] stringByAppendingString:@"\""];
        NSData *tempData = [tempStr3 dataUsingEncoding:NSUTF8StringEncoding];
        NSString* returnStr = [NSPropertyListSerialization propertyListWithData:tempData options:NSPropertyListImmutable format:NULL error:NULL];
        return [returnStr stringByReplacingOccurrencesOfString:@"\\r\\n" withString:@"\n"];
    }
    else
    {
        return nil;
    }
}


#pragma mark - Private

+ (NSMutableDictionary *)readConfig
{
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:DD_CONFIG ofType:PLIST];
    NSMutableDictionary *readData = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
    return readData;
}

@end
