# SelectPage
选项卡
![演示](https://github.com/Jason-an/SelectPage/blob/master/selectPage.gif)
#使用方法
    NSArray *arr=[NSArray array];
    arr=@[@"第一个",@"第二个",@"第三个",@"第四个",@"第五个"];
    JasonPageView  *jasPage=[[JasonPageView alloc]init];
    //设置按钮的背景色
    jasPage.btnBgColor=[UIColor whiteColor];
    //设置 title
    jasPage.buttonTitle=arr;
    //设置 比例
    jasPage.btnPoint=0.9;
    //设置动画时间
    jasPage.pageTimer=0.5;
    //设置是否 有动画
    jasPage.isAnimation=YES;
    //设置线的颜色
    jasPage.lineColor=[UIColor redColor];
    
    jasPage.frame=CGRectMake(0,64,self.view.frame.size.width,40);
    [self.view addSubview:jasPage];
    jasPage.btnblock=^(UIButton *btn){
    
        //实现 按钮 方法
    
    };
