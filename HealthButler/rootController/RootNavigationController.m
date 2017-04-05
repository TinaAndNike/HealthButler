//
//  RootNavigationController.m
//  HealthButler
//
//  Created by 夏梦雷 on 17/4/4.
//  Copyright © 2017年 夏梦雷. All rights reserved.
//

#import "RootNavigationController.h"

@interface RootNavigationController ()<UINavigationControllerDelegate>

@end

@implementation RootNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self settingNavigation];
    self.delegate = self;
}

- (void)settingNavigation {

    UIImageView * navImageView = self.navigationBar.subviews.firstObject;
    navImageView.alpha = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
