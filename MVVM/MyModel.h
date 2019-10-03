//
//  MyModel.h
//  MVVM
//
//  Created by hello on 2019/10/2.
//  Copyright © 2019 Dio. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyModel : NSObject

@property (nonatomic, copy) NSString *nickName;
@property (nonatomic, assign) NSInteger age;
@property (nonatomic, assign) NSInteger height;

@end

NS_ASSUME_NONNULL_END
