//
//  MyView.h
//  MVVM
//
//  Created by hello on 2019/10/2.
//  Copyright © 2019 Dio. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MyViewModel;

NS_ASSUME_NONNULL_BEGIN

@interface MyView : UIView

-(instancetype)initWithFrame:(CGRect)frame viewModel:(MyViewModel *)viewModel;

@end

NS_ASSUME_NONNULL_END
