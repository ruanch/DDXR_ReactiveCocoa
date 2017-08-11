/*********************************************************************
 *           Copyright © 2017年 NightElf. All rights reserved.
 *                  Date                Name
 *                 17/2/4             Ruancanghui
 **********************************************************************
 * @文件名称: DDSearchViewController.h
 * @文件描述: 查询控制器
 * @补充说明: 无
 *********************************************************************/

#import "DDSearchViewController.h"
#import "DDSearchDataManager.h"
#import "DDSearchTableView.h"
#import "DDSearchTableViewModel.h"

@interface DDSearchViewController ()<DDSearchTableViewDelegate>{
}

@property (strong, nonatomic) DDSearchTableView *tableView;
@property (strong, nonatomic) DDSearchDataManager *dataManager;

@end

@implementation DDSearchViewController

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

#pragma mark - DDSearchTableViewDelegate
- (void)SearchTableView:(DDSearchTableView *)tableView didSelectedRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%@", indexPath);
    DDSearchViewController *vc = [DDSearchViewController new];
    [self.navigationController pushViewController:vc animated:YES];
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
    DDSearchTableViewModel *vm = [DDSearchTableViewModel viewModelWithRecipes:self.dataManager.recipes];
    [self.tableView bindDataWithViewModel:vm];
}

#pragma mark - getters and setters
- (DDSearchTableView *)tableView{
    if (_tableView == nil) {
        CGSize screenSize = [UIScreen mainScreen].bounds.size;
        _tableView = [[DDSearchTableView alloc] initWithFrame:CGRectMake(0, 0, screenSize.width, screenSize.height)];
        _tableView.delegate = self;
    }
    return _tableView;
}

- (DDSearchDataManager *)dataManager{
    if (_dataManager == nil) {
        _dataManager = [[DDSearchDataManager alloc] init];
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
