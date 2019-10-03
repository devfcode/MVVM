//
//  ViewController.m
//  MVVM
//
//  Created by hello on 2019/10/2.
//  Copyright © 2019 Dio. All rights reserved.
//

#import "ViewController.h"
#import "MyView.h"
#import "MyViewModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    MyViewModel *viewModel = [[MyViewModel alloc] init];
    //将view添加到ViewController
    MyView *myView = [[MyView alloc] initWithFrame:self.view.frame viewModel:viewModel];
    [self.view addSubview:myView];
}

@end
