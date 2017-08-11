







#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,DDWSAddressType)
{
    DDWSAddressTypeDEV = 0,/**< 开发环境*/
    DDWSAddressTypeQA  = 1,/**< 测试环境*/
    DDWSAddressTypeDIS = 2,/**< 发布环境*/
};



@interface DDWSUtil : NSObject


/**
 *  获取目前的环境
 *
 *  @return 环境类型
 */
+ (DDWSAddressType)addressType;


/**
 *  根据Source.plist文件组装的BaseURL，用于Webservice和本类的urlWithPath
 *
 *  @return BaseURLString
 */
+ (NSString *)baseURL;

/**
 *  将后台回传的path组装成完整的URL（多用于图片路径组装）
 *
 *  @param path 路径
 *
 *  @return 完整的URL
 */
+ (NSURL *)urlWithPath:(NSString *)path;


+ (NSTimeInterval)timeoutInterval;

+ (NSString *)baseServerSchema;

+ (NSString *)baseServerAddressWithType:(DDWSAddressType)type;

/**
 *  各个环境返回代表各环境的前缀，用户Jpush别名
 *
 *  @param type
 *
 *  @return
 */
+ (NSString *)prefixOfAddressType:(DDWSAddressType)type;
/**
 *  NSString值为Unicode格式的字符串编码(如\\u7E8C)转换成中文
 *
 *  @param unicodeStr
 *
 *  @return
 */
+ (NSString *)replaceUnicode:(NSString *)unicodeStr;
@end
