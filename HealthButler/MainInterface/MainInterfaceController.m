//
//  MainInterfaceController.m
//  HealthButler
//
//  Created by 夏梦雷 on 17/3/31.
//  Copyright © 2017年 夏梦雷. All rights reserved.
//

#import "MainInterfaceController.h"
#import "StatusViewController.h"

@interface MainInterfaceController ()<UIScrollViewDelegate>

@property (nonatomic, strong)UIScrollView * scrollView;

//系统界面
@property (nonatomic, strong)UIView * systemFaceView;
//蓝色的view
@property (nonatomic, strong)UIView * topSystemFaceView;
//导航栏的view
@property (nonatomic, strong)UIView * topSystemNavigationView;
//导航栏上的按钮
@property (nonatomic, strong)UIButton * navLeftButton;
@property (nonatomic, strong)UIButton * navRightButton;
//系统导航
@property (nonatomic, strong)UIView * systemNavigationView;
//导航视图里面的蓝色View
@property (nonatomic, strong)UIView * topNavigationView;
//导航界面的按钮
@property (nonatomic, strong)UIButton * backButton;


@end

@implementation MainInterfaceController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //不让ScrollView回弹
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    
    //建造主界面
    [self buildInterface];
    //建造系统界面
    [self buildSystemFaceView];
    //建造系统导航界面
    [self buildSystemNavigationView];
}

- (void)viewWillDisappear:(BOOL)animated {

    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

- (void)viewWillAppear:(BOOL)animated {

    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

//建造主界面
- (void)buildInterface {

    _scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    _scrollView.backgroundColor = [UIColor whiteColor];
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.bounces = NO;
    _scrollView.delegate = self;
    _scrollView.pagingEnabled = YES;
//    _scrollView.
    [self.view addSubview:_scrollView];
    //设置ScrollView的内容尺寸
    _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH * 2, SCREEN_HEIGHT);
    //初始化要添加的视图
    _systemFaceView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    _systemFaceView.backgroundColor = [UIColor whiteColor];
    _systemNavigationView = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    _systemNavigationView.backgroundColor = GRAY_COLOR;
    //在ScrollView上面添加视图
    [_scrollView addSubview:_systemFaceView];
    [_scrollView addSubview:_systemNavigationView];
}


//建造系统界面
- (void)buildSystemFaceView {

    //建造topView
    _topSystemFaceView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, HALF_HEIGHT)];
    _topSystemFaceView.backgroundColor = BULE_COLOR;
    [_systemFaceView addSubview:_topSystemFaceView];
//    UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
//    button.backgroundColor = [UIColor whiteColor];
//    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
//    [_topSystemFaceView addSubview:button];
    [self buildTopSystemNavigationView];
    //建造按钮
    NSArray * labelTextName = @[@"机器制水",@"机器水满",@"机器缺水",@"机器正常",@"机器故障",@"机器异常"];
    CGFloat lrSpacing = 50;
    CGFloat contentSpacing = SCREEN_WIDTH - 140;
    CGFloat btnWidth = contentSpacing / 3;
    CGFloat topSpacing = HALF_HEIGHT + 60;
    int arraySuffix = 0;
    for (int i = 0; i < 2; i++) {
        
        for (int j = 0; j < 3; j++) {
            
            UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(lrSpacing + (j * btnWidth) + (j * 20) , topSpacing + (i * btnWidth) + (i * 40), btnWidth, btnWidth)];
            btn.adjustsImageWhenHighlighted = NO;
            [btn setBackgroundImage:[UIImage imageNamed:@"icon"] forState:UIControlStateNormal];
            UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(lrSpacing + (j * btnWidth) + (j * 20), (topSpacing + btnWidth + 5) + (i * btnWidth) + (i * 40), btnWidth, 25)];
            label.text = labelTextName[arraySuffix];
            arraySuffix ++;
            label.font = [UIFont systemFontOfSize:16];
            label.textAlignment = NSTextAlignmentCenter;
            [_systemFaceView addSubview:btn];
            [_systemFaceView addSubview:label];
        }
    }
}
//建造系统界面上面的导航栏
- (void)buildTopSystemNavigationView {

    _topNavigationView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44)];
    _topNavigationView.backgroundColor = BULE_COLOR;
    _topNavigationView.userInteractionEnabled = YES;
    _navLeftButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 20, 32, 32)];
    [_navLeftButton setBackgroundImage:[UIImage imageNamed:@"smile"] forState:UIControlStateNormal];
    [_navLeftButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [_topNavigationView addSubview:_navLeftButton];
    UILabel * titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH / 2 - 60, 20, 120, 30)];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"系统主界面";
    [_topNavigationView addSubview:titleLabel];
    _navRightButton = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 52, 20, 32, 32)];
    [_navRightButton setBackgroundImage:[UIImage imageNamed:@"smile"] forState:UIControlStateNormal];
    [_navRightButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [_topNavigationView addSubview:_navRightButton];
    [_topSystemFaceView addSubview:_topNavigationView];
}

- (void)buttonClick:(UIButton *)btn {

    NSLog(@"我被点击了");
}

//建造系统导航界面
- (void)buildSystemNavigationView {
    
    //我系统导航界面创建topView
    _topNavigationView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT / 3.5)];
    _topNavigationView.backgroundColor = BULE_COLOR;
    //添加导航界面
    [self buildNavigationForButtonAndTitleView];
    [_systemNavigationView addSubview:_topNavigationView];
    //循环创建按钮
    CGFloat topSpacing = SCREEN_HEIGHT / 3.5;
    CGFloat btnWidth = (SCREEN_WIDTH - 1) /2;
    CGFloat btnHeight = (SCREEN_HEIGHT - topSpacing - 2) / 3;
    int navigationBtnTag = 0;
    for (int i = 0; i < 3; i++) {
        
        for (int j = 0; j < 2; j++) {
            
            UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake((btnWidth * j) + (j * 1), topSpacing + (btnHeight * i) + (i * 1), btnWidth, btnHeight)];
            btn.tag = 401 + navigationBtnTag;
            navigationBtnTag ++;
            btn.adjustsImageWhenHighlighted = NO;
            [btn setBackgroundImage:[UIImage imageNamed:@"icon2"] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(systemNavigationBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            [_systemNavigationView addSubview:btn];
        }
    }
}

//建造导航页面的导航栏
- (void)buildNavigationForButtonAndTitleView {

    _backButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 20, 32, 32)];
    [_backButton setBackgroundImage:[UIImage imageNamed:@"backIcon"] forState:UIControlStateNormal];
    [_backButton addTarget:self action:@selector(backButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [_topNavigationView addSubview:_backButton];
    UILabel * navigationLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH / 2 - 60, 20, 120, 30)];
    navigationLabel.textAlignment = NSTextAlignmentCenter;
    navigationLabel.textColor = [UIColor whiteColor];
    navigationLabel.text = @"系统导航";
    [_topNavigationView addSubview:navigationLabel];
}

//返回界面按钮事件
- (void)backButtonClick:(UIButton *)btn {

    [UIView animateWithDuration:0.4 animations:^{
       
        _scrollView.contentOffset = CGPointMake(0, 0);
    }];
}

//导航界面按钮事件
- (void)systemNavigationBtnClick:(UIButton *)btn {
    
    if (btn.tag == 401) {
        
        StatusViewController * status = [[StatusViewController alloc] init];
        [self.navigationController pushViewController:status animated:YES];
    }
}

#pragma mark - ScrollViewDelegate
//根据ScrollView的移动代理来选择每个页面需要作出的改变
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
}

@end
