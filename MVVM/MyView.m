//
//  MyView.m
//  MVVM
//
//  Created by hello on 2019/10/2.
//  Copyright © 2019 Dio. All rights reserved.
//

#import "MyView.h"
#import "MyViewModel.h"

@interface MyView()

@property(nonatomic, strong)UIButton *btn;
@property(nonatomic, strong)UILabel *label;
@property(nonatomic, strong)MyViewModel *viewModel;

@end

@implementation MyView

-(instancetype)initWithFrame:(CGRect)frame viewModel:(MyViewModel *)viewModel{
    self = [super initWithFrame:frame];
    if (self) {
        [self initViews];
        [self initViewModel:viewModel];
    }
    return self;
}

//初始化视图
-(void)initViews{
    //设置可点击的button
    self.btn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btn.frame = CGRectMake((self.frame.size.width - 100)/2, 200, 100, 40);
    self.btn.backgroundColor = [UIColor blueColor];
    [self.btn setTitle:@"点击刷新" forState:UIControlStateNormal];
    [self.btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.btn];
    
    //设置label
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(30, 300, self.frame.size.width-60, 30)];
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.backgroundColor = [UIColor redColor];
    [self addSubview:self.label];
}

//button的点击响应方法
-(void)btnAction{
    NSLog(@"点击响应了");
    [self.viewModel requestData];
}

//被始化ViewModel,并将ViewModel与视图通过通知绑定
-(void)initViewModel:(MyViewModel *)viewModel{
    self.viewModel = viewModel;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshView:) name:@"requestNNModel" object:nil];
}

//接到通知后更新视图
- (void)refreshView:(NSNotification *)nofi {
    NSString *value = [nofi.userInfo objectForKey:@"label"];
    //在主线程刷新UI界面
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        self.label.text = value;
    });
}

//此视图销毁时移出通知
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
