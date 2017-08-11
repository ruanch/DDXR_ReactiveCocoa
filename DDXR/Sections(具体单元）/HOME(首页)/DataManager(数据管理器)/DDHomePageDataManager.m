/*********************************************************************
 *           Copyright © 2017年 NightElf. All rights reserved.
 *                  Date                Name
 *                 17/2/4             Ruancanghui
 **********************************************************************
 * @文件名称: DDHomePageDataManager.m
 * @文件描述: 处理主页上的所有数据相关的处理
 * @补充说明: 无
 *********************************************************************/

#import "DDHomePageDataManager.h"
//#import <AFNetworking/AFNetworking.h>
#import "Recipe.h"
#import "DDHeader.h"



@interface DDHomePageDataManager()

@property(nonatomic,strong)HomeAPIManager *homeApiManager;
@end

@implementation DDHomePageDataManager

- (instancetype)init{
    self = [super init];
    if (self) {
        self.recipes = [[NSArray alloc] init];
    }
    return self;
}
//请求数据
- (void)requestDataWhenSuccess:(Success)success fail:(Fail)fail{
   
    [super requestDataWhenSuccess:success fail:fail];
    
    self.parameter= @{@"key" : @"ece65c27ede91b57c652f30b59ed5dcd",
                      @"menu" : @"炒鸡蛋",};
    [self.homeApiManager loadData];
}
    


    
- (void)managerCallAPIDidSuccess:(GTAPIBaseManager *)manager
    {
        DDLog(@"调用成功");
        NSDictionary *data = [manager fetchDataWithReformer:nil];
        [self generateRecipeWithResponseData:data];
        [super managerCallAPIDidSuccess:manager];
    }
- (void)managerCallAPIDidFailed:(GTAPIBaseManager *)manager
    {
        DDLog(@"调用失败");
        DDLog(@"%lu:%@",(unsigned long)manager.errorType,manager.errorMessage);
        self.fail(manager.errorType,manager.errorMessage);
        [super managerCallAPIDidFailed:manager];
    }

// 加工获取到的数据
- (void)generateRecipeWithResponseData:(id)responseObj{
    if ([responseObj isKindOfClass:[NSDictionary class]]) {
        
        
        NSDictionary *responseDic = (NSDictionary *)responseObj;
        
        NSString *resultCode = responseDic[@"resultcode"];
        if ([resultCode intValue] != 1) {
            return;
        }
        
        NSDictionary *resultDic = responseDic[@"result"];
        NSArray *dataArr = resultDic[@"data"];
        NSMutableArray *recipeArr = [[NSMutableArray alloc] init];
        for (NSDictionary *dic in dataArr) {
            Recipe *recipe = [[Recipe alloc] init];
            recipe.recipeId = dic[@"id"];
            recipe.recipeTitle = dic[@"title"];
            recipe.recipeTags = dic[@"tags"];
            recipe.recipeDesc = dic[@"imtro"];
            recipe.recipeAlbum = dic[@"albums"][0];
            [recipeArr addObject:recipe];
        }
        self.recipes = recipeArr;
    }
}
    

#pragma mark - getter/setter
- (NSArray<Recipe *> *)recipes{
    if (!_recipes) {
        _recipes = [[NSArray alloc] init];
    }
    return _recipes;
}
    
-(HomeAPIManager *)homeApiManager
    {
        if (!_homeApiManager) {
            _homeApiManager = [[HomeAPIManager alloc] init];
            _homeApiManager.delegate = self;
            _homeApiManager.paramSource = self;
            _homeApiManager.validator = self;
            _homeApiManager.interceptor = self;
        }
        return _homeApiManager;
    }
@end
