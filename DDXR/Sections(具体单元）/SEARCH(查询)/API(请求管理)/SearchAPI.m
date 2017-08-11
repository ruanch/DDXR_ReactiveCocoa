/*********************************************************************
 *         Copyright © 2015年  All rights reserved.
 *                  Date                Name
 *                  14/3/1             Ruancanghui
 **********************************************************************
 * @文件名称: SearchAPI.h
 * @文件描述: 用于查询请求配置文件
 * @补充说明: 无
 *********************************************************************/

#import "SearchAPI.h"

@implementation SearchAPI{
    NSString *_key;
    NSString *_menu;
}

- (id)initWithKey:(NSString *)key andMenu:(NSString *)menu{
    self = [super init];
    if (self) {
        _key = key;
        _menu = menu;
    }
    return self;
}

- (NSString *)requestUrl {
    return @"/cook/query";
}

/*
- (NSArray *)ignoreArgumentNames
{
    return @[@"telNum"];
}
*/
- (NSDictionary *)configArguments
{
    return @{@"key" : _key,@"menu" : _menu};
}

- (NSInteger)cacheTimeInSeconds {
    return 60 * 3;
}
@end
