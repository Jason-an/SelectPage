//
//  JasonPageView.m
//  快赚
//
//  Created by System Administrator on 16/1/9.
//  Copyright © 2016年 JasoAn. All rights reserved.
//

//父View的宽高
#define viewW self.frame.size.width
#define viewH self.frame.size.height
//定义btn 宽高
#define btnW  viewW/self.buttonTitle.count
#define btnH  viewH*_btnPoint

#import "JasonPageView.h"


@interface JasonPageView()

//线 view
@property(nonatomic,strong) UIView *lineView;

//判断 btn 选中的 中间变量
@property(nonatomic,assign) NSInteger btnIndex;

//判断是否 执行过 点击 **防止在layoutsub里边执行两次
@property(nonatomic,assign) BOOL isClick;

@end


@implementation JasonPageView

-(instancetype)init{

    if (self=[super init]) {
        
        //设置背景色
        self.backgroundColor=[UIColor grayColor];
        //初始化动画时间
        self.pageTimer=0.2;
        //初始化 动画 为 yes
        self.isAnimation=YES;
        //初始化 比例 为 0.9
        self.btnPoint=0.9;
        
        //防止多次刷新
        self.isClick=YES;
        
    }
    return self;

}

-(void)layoutSubviews{

    [super layoutSubviews];
    //设置 btn 位置
    [self setBtnFrem];
    
    //设置 线 的位置
    [self lineFrem];
}


/**
 *  设置btn 位置
 */
-(void)setBtnFrem{
    
    CGFloat btnY=0;
    
    for (int index=0; index<self.subviews.count; index++) {
        

        if ([self.subviews[index] isKindOfClass:[UIButton class]]) {
            CGFloat btnX=index*btnW;
            //设置 button 位置
            UIButton *btn=self.subviews[index];
            btn.frame=CGRectMake(btnX, btnY, btnW, btnH);
            if (index==0) {
                if (self.isClick==YES) {
                    [self pageBtnClick:btn];
                    self.isClick=NO;
                    btn.selected=YES;
                }
            }
            
        }
    }
}

/**
 *  线的 位置
 */
-(void)lineFrem{

    //设置线的颜色
    if (self.lineColor!=nil) {
        self.lineView.backgroundColor=self.lineColor;
    }
    //设置线的 初始 位置
    self.lineView.frame=CGRectMake(0, btnH, btnW, viewH-btnH);
    
}

/**
 *  重写 buttonTitle 数组 set方法
 *
 */
-(void)setButtonTitle:(NSArray *)buttonTitle{
    
    _buttonTitle=buttonTitle;

    for (int index=0;index<buttonTitle.count ; index++) {
        
        UIButton *btn=[[UIButton alloc]init];
        btn.backgroundColor=_btnBgColor;
        [btn setTitle:buttonTitle[index] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(pageBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag=index;
        btn.layer.borderColor=[UIColor blackColor].CGColor;
        btn.layer.borderWidth=0.5;
        [self addSubview:btn];
    }
    //添加 线
    UIView *lineView=[[UIView alloc]init];
    lineView.backgroundColor=[UIColor orangeColor];
    [self addSubview:lineView];
    self.lineView=lineView;
}

/**
 *  btn 的点击
 */
-(void)pageBtnClick:(UIButton *)btn{
    
    for (UIView *btn in self.subviews) {
        
        if ([btn isKindOfClass:[UIButton class]]) {
            ((UIButton *)btn).selected=NO;
        }
    }
    
    btn.selected=YES;
    
    /**
     *  判断是否 需要动画
     */
    if(self.isAnimation)
    {
        [UIView animateWithDuration:self.pageTimer animations:^{
           
            //设置 btn 的 x 为 n倍的 btn宽度
            CGRect rect=self.lineView.frame;
            rect.origin.x=btnW*btn.tag;
            self.lineView.frame=rect;
            
        }];
    }else {
    
        //设置 btn 的 x 为 n倍的 btn宽度
        CGRect rect=self.lineView.frame;
        rect.origin.x=btnW*btn.tag;
        self.lineView.frame=rect;
    
    }
    
    self.btnblock(btn);
    
}


#pragma mark - 设置属性

-(void)setpageTimer:(float)pageTimer{

    _pageTimer=pageTimer;

}

-(void)setLineColor:(UIColor *)lineColor{

    _lineColor=lineColor;
}

-(void)setIsAnimation:(BOOL)isAnimation{

    _isAnimation=isAnimation;
}

-(void)setBtnPoint:(CGFloat)btnPoint{

    _btnPoint=btnPoint;
}
-(void)setBtnBgColor:(UIColor *)btnBgColor{

    _btnBgColor=btnBgColor;
}


@end

