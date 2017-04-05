//
//  StatusViewController.m
//  HealthButler
//
//  Created by 夏梦雷 on 17/4/4.
//  Copyright © 2017年 夏梦雷. All rights reserved.
//

#import "StatusViewController.h"

@interface StatusViewController ()

@end

@implementation StatusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"backIcon"] style:UIBarButtonItemStyleDone target:self action:@selector(itemClick:)];
    self.navigationItem.leftBarButtonItem = item;
    // Do any additional setup after loading the view.
}

- (void)itemClick:(UIBarButtonItem *)itemBtn {

    [self.navigationController popViewControllerAnimated:YES];
    self.imageView.alpha = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
