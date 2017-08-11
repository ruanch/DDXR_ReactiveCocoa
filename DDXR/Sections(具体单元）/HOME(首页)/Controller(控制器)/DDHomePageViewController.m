/*********************************************************************
 *           Copyright © 2017年 NightElf. All rights reserved.
 *                  Date                Name
 *                 17/2/4             Ruancanghui
 **********************************************************************
 * @文件名称: DDHomePageViewController.h
 * @文件描述: 首页控制器
 * @补充说明: 无
 *********************************************************************/

#import "DDHomePageViewController.h"
#import "DDHomePageDataManager.h"
#import "DDHomePageTableView.h"
#import "DDHomePageTableViewModel.h"

@interface DDHomePageViewController ()<DDHomePageTableViewDelegate>{
}

@property (strong, nonatomic) DDHomePageTableView *tableView;
@property (strong, nonatomic) DDHomePageDataManager *dataManager;

@end

@implementation DDHomePageViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"首页";
    [self.view addSubview:self.tableView];
    [self fetchRecipeData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - DDHomePageTableViewDelegate
- (void)homePageTableView:(DDHomePageTableView *)tableView didSelectedRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%@", indexPath);
}
#pragma mark - private method
// 获取食谱数据
- (void)fetchRecipeData{
    [self.dataManager requestDataWhenSuccess:^(){
        if (self.dataManager.recipes.count > 0) {
            [self renderRecipeView];
        }
    } fail:^(NSInteger code,NSString *message){
        NSLog(@"报错了%@",message);
    }];
}

// 装配食谱视图
- (void)renderRecipeView{
    DDHomePageTableViewModel *vm = [DDHomePageTableViewModel viewModelWithRecipes:self.dataManager.recipes];
    [self.tableView bindDataWithViewModel:vm];
}

#pragma mark - getters and setters
- (DDHomePageTableView *)tableView{
    if (_tableView == nil) {
        CGSize screenSize = [UIScreen mainScreen].bounds.size;
        _tableView = [[DDHomePageTableView alloc] initWithFrame:CGRectMake(0, 0, screenSize.width, screenSize.height)];
        _tableView.delegate = self;
    }
    return _tableView;
}

- (DDHomePageDataManager *)dataManager{
    if (_dataManager == nil) {
        _dataManager = [[DDHomePageDataManager alloc] init];
    }
    return _dataManager;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
