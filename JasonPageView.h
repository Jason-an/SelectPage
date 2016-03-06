//
//  JasonPageView.h
//  快赚
//
//  Created by System Administrator on 16/1/9.
//  Copyright © 2016年 JasoAn. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^btnBlock)(UIButton *btnTag);

@interface JasonPageView : UIView
/**
 *  btn 与 底部线的比例/默认比例为  btn 与 线   9：1/
 */
@property(nonatomic,assign) CGFloat btnPoint;

/**
 *  底部线的 颜色 /默认为 橘黄色/
 */
@property(nonatomic,strong) UIColor *lineColor;
/**
 *  按钮的 背景色 颜色
 */
@property(nonatomic,strong) UIColor *btnBgColor;
/**
 *  设置 动画时间 /默认时间为 0.3秒/
 */
@property(nonatomic,assign) float pageTimer;
/**
 *  要执行的事情
 */
@property(nonatomic,copy) btnBlock btnblock;

/**
 *  是否需要动画 /默认为 有动画/
 */
@property(nonatomic,assign) BOOL isAnimation;
/**
 *  btn title 数组
 */
@property(nonatomic,strong) NSArray *buttonTitle;

@end

