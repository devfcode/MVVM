//
//  MyViewModel.m
//  MVVM
//
//  Created by hello on 2019/10/2.
//  Copyright © 2019 Dio. All rights reserved.
//

#import "MyViewModel.h"
#import "MyModel.h"

@implementation MyViewModel

/** 模拟网络请求 */
- (void)requestData {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        //将请求下来的JSON解析后,得到一个model(注这里是模拟网络请求,就没有解析的过程)
        MyModel *model = [[MyModel alloc] init];
        model.nickName = [NSString stringWithFormat:@"%u号", (arc4random() % 6)];
        model.age = arc4random() % 100;
        model.height = arc4random() % 20 + 160;
        
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        NSString *valueStr = [self handleData:model];
        [dict setValue:valueStr forKey:@"label"];
        //将最终数据传到View层
        [[NSNotificationCenter defaultCenter] postNotificationName:@"requestNNModel" object:self userInfo:dict];
    });
}

//把数据处理也放在ViewModel层
-(NSString *)handleData:(MyModel *)model {
    NSString *str = [NSString stringWithFormat:@"昵称:%@ 年龄:%ld 身高:%ld", model.nickName, model.age, model.height];
    return str;
}

@end
