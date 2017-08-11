//
//  Test1ViewController.m
//  MyLayout
//
//  Created by oybq on 15/6/21.
//  Copyright (c) 2015年 YoungSoft. All rights reserved.
//

#import "DDLoginViewController.h"
#import "DDLoginView.h"


@interface DDLoginViewController ()<DDLoginViewDelegate>
{
        FBKVOController * _KVOController;
}

@property(nonatomic,strong)DDLoginViewModel *viewModel;
@end

@implementation DDLoginViewController

-(void)loadView
{
    self.edgesForExtendedLayout = UIRectEdgeNone;
   
    DDLoginView *view = [[DDLoginView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    view.delegate = self;
    self.view = view;
    
  
      
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"登录";
    
    _viewModel = [[DDLoginViewModel alloc] init];
    DDLoginView *view = (DDLoginView *)self.view;
    [view bindDataWithViewModel:_viewModel];
    [self bindViewModelToChangeView];
}

- (void)bindViewModelToChangeView
{
    /// kvo
    _KVOController = [FBKVOController controllerWithObserver:self];
    __weak DDLoginView *weakSelf = self;
    /// binding self.viewModel.avatarUrlString
    [_KVOController mh_observe:self.viewModel keyPath:@"avatarUrlString" block:^(id  _Nullable observer, id  _Nonnull object, NSDictionary<NSString *,id> * _Nonnull change) {
        NSLog(@"123123");
        //NSLog(@"%@",change[NSKeyValueChangeNewKey]);
        //[MHWebImageTool setImageWithURL:change[NSKeyValueChangeNewKey] placeholderImage:placeholderUserIcon() imageView:weakSelf.viewModel.userAvatar];
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)textFieldValueDidChanged:(DDLoginView *)loginView changeTextFiled:(UITextField *)sender
{
    self.viewModel.mobilePhone = sender.text;
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
