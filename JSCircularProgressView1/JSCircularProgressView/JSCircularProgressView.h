//
//  JSCircularProgressView.h
//  JSCircularProgressView
//
//  Created by Eric Wang on 14/10/31.
//  Copyright (c) 2014年 LinkMob. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JSCircularProgressView : UIView

@property (nonatomic, strong) UIColor *progressColor; // 进度颜色
@property (nonatomic, strong) UIColor *backColor; // 背景颜色

@property (nonatomic, strong) UIColor *textColor; // 字体颜色
@property (nonatomic, strong) UIFont *textFont; // 字体属性

@property (nonatomic) float lineWidth; // 圆环宽度
@property (nonatomic, strong) UILabel *label; // 圆环中央的label

@property (nonatomic) float progress; // 进度

@end
