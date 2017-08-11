//
//  Test1ViewController.m
//  MyLayout
//
//  Created by oybq on 15/6/21.
//  Copyright (c) 2015年 YoungSoft. All rights reserved.
//

#import "DDLoginRXViewController.h"
#import "DDLoginRXView.h"
#import "DDLoginRXViewModel.h"
#import "DDNoticeViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#define SELF_VIEW (DDLoginRXView *)self.view
@interface DDLoginRXViewController ()<DDLoginRXViewDelegate>
{
    
}

@property(nonatomic,strong)DDLoginRXViewModel *viewModel;
@end

@implementation DDLoginRXViewController

-(void)loadView
{
    self.edgesForExtendedLayout = UIRectEdgeNone;
   
    DDLoginRXView *view = [[DDLoginRXView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    view.delegate = self;
    self.view = view;
    
  
      
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"登录";
    
    _viewModel = [[DDLoginRXViewModel alloc] init];
    DDLoginRXView *view = (DDLoginRXView *)self.view;
    [view bindDataWithViewModel:_viewModel];
    [self bindViewModelToChangeView];
}

- (void)bindViewModelToChangeView
{
    /// kvo
//    _KVOController = [FBKVOController controllerWithObserver:self];
//    __weak DDLoginRXView *weakSelf = self;
//    /// binding self.viewModel.avatarUrlString
//    [_KVOController mh_observe:self.viewModel keyPath:@"avatarUrlString" block:^(id  _Nullable observer, id  _Nonnull object, NSDictionary<NSString *,id> * _Nonnull change) {
//        NSLog(@"123123");
//        //NSLog(@"%@",change[NSKeyValueChangeNewKey]);
//        //[MHWebImageTool setImageWithURL:change[NSKeyValueChangeNewKey] placeholderImage:placeholderUserIcon() imageView:weakSelf.viewModel.userAvatar];
//    }];
    
    
    
    @weakify(self);
    
    /// 判定数据
    [RACObserve(self.viewModel, avatarUrlString) subscribeNext:^(NSString *avatarUrlString) {
        @strongify(self);
        //[MHWebImageTool setImageWithURL:avatarUrlString placeholderImage:placeholderUserIcon() imageView:self.userAvatar];
        [SELF_VIEW changeHeaderImageView:avatarUrlString];
        NSLog(@"avatarUrlString:%@",avatarUrlString);
    }];

    RAC(self.viewModel , mobilePhone) = [RACSignal merge:@[RACObserve(((DDLoginRXView*)self.view).userNameTF, text),((DDLoginRXView*)self.view).userNameTF.rac_textSignal]];
    RAC(self.viewModel , verifyCode) = [RACSignal merge:@[RACObserve(((DDLoginRXView*)self.view).verfiyCodeTF, text),((DDLoginRXView*)self.view).verfiyCodeTF.rac_textSignal]];
    
    
    //处理按钮事件
    RAC([SELF_VIEW loginBtn] , enabled) = self.viewModel.validLoginSignal;
    RAC([SELF_VIEW loginBtn] , alpha) = self.viewModel.validLoginSignal;
    [[[[SELF_VIEW loginBtn] rac_signalForControlEvents:UIControlEventTouchUpInside]
      doNext:^(id x) {
          @strongify(self);
          [self.view endEditing:YES];
          //[MBProgressHUD mh_showProgressHUD:@"Loading..."];
          NSLog(@"loading...");
      }]
     subscribeNext:^(UIButton *sender) {
         @strongify(self);
         [self.viewModel.loginCommand execute:nil];
     }];
    
    /// 数据成功
    [self.viewModel.loginCommand.executionSignals.switchToLatest
     subscribeNext:^(id x) {
         @strongify(self);
         //[MBProgressHUD mh_hideHUD];
         /// 跳转
         DDNoticeViewController *notice = [[DDNoticeViewController alloc] init];
         [self.navigationController pushViewController:notice animated:YES];
     }];
    
    /// 错误信息
    [self.viewModel.loginCommand.errors subscribeNext:^(NSError *error) {
        /// 处理验证错误的error
        if ([error.domain isEqualToString:@"7438"]) {
            //[MBProgressHUD mh_showTips:error.userInfo[SUCommandErrorUserInfoKey]];
            NSLog(@"报错了....");
            return ;
        }
        //[MBProgressHUD mh_showErrorTips:error];
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)textFieldValueDidChanged:(DDLoginRXView *)loginView changeTextFiled:(UITextField *)sender
{
    //self.viewModel.mobilePhone = sender.text;
    //self.viewModel.verifyCode = _verfiyCodeTF.text;
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
